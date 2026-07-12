---
name: hduhelp-cli/feed
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli feed skill

This file is generated from the code-owned manifest. Do not edit it.

## feed

- operationId: `FeedService_Home`
- HTTP: GET /hduhelp-neo/feed
- 说明: 首页信息流聚合
- 必需 scope: feed:timeline:read
- 可选 scope: academic:schedule:read, campuslife:campuscard:read, campuslife:electricity:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/HomeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## feed ics-link

- operationId: `FeedService_IcsLink`
- HTTP: GET /hduhelp-neo/feed/ics_link
- 说明: 获取课表ICS订阅链接(无则新建)
- 必需 scope: academic:schedule:read, feed:calendar:write
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/IcsLinkResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## feed schedule

- operationId: `FeedService_ScheduleIcs`
- HTTP: GET /hduhelp-neo/feed/schedule
- 说明: 课表iCalendar订阅
- 参数:
  - query token
- 响应体: application/json，schema `#/components/schemas/ScheduleIcsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## feed v3

- operationId: `FeedService_FeedV3`
- HTTP: GET /hduhelp-neo/feed/v3
- 说明: 信息流V3(并发聚合)
- 必需 scope: feed:timeline:read
- 可选 scope: academic:exam:read, academic:grade:read, academic:schedule:read, subscription:sunrun:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FeedAggResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## feed v4

- operationId: `FeedService_FeedV4`
- HTTP: GET /hduhelp-neo/feed/v4
- 说明: 信息流V4(固定顺序+熔断)
- 必需 scope: feed:timeline:read
- 可选 scope: academic:exam:read, academic:grade:read, academic:schedule:read, subscription:sunrun:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FeedAggResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

