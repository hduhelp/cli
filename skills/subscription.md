---
name: hduhelp-cli/subscription
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli subscription skill

This file is generated from the code-owned manifest. Do not edit it.

## subscription sunrun detail

- operationId: `SubscriptionService_SunrunDetail`
- HTTP: GET /hduhelp-neo/subscription/sunrun/detail
- 说明: 阳光长跑跑步记录
- 必需 scope: subscription:sunrun:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SunrunDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscription sunrun group

- operationId: `SubscriptionService_SunrunGroup`
- HTTP: GET /hduhelp-neo/subscription/sunrun/group
- 说明: 阳光长跑达标要求
- 必需 scope: subscription:sunrun:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SunrunGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscription sunrun overview

- operationId: `SubscriptionService_SunrunOverview`
- HTTP: GET /hduhelp-neo/subscription/sunrun/overview
- 说明: 阳光长跑成绩概览
- 必需 scope: subscription:sunrun:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SunrunOverviewResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

