---
name: hduhelp-cli/emptyschedule
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli emptyschedule skill

This file is generated from the code-owned manifest. Do not edit it.

## emptyschedule enroll

- operationId: `EmptyScheduleService_Enroll`
- HTTP: POST /hduhelp-neo/emptyschedule/enroll
- 说明: 口令组队报名
- 必需 scope: emptyschedule:team:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/EnrollResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule events delete

- operationId: `EmptyScheduleService_DeleteEvent`
- HTTP: DELETE /hduhelp-neo/emptyschedule/events
- 说明: 删除排班结果
- 必需 scope: emptyschedule:result:write
- 参数:
  - query room_id
  - query event_id
- 响应体: application/json，schema `#/components/schemas/DeleteEventResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule events get

- operationId: `EmptyScheduleService_EventResult`
- HTTP: GET /hduhelp-neo/emptyschedule/events
- 说明: 获取排班结果详情
- 必需 scope: emptyschedule:result:read
- 参数:
  - query room_id
  - query event_id
- 响应体: application/json，schema `#/components/schemas/EventResultResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule events share

- operationId: `EmptyScheduleService_Share`
- HTTP: POST /hduhelp-neo/emptyschedule/events/share
- 说明: 分享排班结果生成分享码
- 必需 scope: emptyschedule:share:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/ShareResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule favorites delete

- operationId: `EmptyScheduleService_DeleteFavorite`
- HTTP: DELETE /hduhelp-neo/emptyschedule/favorites
- 说明: 删除收藏
- 必需 scope: emptyschedule:favorite:write
- 参数:
  - query f_id
- 响应体: application/json，schema `#/components/schemas/DeleteFavoriteResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule favorites get

- operationId: `EmptyScheduleService_Favorites`
- HTTP: GET /hduhelp-neo/emptyschedule/favorites
- 说明: 收藏列表
- 必需 scope: emptyschedule:favorite:read
- 参数:
  - query page
  - query size
- 响应体: application/json，schema `#/components/schemas/FavoritesResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule favorites post

- operationId: `EmptyScheduleService_Favorite`
- HTTP: POST /hduhelp-neo/emptyschedule/favorites
- 说明: 收藏排班结果
- 必需 scope: emptyschedule:favorite:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/FavoriteResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule favorites put

- operationId: `EmptyScheduleService_UpdateFavorite`
- HTTP: PUT /hduhelp-neo/emptyschedule/favorites
- 说明: 修改收藏备注
- 必需 scope: emptyschedule:favorite:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/UpdateFavoriteResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule gen

- operationId: `EmptyScheduleService_Gen`
- HTTP: GET /hduhelp-neo/emptyschedule/gen
- 说明: 口令组队生成结果
- 必需 scope: emptyschedule:team:read
- 响应体: application/json，schema `#/components/schemas/GenResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms delete

- operationId: `EmptyScheduleService_DeleteRoom`
- HTTP: DELETE /hduhelp-neo/emptyschedule/rooms
- 说明: 删除房间
- 必需 scope: emptyschedule:room:write
- 参数:
  - query room_id
- 响应体: application/json，schema `#/components/schemas/DeleteRoomResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms detail

- operationId: `EmptyScheduleService_RoomDetail`
- HTTP: GET /hduhelp-neo/emptyschedule/rooms/detail
- 说明: 房间详情
- 必需 scope: emptyschedule:room:read
- 参数:
  - query room_id
- 响应体: application/json，schema `#/components/schemas/RoomDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms generate

- operationId: `EmptyScheduleService_Generate`
- HTTP: POST /hduhelp-neo/emptyschedule/rooms/generate
- 说明: 计算房间共同空闲并存档
- 必需 scope: emptyschedule:result:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/GenerateResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms get

- operationId: `EmptyScheduleService_MyRooms`
- HTTP: GET /hduhelp-neo/emptyschedule/rooms
- 说明: 我加入的房间列表
- 必需 scope: emptyschedule:room:read
- 响应体: application/json，schema `#/components/schemas/MyRoomsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms invite

- operationId: `EmptyScheduleService_Invite`
- HTTP: POST /hduhelp-neo/emptyschedule/rooms/invite
- 说明: 生成房间邀请码
- 必需 scope: emptyschedule:room:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/InviteResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms join

- operationId: `EmptyScheduleService_Join`
- HTTP: POST /hduhelp-neo/emptyschedule/rooms/join
- 说明: 通过邀请码加入房间
- 必需 scope: emptyschedule:room:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/JoinResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms leave

- operationId: `EmptyScheduleService_LeaveRoom`
- HTTP: POST /hduhelp-neo/emptyschedule/rooms/leave
- 说明: 离开房间
- 必需 scope: emptyschedule:room:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/LeaveRoomResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule rooms post

- operationId: `EmptyScheduleService_CreateRoom`
- HTTP: POST /hduhelp-neo/emptyschedule/rooms
- 说明: 创建空课表房间
- 必需 scope: emptyschedule:room:write
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateRoomResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule share

- operationId: `EmptyScheduleService_LookUpShare`
- HTTP: GET /hduhelp-neo/emptyschedule/share
- 说明: 通过分享码查看排班结果
- 必需 scope: emptyschedule:share:read
- 参数:
  - query code
- 响应体: application/json，schema `#/components/schemas/LookUpShareResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## emptyschedule status

- operationId: `EmptyScheduleService_Status`
- HTTP: GET /hduhelp-neo/emptyschedule/status
- 说明: 口令组队状态查询
- 必需 scope: emptyschedule:team:read
- 响应体: application/json，schema `#/components/schemas/StatusResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

