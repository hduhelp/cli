# hduhelp-cli

`hduhelp-cli` 是 [HDUHelp Neo](https://github.com/hduhelp/hduhelp-neo) 的官方命令行客户端。它通过浏览器设备授权获取权限受限的 Personal Access Token（PAT），再以命令行方式访问 HDUHelp API。

它适合日常查询、脚本自动化和 AI 工具调用：不需要 clone 后端仓库，也不需要在本机安装 Go。

## 安装

从 [Releases](https://github.com/hduhelp/cli/releases) 下载与你的操作系统和 CPU 架构匹配的压缩包：

| 平台 | 下载文件 |
| --- | --- |
| Intel Mac | `hduhelp-cli_<version>_darwin_amd64.tar.gz` |
| Apple Silicon Mac | `hduhelp-cli_<version>_darwin_arm64.tar.gz` |
| Intel/AMD Windows | `hduhelp-cli_<version>_windows_amd64.zip` |
| Windows on ARM | `hduhelp-cli_<version>_windows_arm64.zip` |

每个 Release 都附带 `SHA256SUMS`。下载后请先校验压缩包，再解压并将程序所在目录加入 `PATH`。

macOS 示例：

```bash
VERSION=0.1.0
ARCH=arm64 # Intel Mac 使用 amd64
curl -LO "https://github.com/hduhelp/cli/releases/download/v${VERSION}/hduhelp-cli_${VERSION}_darwin_${ARCH}.tar.gz"
curl -LO "https://github.com/hduhelp/cli/releases/download/v${VERSION}/SHA256SUMS"
grep "hduhelp-cli_${VERSION}_darwin_${ARCH}.tar.gz" SHA256SUMS | shasum -a 256 -c -
tar -xzf "hduhelp-cli_${VERSION}_darwin_${ARCH}.tar.gz"
mkdir -p "$HOME/.local/bin"
mv hduhelp-cli "$HOME/.local/bin/"
```

Windows PowerShell 示例：

```powershell
$version = "0.1.0"
$arch = "amd64" # Windows on ARM 使用 arm64
Invoke-WebRequest "https://github.com/hduhelp/cli/releases/download/v$version/hduhelp-cli_${version}_windows_${arch}.zip" -OutFile cli.zip
Expand-Archive cli.zip -DestinationPath "$HOME\bin\hduhelp-cli"
# 将 $HOME\bin\hduhelp-cli 加入用户 PATH，然后重开终端。
```

> 下载页以实际可用的版本号为准。首次发布前，Release 列表可能为空。

## 快速开始

```bash
# 浏览器确认设备、请求 scope 并完成登录
hduhelp-cli auth login --scope academic:grade:read

# 查看登录状态与已授予 scope
hduhelp-cli auth status
hduhelp-cli auth scopes

# 查询成绩
hduhelp-cli academic grades

# 查看所有可调用 API 及其必需 scope
hduhelp-cli api list
```

CLI 使用 [RFC 8628 Device Authorization Grant](https://www.rfc-editor.org/rfc/rfc8628)：终端不会接收或保存密码。浏览器中的授权页会展示设备、请求的 scope 和过期时间，确认后 CLI 才获得 PAT。

## 命令概览

```text
hduhelp-cli auth login [--scope S1,S2] [--all-scopes] [--server URL]
hduhelp-cli auth reauthorize [--scope S1,S2]
hduhelp-cli auth status | auth scopes | auth resume | auth cancel | auth logout

hduhelp-cli whoami
hduhelp-cli doctor
hduhelp-cli schema
hduhelp-cli api list
hduhelp-cli skills list | install | update | doctor
```

除上述固定命令外，CLI 内置 API manifest，目前提供学业、校园生活、空课表、信息流、研究生、群聊、身份、订阅和文件上传等领域的动态命令。每条命令会在调用前检查本地 PAT 的 scope；缺少权限时会提示对应的重新授权命令。

常用参数：

```text
--query key=value     查询参数
--path key=value      路径参数
--body JSON|@FILE     JSON 请求体
--set key=value       JSON 字段
--file FILE           multipart 上传文件
--form key=value      multipart 字段
--header key=value    额外 HTTP 请求头
--output FILE         原子保存响应文件
--raw                 原样输出响应
```

例如：

```bash
hduhelp-cli campuslife card balance
hduhelp-cli academic classroom unused --query campus_id=1
hduhelp-cli upload post --file ./report.pdf --form name=report.pdf
```

## Skills

CLI 可以从内置 manifest 生成按领域分组的 AI Skills：

```bash
hduhelp-cli skills install
hduhelp-cli skills doctor
```

最新稳定版生成的 Skills 也会同步到本仓库的 [`skills/`](./skills) 目录。Skills 是派生文档；接口、参数和权限仍以 CLI 内置 manifest 为准。

## 安全与数据

- CLI 只保存 PAT，不保存密码；token 仅显示前缀。
- PAT 的 scope 是最小权限集合；需要新权限时使用 `auth reauthorize`。
- 本地配置默认保存到操作系统用户配置目录；可用 `HDUHELP_CLI_CONFIG` 覆盖。
- 发布压缩包应始终使用 Release 中的 `SHA256SUMS` 校验。

## 开发

CLI 源码、API 契约和后端位于 [hduhelp/hduhelp-neo](https://github.com/hduhelp/hduhelp-neo)。开发环境可从该仓库构建：

```bash
go run ./cmd/hduhelp-cli api list
```

本仓库只承载公开发行物、当前生成的 Skills 和 Release 下载。
