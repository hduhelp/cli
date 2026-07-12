---
name: hduhelp-cli/groupchat
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli groupchat skill

This file is generated from the code-owned manifest. Do not edit it.

## groupchat city get

- operationId: `GroupChatService_GetCityChatGroup`
- HTTP: GET /hduhelp-neo/groupchat/city
- 说明: 查询城市校友群
- 必需 scope: groupchat:group:read
- 参数:
  - query city
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GetCityChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat city post

- operationId: `GroupChatService_CreateCityChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/city
- 说明: 创建城市校友群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateCityChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat class get

- operationId: `GroupChatService_GetClassChatGroup`
- HTTP: GET /hduhelp-neo/groupchat/class
- 说明: 查询班级群
- 必需 scope: groupchat:group:read
- 参数:
  - query class_id
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GetClassChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat class merge

- operationId: `GroupChatService_MergeClassChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/class/merge
- 说明: 合并已有班级群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/MergeClassChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat class post

- operationId: `GroupChatService_CreateClassChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/class
- 说明: 创建班级群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateClassChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat class sync

- operationId: `GroupChatService_SyncClassChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/class/sync
- 说明: 同步班级群成员
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SyncChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk exam

- operationId: `GroupChatService_DingTalkExam`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/exam
- 说明: 钉钉考试数据源
- 必需 scope: academic:exam:read, groupchat:assistant:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DingTalkExamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk infostream

- operationId: `GroupChatService_DingTalkInfoStream`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/infoStream
- 说明: 钉钉信息流数据源
- 必需 scope: academic:schedule:read, groupchat:assistant:read
- 可选 scope: campuslife:campuscard:read, campuslife:electricity:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DingTalkInfoStreamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk ping

- operationId: `GroupChatService_DingTalkPing`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/ping
- 说明: 钉钉数据源存活探测
- 必需 scope: groupchat:assistant:read
- 响应体: application/json，schema `#/components/schemas/PingResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk schedule now

- operationId: `GroupChatService_DingTalkScheduleNow`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/schedule/now
- 说明: 钉钉课表数据源
- 必需 scope: academic:schedule:read, groupchat:assistant:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DingTalkScheduleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk score

- operationId: `GroupChatService_DingTalkScore`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/score
- 说明: 钉钉成绩数据源
- 必需 scope: academic:grade:read, groupchat:assistant:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DingTalkScoreResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat dingtalk time

- operationId: `GroupChatService_DingTalkTime`
- HTTP: GET /hduhelp-neo/groupchat/dingtalk/time
- 说明: 钉钉校园时间数据源
- 必需 scope: academic:schedule:read, groupchat:assistant:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DingTalkTimeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat grade get

- operationId: `GroupChatService_GetGradeChatGroup`
- HTTP: GET /hduhelp-neo/groupchat/grade
- 说明: 查询年级群
- 必需 scope: groupchat:group:read
- 参数:
  - query unit_id
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GetGradeChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat grade post

- operationId: `GroupChatService_CreateGradeChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/grade
- 说明: 创建年级群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateGradeChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat grade sync

- operationId: `GroupChatService_SyncGradeChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/grade/sync
- 说明: 同步年级群成员
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/SyncChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat groups get

- operationId: `GroupChatService_MyGroups`
- HTTP: GET /hduhelp-neo/groupchat/groups
- 说明: 查询我创建的群聊
- 必需 scope: groupchat:group:read
- 响应体: application/json，schema `#/components/schemas/MyGroupsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat groups member

- operationId: `GroupChatService_LeaveGroup`
- HTTP: DELETE /hduhelp-neo/groupchat/groups/member
- 说明: 退出群聊
- 必需 scope: groupchat:group:write
- 参数:
  - query openConversationId
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/LeaveGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat groups post

- operationId: `GroupChatService_CreateGroup`
- HTTP: POST /hduhelp-neo/groupchat/groups
- 说明: 创建钉钉群聊
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat previous-school get

- operationId: `GroupChatService_GetPreviousSchoolChatGroup`
- HTTP: GET /hduhelp-neo/groupchat/previous-school
- 说明: 查询校友群
- 必需 scope: groupchat:group:read
- 参数:
  - query school_name
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GetPreviousSchoolChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat previous-school join

- operationId: `GroupChatService_JoinPreviousSchoolChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/previous-school/join
- 说明: 加入校友群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/JoinPreviousSchoolChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat previous-school post

- operationId: `GroupChatService_CreatePreviousSchoolChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/previous-school
- 说明: 创建校友群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreatePreviousSchoolChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## groupchat recruit

- operationId: `GroupChatService_CreateRecruitChatGroup`
- HTTP: POST /hduhelp-neo/groupchat/recruit
- 说明: 创建招新群
- 必需 scope: groupchat:group:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/CreateRecruitChatGroupResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

