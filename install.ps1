[CmdletBinding()]
param(
    [string]$Version,
    [string]$InstallDir = (Join-Path $HOME "bin"),
    [switch]$DryRun,
    [switch]$Uninstall,
    [switch]$Yes
)

$ErrorActionPreference = "Stop"
$project = "hduhelp-cli"
$metadataUrl = if ($env:HDUHELP_INSTALL_METADATA_URL) { $env:HDUHELP_INSTALL_METADATA_URL } else { "https://raw.githubusercontent.com/hduhelp/cli/main/version.json" }
$releaseBaseUrl = if ($env:HDUHELP_INSTALL_RELEASE_BASE_URL) { $env:HDUHELP_INSTALL_RELEASE_BASE_URL } else { "https://github.com/hduhelp/cli/releases/download" }
$homePath = [System.IO.Path]::GetFullPath($HOME).TrimEnd("\", "/")
$homePrefix = "$homePath\"
$localAppData = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } else { Join-Path $homePath "AppData\Local" }
$appData = if ($env:APPDATA) { $env:APPDATA } else { Join-Path $homePath "AppData\Roaming" }
$stateDir = Join-Path $localAppData "hduhelp-cli-installer"
$stateFile = Join-Path $stateDir "install.json"

function Fail([string]$Message) {
    throw "$project installer: $Message"
}

function Assert-HomePath([string]$Path) {
    if ([string]::IsNullOrWhiteSpace($Path)) {
        Fail "path is required"
    }
    $fullPath = [System.IO.Path]::GetFullPath($Path)
    if (-not $fullPath.StartsWith($homePrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        Fail "path must be inside HOME: $Path"
    }
    return $fullPath
}

function Assert-SafeRemovalPath([string]$Path) {
    $fullPath = Assert-HomePath $Path
    $parent = [System.IO.Path]::GetDirectoryName($fullPath)
    $relativeParent = if ($parent -eq $homePath) { "" } else { $parent.Substring($homePrefix.Length) }
    $cursor = $homePath
    if ($relativeParent) {
        foreach ($part in $relativeParent.Split("\", [System.StringSplitOptions]::RemoveEmptyEntries)) {
            $cursor = Join-Path $cursor $part
            if (-not (Test-Path -LiteralPath $cursor)) {
                break
            }
            $item = Get-Item -LiteralPath $cursor -Force
            if (($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
                Fail "removal path crosses a reparse point: $Path"
            }
        }
    }
    return $fullPath
}

function Remove-ManagedPath([string]$Path) {
    if (Test-Path -LiteralPath $Path) {
        Remove-Item -LiteralPath $Path -Recurse -Force
        Write-Host "removed: $Path"
    } else {
        Write-Host "not present: $Path"
    }
}

if ($Uninstall) {
    if (Test-Path -LiteralPath $stateFile -PathType Leaf) {
        try {
            $saved = Get-Content -LiteralPath $stateFile -Raw | ConvertFrom-Json
            if ($saved.install_dir) {
                $InstallDir = [string]$saved.install_dir
            }
        } catch {
            Fail "cannot read install state"
        }
    }

    $installDir = Assert-SafeRemovalPath $InstallDir
    $binary = Join-Path $installDir "$project.exe"
    if ($env:HDUHELP_CLI_CONFIG) {
        $configTarget = $env:HDUHELP_CLI_CONFIG
        if (Test-Path -LiteralPath $configTarget -PathType Container) {
            Fail "HDUHELP_CLI_CONFIG must name a config file, not a directory"
        }
    } else {
        $configTarget = Join-Path $appData "hduhelp"
    }
    $legacySkills = Join-Path (Join-Path $homePath ".config") "hduhelp"
    $targets = @($binary, $configTarget, $legacySkills, $stateDir) |
        ForEach-Object { Assert-SafeRemovalPath $_ } |
        Select-Object -Unique

    Write-Host "The following paths will be removed:"
    $targets | ForEach-Object { Write-Host "  $_" }
    if ($DryRun) {
        exit 0
    }
    if (-not $Yes) {
        $answer = Read-Host "Type remove to continue"
        if ($answer -ne "remove") {
            Fail "uninstall cancelled"
        }
    }
    $targets | ForEach-Object { Remove-ManagedPath $_ }
    exit 0
}

$installDir = Assert-HomePath $InstallDir
$architecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture.ToString()
switch ($architecture) {
    "X64" { $target = "windows_amd64"; break }
    "Arm64" { $target = "windows_arm64"; break }
    default { Fail "unsupported architecture: $architecture" }
}

if (-not $Version) {
    try {
        $Version = [string](Invoke-RestMethod -Uri $metadataUrl).version
    } catch {
        Fail "unable to download version metadata"
    }
}
if ($Version -notmatch "^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$") {
    Fail "invalid version: $Version"
}

$archive = $project + "_" + $Version + "_" + $target + ".zip"
$releaseUrl = "$releaseBaseUrl/v$Version"
if ($DryRun) {
    Write-Host "version: $Version"
    Write-Host "archive: $archive"
    Write-Host "install dir: $installDir"
    Write-Host "release: $releaseUrl"
    exit 0
}

$work = Join-Path ([System.IO.Path]::GetTempPath()) "$project-$([System.Guid]::NewGuid())"
New-Item -ItemType Directory -Path $work -Force | Out-Null
try {
    $archivePath = Join-Path $work $archive
    try {
        Invoke-WebRequest -Uri "$releaseUrl/$archive" -OutFile $archivePath -UseBasicParsing
    } catch {
        Fail "unable to download $archive"
    }
    $checksumsPath = Join-Path $work "SHA256SUMS"
    try {
        Invoke-WebRequest -Uri "$releaseUrl/SHA256SUMS" -OutFile $checksumsPath -UseBasicParsing
    } catch {
        Fail "unable to download SHA256SUMS"
    }
    $checksumMatches = @()
    foreach ($line in Get-Content -LiteralPath $checksumsPath) {
        if ($line -match '^([0-9a-fA-F]{64})\s+(.+)$' -and $Matches[2] -eq $archive) {
            $checksumMatches += $Matches[1].ToLowerInvariant()
        }
    }
    if ($checksumMatches.Count -ne 1) {
        Fail "SHA256SUMS does not contain exactly one valid checksum for $archive"
    }
    $actualChecksum = (Get-FileHash -LiteralPath $archivePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actualChecksum -ne $checksumMatches[0]) {
        Fail "checksum mismatch for $archive"
    }
    Expand-Archive -LiteralPath $archivePath -DestinationPath $work -Force
    $candidate = Join-Path $work "$project.exe"
    if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        Fail "archive does not contain $project.exe"
    }
    & $candidate schema | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Fail "downloaded CLI failed schema validation"
    }

    $installDir = Assert-HomePath $installDir
    $stateDir = Assert-HomePath $stateDir
    New-Item -ItemType Directory -Path $installDir, $stateDir -Force | Out-Null
    $staged = Join-Path $installDir ".$project.tmp.$PID.exe"
    $binary = Join-Path $installDir "$project.exe"
    Copy-Item -LiteralPath $candidate -Destination $staged -Force
    Move-Item -LiteralPath $staged -Destination $binary -Force
    $stateTmp = Join-Path $stateDir ".install.json.tmp.$PID"
    @{ schema_version = 1; manager = "hduhelp-installer"; version = $Version; install_dir = $installDir; binary = $binary; installed_at = [DateTime]::UtcNow.ToString("o") } |
        ConvertTo-Json -Compress |
        Set-Content -LiteralPath $stateTmp -Encoding UTF8 -NoNewline
    Move-Item -LiteralPath $stateTmp -Destination $stateFile -Force
    Write-Host "installed $project $Version to $binary"
    if (-not (($env:Path -split ";") -contains $installDir)) {
        Write-Host ('add to PATH if needed: $env:Path += ";{0}"' -f $installDir)
    }
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
