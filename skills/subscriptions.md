---
name: hduhelp-cli/subscriptions
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli subscriptions skill

This file is generated from the code-owned manifest. Do not edit it.

## subscriptions delete

- operationId: `SubscriptionService_Unsubscribe`
- HTTP: DELETE /hduhelp-neo/subscriptions
- 说明: 退订提醒渠道
- 必需 scope: subscription:subscription:write
- 参数:
  - query id
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscriptions get

- operationId: `SubscriptionService_ListSubscriptions`
- HTTP: GET /hduhelp-neo/subscriptions
- 说明: 获取全部提醒渠道订阅状态
- 必需 scope: subscription:subscription:read
- 响应体: application/json，schema `#/components/schemas/SubscriptionsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscriptions post

- operationId: `SubscriptionService_Subscribe`
- HTTP: POST /hduhelp-neo/subscriptions
- 说明: 订阅提醒渠道
- 必需 scope: subscription:subscription:write
- 参数:
  - query channel
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## subscriptions put

- operationId: `SubscriptionService_UpdateSubscription`
- HTTP: PUT /hduhelp-neo/subscriptions
- 说明: 更新订阅渠道配置
- 必需 scope: subscription:subscription:write
- 参数:
  - query id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

