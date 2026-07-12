---
name: hduhelp-cli/subscription
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli subscription skill

This file is generated from the code-owned manifest. Do not edit it.

## subscription delete

- operationId: `SubscriptionService_Unsubscribe`
- HTTP: DELETE /hduhelp-neo/subscription
- 说明: 退订提醒渠道
- 必需 scope: subscription:subscription:write
- 参数:
  - query channel
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscription post

- operationId: `SubscriptionService_Subscribe`
- HTTP: POST /hduhelp-neo/subscription
- 说明: 订阅提醒渠道
- 必需 scope: subscription:subscription:write
- 参数:
  - query channel
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscription put

- operationId: `SubscriptionService_UpdateSubscription`
- HTTP: PUT /hduhelp-neo/subscription
- 说明: 更新订阅渠道配置
- 必需 scope: subscription:subscription:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

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

