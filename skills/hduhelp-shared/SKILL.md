---
name: hduhelp-shared
description: 发现并安全使用 hduhelp-cli 的通用能力；当用户需要登录、增量授权、退出、查询本人身份、上传下载文件、检查可用业务域，或其他 HDUHelp Skill 需要统一 CLI 调用约定时使用。
---

# HDUHelp 通用能力

## 开始

1. 运行 `hduhelp-cli agent-context --json` 获取当前 CLI、业务域和 Skill。
2. 用 `hduhelp-cli capabilities --domain <name> --json` 或 `commands list --domain <name> --json` 缩小范围。
3. 执行前用 `hduhelp-cli schema <operation-or-command> --json` 获取当前参数、scope 和风险。
4. 执行业务命令时使用 `--json --no-input --no-open`；不要猜测参数或 API 路径。

## 认证

- 首次授权：显式选择最小 scope，运行 `auth login --scope <scope> --no-input --no-open --json`。
- 缺 scope：按错误提供的命令运行 `auth reauthorize`，不要重新创建无关联登录。
- 授权命令返回网页地址后交给用户确认，再运行 `auth resume --wait --json`。
- 退出默认同时清除本地凭据并撤销 PAT；只有用户明确要求时使用 `--local-only`。
- 不要自动补 `--yes`，也不要把登录请求当成更新或高风险写入确认。

## 文件与输出

上传、下载或二进制响应前先读取 schema。二进制响应使用 `--output FILE`；不要把二进制直接混入 JSON。
