#!/usr/bin/env sh
set -eu

project=hduhelp-cli
metadata_url=${HDUHELP_INSTALL_METADATA_URL:-https://raw.githubusercontent.com/hduhelp/cli/main/version.json}
release_base_url=${HDUHELP_INSTALL_RELEASE_BASE_URL:-https://github.com/hduhelp/cli/releases/download}
home=$(CDPATH= cd -- "${HOME:?HOME is required}" && pwd -P)
state_dir="$home/.local/share/hduhelp-cli-installer"
state_file="$state_dir/install.json"
version=
install_dir="$home/.local/bin"
dry_run=false
uninstall=false
yes=false

usage() {
  cat <<'EOF'
Usage: install.sh [--version X.Y.Z] [--install-dir DIR] [--dry-run] [--uninstall] [--yes]
EOF
}

fail() { echo "$project installer: $*" >&2; exit 1; }

home_real=$home

validate_home_path() {
  value=$1
  case "$value" in
    "$home"/*) ;;
    *) fail "path must be inside HOME: $value" ;;
  esac
  case "/$value/" in
    */../*|*/./*) fail "path must not contain . or ..: $value" ;;
  esac
}

canonical_install_dir() {
  validate_home_path "$install_dir"
  if [ "$dry_run" = true ]; then
    return
  fi
  mkdir -p "$install_dir"
  install_dir=$(CDPATH= cd -- "$install_dir" && pwd -P)
  case "$install_dir" in "$home_real"/*) ;; *) fail 'install directory resolves outside HOME' ;; esac
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --version) [ "$#" -ge 2 ] || fail '--version requires a value'; version=$2; shift 2 ;;
    --install-dir) [ "$#" -ge 2 ] || fail '--install-dir requires a value'; install_dir=$2; shift 2 ;;
    --dry-run) dry_run=true; shift ;;
    --uninstall) uninstall=true; shift ;;
    --yes) yes=true; shift ;;
    --help|-h) usage; exit 0 ;;
    *) fail "unknown option: $1" ;;
  esac
done

remove_path() {
  if [ -e "$1" ] || [ -L "$1" ]; then
    rm -rf "$1"
    echo "removed: $1"
  else
    echo "not present: $1"
  fi
}

validate_removal_path() {
  value=$1
  case "/$value/" in
    */../*|*/./*) fail "path must not contain . or ..: $value" ;;
  esac

  parent=$(dirname -- "$value")
  while [ ! -e "$parent" ] && [ ! -L "$parent" ]; do
    next_parent=$(dirname -- "$parent")
    [ "$next_parent" != "$parent" ] || fail "cannot resolve removal path: $value"
    parent=$next_parent
  done
  [ -d "$parent" ] || fail "removal path parent is not a directory: $value"
  parent=$(CDPATH= cd -- "$parent" && pwd -P)
  case "$parent" in
    "$home_real"|"$home_real"/*) ;;
    *) fail "removal path resolves outside HOME: $value" ;;
  esac
}

if [ "$uninstall" = true ]; then
  if [ -f "$state_file" ]; then
    saved_dir=$(sed -n 's/.*"install_dir":"\([^"]*\)".*/\1/p' "$state_file" | head -n 1)
    [ -n "$saved_dir" ] && install_dir=$saved_dir
  fi
  validate_home_path "$install_dir"
  if [ -d "$install_dir" ]; then
    install_dir=$(CDPATH= cd -- "$install_dir" && pwd -P)
    case "$install_dir" in "$home_real"/*) ;; *) fail 'saved install directory resolves outside HOME' ;; esac
  fi
  binary="$install_dir/$project"
  config_override=${HDUHELP_CLI_CONFIG:-}
  runtime_os=${HDUHELP_TEST_OS:-$(uname -s)}
  if [ -n "$config_override" ]; then
    [ ! -d "$config_override" ] || fail 'HDUHELP_CLI_CONFIG must name a config file, not a directory'
    config_target="$config_override"
  elif [ "$runtime_os" = Darwin ]; then
    config_target="$home/Library/Application Support/hduhelp"
  else
    config_target="${XDG_CONFIG_HOME:-$home/.config}/hduhelp"
  fi
  legacy_skills="$home/.config/hduhelp"
  validate_removal_path "$binary"
  validate_removal_path "$config_target"
  [ "$legacy_skills" = "$config_target" ] || validate_removal_path "$legacy_skills"
  validate_removal_path "$state_dir"
  echo "The following paths will be removed:"
  echo "  $binary"
  echo "  $config_target"
  [ "$legacy_skills" = "$config_target" ] || echo "  $legacy_skills"
  echo "  $state_dir"
  if [ "$dry_run" = true ]; then
    exit 0
  fi
  if [ "$yes" != true ]; then
    printf 'Type remove to continue: '
    read -r answer || exit 1
    [ "$answer" = remove ] || fail 'uninstall cancelled'
  fi
  remove_path "$binary"
  remove_path "$config_target"
  [ "$legacy_skills" = "$config_target" ] || remove_path "$legacy_skills"
  remove_path "$state_dir"
  exit 0
fi

os=${HDUHELP_TEST_OS:-$(uname -s)}
machine=${HDUHELP_TEST_ARCH:-$(uname -m)}
case "$os/$machine" in
  Darwin/arm64) target=darwin_arm64 ;;
  Darwin/x86_64) target=darwin_amd64 ;;
  Linux/aarch64|Linux/arm64) target=linux_arm64 ;;
  Linux/x86_64|Linux/amd64) target=linux_amd64 ;;
  *) fail "unsupported platform: $os/$machine" ;;
esac

canonical_install_dir

if [ -z "$version" ]; then
  metadata=$(mktemp)
  trap 'rm -f "$metadata"' EXIT
  curl -fsSL "$metadata_url" -o "$metadata" || fail 'unable to download version metadata'
  version=$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$metadata" | head -n 1)
  [ -n "$version" ] || fail 'version metadata does not contain a version'
fi

printf '%s\n' "$version" | awk '/^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$/ {ok=1} END {exit !ok}' || fail "invalid version: $version"

archive="${project}_${version}_${target}.tar.gz"
release_url="$release_base_url/v$version"
if [ "$dry_run" = true ]; then
  echo "version: $version"
  echo "archive: $archive"
  echo "install dir: $install_dir"
  echo "release: $release_url"
  exit 0
fi

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
archive_path="$work/$archive"
curl -fsSL "$release_url/$archive" -o "$archive_path" || fail "unable to download $archive"

tar -xzf "$archive_path" -C "$work" "$project" || fail "archive does not contain $project"
candidate="$work/$project"
chmod 0755 "$candidate"
"$candidate" schema >/dev/null || fail 'downloaded CLI failed schema validation'
mkdir -p "$state_dir"
staged="$install_dir/.${project}.tmp.$$"
cp "$candidate" "$staged"
chmod 0755 "$staged"
mv -f "$staged" "$install_dir/$project"
state_tmp="$state_dir/.install.json.tmp.$$"
printf '{"version":"%s","install_dir":"%s","binary":"%s"}\n' "$version" "$install_dir" "$install_dir/$project" > "$state_tmp"
mv -f "$state_tmp" "$state_file"
echo "installed $project $version to $install_dir/$project"
case ":${PATH:-}:" in
  *":$install_dir:"*) ;;
  *) echo "add to PATH if needed: export PATH=\"$install_dir:\$PATH\"" ;;
esac
