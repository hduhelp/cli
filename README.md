# hduhelp-cli

`hduhelp-cli` 是 [HDUHelp Neo](https://github.com/hduhelp/hduhelp-neo) 的官方命令行客户端。它通过浏览器设备授权获取权限受限的 Personal Access Token（PAT），再以命令行方式访问 HDUHelp API。

它适合日常查询、脚本自动化和 AI 工具调用：不需要 clone 后端仓库，也不需要在本机安装 Go。

## 安装

### macOS 与 Linux：一行安装

安装脚本会自动识别 macOS/Linux 与 CPU 架构，并从最新稳定版 Release 下载 CLI：

```sh
curl -fsSL https://raw.githubusercontent.com/hduhelp/cli/main/install.sh | sh
```

默认安装到 `$HOME/.local/bin`，不会修改 shell 配置。若该目录不在 `PATH`，脚本会打印可复制的配置命令。

更新时重新运行同一条命令即可。也可以指定版本或安装目录：

```sh
curl -fsSL https://raw.githubusercontent.com/hduhelp/cli/main/install.sh | sh -s -- --version 0.2.1
curl -fsSL https://raw.githubusercontent.com/hduhelp/cli/main/install.sh | sh -s -- --install-dir "$HOME/bin"
```

支持的自动安装平台：

| 平台 | 架构 |
| --- | --- |
| macOS | Apple Silicon（arm64）、Intel（amd64） |
| Linux | x86_64（amd64）、aarch64（arm64） |

### 完全卸载

```sh
curl -fsSL https://raw.githubusercontent.com/hduhelp/cli/main/install.sh | sh -s -- --uninstall
```

脚本会要求输入 `remove` 确认（自动化时添加 `--yes`）。它删除安装器管理的二进制、安装状态、CLI 配置目录以及兼容的旧 Skills 目录；不会修改 `PATH` 或 shell 配置。为避免误删，所有待删路径必须解析到 `HOME` 内；否则卸载会拒绝执行。

### Windows：一行安装

在 Windows 默认的 PowerShell 中运行：

```powershell
irm https://raw.githubusercontent.com/hduhelp/cli/main/install.ps1 | iex
```

它会识别 x64/ARM64，下载 zip 并安装到 `$HOME\\bin`。更新时重新运行同一条命令即可；安装器不会修改用户 `PATH`。

卸载：

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/hduhelp/cli/main/install.ps1))) -Uninstall
```

也可以从 [Releases](https://github.com/hduhelp/cli/releases) 手动下载与你的操作系统和 CPU 架构匹配的压缩包：

| 平台 | 下载文件 |
| --- | --- |
| Intel Mac | `hduhelp-cli_<version>_darwin_amd64.tar.gz` |
| Apple Silicon Mac | `hduhelp-cli_<version>_darwin_arm64.tar.gz` |
| Linux x86_64 | `hduhelp-cli_<version>_linux_amd64.tar.gz` |
| Linux ARM64 | `hduhelp-cli_<version>_linux_arm64.tar.gz` |
| Intel/AMD Windows | `hduhelp-cli_<version>_windows_amd64.zip` |
| Windows on ARM | `hduhelp-cli_<version>_windows_arm64.zip` |

手动下载后，解压并将程序所在目录加入 `PATH`。每个 Release 附带 `SHA256SUMS`，可按需用于校验下载文件。

macOS/Linux 手动安装示例：

```bash
VERSION=0.2.1 # 替换为 Release 页面中的实际版本
OS=darwin     # Linux 使用 linux
ARCH=arm64    # Intel/x86_64 使用 amd64
curl -LO "https://github.com/hduhelp/cli/releases/download/v${VERSION}/hduhelp-cli_${VERSION}_${OS}_${ARCH}.tar.gz"
tar -xzf "hduhelp-cli_${VERSION}_${OS}_${ARCH}.tar.gz"
mkdir -p "$HOME/.local/bin"
mv hduhelp-cli "$HOME/.local/bin/"
```

Windows PowerShell 示例：

```powershell
$version = "0.2.1" # 替换为 Release 页面中的实际版本
$arch = "amd64" # Windows on ARM 使用 arm64
Invoke-WebRequest "https://github.com/hduhelp/cli/releases/download/v$version/hduhelp-cli_${version}_windows_${arch}.zip" -OutFile cli.zip
Expand-Archive cli.zip -DestinationPath "$HOME\bin\hduhelp-cli"
# 将 $HOME\bin\hduhelp-cli 加入用户 PATH，然后重开终端。
```

> 安装脚本为便利功能：当前不执行签名或校验和验证。若需要自行校验手动下载的压缩包，可使用 Release 中的 `SHA256SUMS`。

## 快速开始

```bash
# Agent 创建授权会话；把返回的完整 URL 交给用户在本地浏览器打开
hduhelp-cli auth login --scope academic:grade:read --no-input --no-open --json

# 查看登录状态与已授予 scope
hduhelp-cli auth status
hduhelp-cli auth scopes

# 查询指定学期成绩（学年/学期在服务端过滤，默认输出有界）
hduhelp-cli academic grades list --school-year 2023-2024 --semester 1 --json

# Agent 用有界发现入口查找命令
hduhelp-cli commands list --domain academic --limit 20 --json
```

CLI 使用 [RFC 8628 Device Authorization Grant](https://www.rfc-editor.org/rfc/rfc8628)：终端不会接收或保存密码。浏览器中的授权页会展示设备、请求的 scope 和过期时间，确认后 CLI 才获得 PAT。

## 命令概览

```text
hduhelp-cli auth login [--scope S1,S2] [--all-scopes] [--server URL]
hduhelp-cli auth reauthorize [--scope S1,S2]
hduhelp-cli auth status | auth scopes | auth resume | auth cancel | auth logout

hduhelp-cli whoami
hduhelp-cli doctor
hduhelp-cli version
hduhelp-cli update --check --json
hduhelp-cli agent-context --json
hduhelp-cli commands list [--domain NAME] [--search TEXT] [--limit 20] [--json]
hduhelp-cli schema <operation-or-command> --json
hduhelp-cli skills list | install | doctor
```

除上述固定命令外，CLI 内置 API manifest，目前提供学业、校园生活、空课表、信息流、研究生、群聊、身份、订阅和文件上传等领域的动态命令。每条命令会在调用前检查本地 PAT 的 scope；缺少权限时会提示对应的重新授权命令。

常用参数：

```text
--school-year VALUE   OpenAPI 参数可直接使用 kebab-case flag
--query key=value     通用查询参数兼容入口
--path key=value      路径参数
--data JSON|@FILE|-   JSON 请求体或 stdin
--set key=value       JSON 字段
--file FILE           multipart 上传文件
--form key=value      multipart 字段
--header key=value    额外 HTTP 请求头
--output-file FILE    原子保存结构化响应
--output FILE         原子保存二进制响应
--timeout DURATION    请求超时
--json                稳定 JSON 输出
--raw                 原样输出响应
```

例如：

```bash
hduhelp-cli campuslife card balance
hduhelp-cli academic classroom unused --query campus_id=1
hduhelp-cli upload post --file ./report.pdf --form name=report.pdf
```

## Skills

CLI 提供手写、可审核的 `hduhelp-semester-grades` Skill，命令引用由 manifest 确定性生成。安装必须显式声明 Agent、作用域和确认方式：

```bash
hduhelp-cli skills install --target codex --scope user --dry-run
hduhelp-cli skills install --target codex --scope user --yes
hduhelp-cli skills doctor --target codex --scope user --json
```

最新稳定版的标准 `<skill>/SKILL.md` 包也会同步到本仓库的 [`skills/`](./skills) 目录。`--dry-run` 无副作用，实际安装采用原子目录切换；接口、参数和权限仍以 CLI 内置 manifest 为准。

## 安全与数据

- CLI 只保存 PAT，不保存密码；token 仅显示前缀。
- PAT 的 scope 是最小权限集合；需要新权限时使用 `auth reauthorize`。
- 本地配置默认保存到操作系统用户配置目录；可用 `HDUHELP_CLI_CONFIG` 覆盖。
- 安装脚本不修改 shell 配置，也不会删除 `HOME` 外的文件。
- Release 提供 `SHA256SUMS` 供手动下载时选用；当前安装脚本不执行签名或校验和验证。

## 发布

CLI 源码在 [hduhelp/hduhelp-neo](https://github.com/hduhelp/hduhelp-neo)。当该仓库的 `release.yml` 中 CLI 版本递增并合并到 `main` 时，发布流程会构建 macOS、Linux 和 Windows 的多架构产物，更新本仓库的 `install.sh`、`install.ps1`、`version.json` 与 `skills/`，并创建对应 GitHub Release。

## 开发

CLI 源码、API 契约和后端位于 [hduhelp/hduhelp-neo](https://github.com/hduhelp/hduhelp-neo)。开发环境可从该仓库构建：

```bash
go run ./cmd/hduhelp-cli --help
```

本仓库只承载公开发行物、当前生成的 Skills 和 Release 下载。
