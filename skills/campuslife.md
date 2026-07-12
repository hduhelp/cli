---
name: hduhelp-cli/campuslife
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli campuslife skill

This file is generated from the code-owned manifest. Do not edit it.

## campuslife campuses

- operationId: `CampusLifeService_ListPublicCampuses`
- HTTP: GET /hduhelp-neo/campuslife/campuses
- 说明: 校区列表(公开：id/名称/坐标)
- 响应体: application/json，schema `#/components/schemas/PublicCampusListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife card balance

- operationId: `CampusLifeService_CardBalance`
- HTTP: GET /hduhelp-neo/campuslife/card/balance
- 说明: 查询校园卡余额
- 必需 scope: campuslife:campuscard:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/CardBalanceResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife card consume

- operationId: `CampusLifeService_CardConsume`
- HTTP: GET /hduhelp-neo/campuslife/card/consume
- 说明: 查询校园卡消费流水
- 必需 scope: campuslife:campuscard:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/CardConsumeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife card info

- operationId: `CampusLifeService_CardInfo`
- HTTP: GET /hduhelp-neo/campuslife/card/info
- 说明: 查询校园卡信息
- 必需 scope: campuslife:campuscard:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/CardInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric balance

- operationId: `CampusLifeService_ElectricBalance`
- HTTP: GET /hduhelp-neo/campuslife/electric/balance
- 说明: 查询绑定电表余额
- 必需 scope: campuslife:electricity:read
- 响应体: application/json，schema `#/components/schemas/ElectricBalanceResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric binding delete

- operationId: `CampusLifeService_UnbindMeter`
- HTTP: DELETE /hduhelp-neo/campuslife/electric/binding
- 说明: 解绑当前宿舍电表
- 必需 scope: campuslife:electricity:write
- 响应体: application/json，schema `#/components/schemas/SimpleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric binding get

- operationId: `CampusLifeService_ElectricBinding`
- HTTP: GET /hduhelp-neo/campuslife/electric/binding
- 说明: 查询当前电表绑定信息
- 必需 scope: campuslife:electricity:read
- 响应体: application/json，schema `#/components/schemas/ElectricBindingResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric binding put

- operationId: `CampusLifeService_BindRoom`
- HTTP: PUT /hduhelp-neo/campuslife/electric/binding
- 说明: 按真实寝室绑定宿舍电表
- 必需 scope: campuslife:electricity:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/ElectricBindingResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric buildings

- operationId: `CampusLifeService_ListBuildings`
- HTTP: GET /hduhelp-neo/campuslife/electric/buildings
- 说明: 查询真实楼栋列表
- 必需 scope: campuslife:electricity:read
- 响应体: application/json，schema `#/components/schemas/ElectricBuildingListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric floors

- operationId: `CampusLifeService_ListFloors`
- HTTP: GET /hduhelp-neo/campuslife/electric/floors
- 说明: 按楼栋查询真实楼层列表
- 必需 scope: campuslife:electricity:read
- 参数:
  - query building_id
- 响应体: application/json，schema `#/components/schemas/ElectricFloorListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife electric rooms

- operationId: `CampusLifeService_ListRooms`
- HTTP: GET /hduhelp-neo/campuslife/electric/rooms
- 说明: 按楼层查询真实寝室与电表列表
- 必需 scope: campuslife:electricity:read
- 参数:
  - query floor_id
- 响应体: application/json，schema `#/components/schemas/ElectricRoomListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife fee

- operationId: `CampusLifeService_Fee`
- HTTP: GET /hduhelp-neo/campuslife/fee
- 说明: 查询宿舍电费余额
- 必需 scope: campuslife:electricity:read
- 响应体: application/json，schema `#/components/schemas/FeeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife history

- operationId: `CampusLifeService_ElectricHistory`
- HTTP: GET /hduhelp-neo/campuslife/history
- 说明: 查询近14天电费历史
- 必需 scope: campuslife:electricity:read
- 响应体: application/json，schema `#/components/schemas/ElectricHistoryResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife v1 infostream

- operationId: `CampusLifeService_InfoStream`
- HTTP: GET /hduhelp-neo/campuslife/v1/infoStream
- 说明: 获取天气信息流卡片(AQI/温度/停雨)
- 参数:
  - query lat
  - query lng
- 响应体: application/json，schema `#/components/schemas/InfoStreamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife v1 predict

- operationId: `CampusLifeService_Predict`
- HTTP: GET /hduhelp-neo/campuslife/v1/predict
- 说明: 获取天气预报(逐小时/逐天)
- 参数:
  - query days
  - query lat
  - query lng
- 响应体: application/json，schema `#/components/schemas/PredictResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife v1 realtime

- operationId: `CampusLifeService_RealTime`
- HTTP: GET /hduhelp-neo/campuslife/v1/realTime
- 说明: 获取实时天气
- 参数:
  - query lat
  - query lng
- 响应体: application/json，schema `#/components/schemas/RealTimeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## campuslife weather

- operationId: `CampusLifeService_Weather`
- HTTP: GET /hduhelp-neo/campuslife/weather
- 说明: 查询校园天气(按当前校区坐标)
- 参数:
  - query lat
  - query lng
- 响应体: application/json，schema `#/components/schemas/WeatherResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

