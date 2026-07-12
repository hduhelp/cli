---
name: hduhelp-cli/subscriptions
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli subscriptions skill

This file is generated from the code-owned manifest. Do not edit it.

## subscriptions

- operationId: `SubscriptionService_ListSubscriptions`
- HTTP: GET /hduhelp-neo/subscriptions
- 说明: 获取全部提醒渠道订阅状态
- 必需 scope: subscription:subscription:read
- 响应体: application/json，schema `#/components/schemas/SubscriptionsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

