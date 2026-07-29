---
name: hduhelp-campuslife
description: 使用 hduhelp-cli 处理校园生活服务；当用户需要查询二课活动、报名或取消报名，或查询校园卡余额、消费、宿舍电费、电表绑定、校车、网络等 campuslife 业务时使用。
---

# HDUHelp 校园生活

1. 运行 `hduhelp-cli capabilities --domain campuslife --json`。
2. 根据用户意图用 `commands list --domain campuslife --search <关键词> --json` 定位 operation。
3. 执行前读取 schema，区分只读查询与绑定、充值或修改类操作。
4. 查询寝室电费前优先使用当前账号已有绑定；涉及真实寝室、电表或身份映射变更时，先展示将修改的对象并等待确认。
5. 返回消费流水等长列表时遵守 CLI 输出上限；需要进一步筛选时使用服务端参数，不伪造服务端分页。

## 宿舍电费

1. 绑定前依次查询 `campuslife electric buildings`、`campuslife electric floors` 和 `campuslife electric rooms`，让用户确认真实楼栋、楼层与寝室；不得猜测 ID。
2. 执行 `campuslife electric binding put` 前必须读取 schema 的 `request_body_fields`。请求体只能使用 rooms 返回的数字 `room_id`，例如 `{"room_id":93784}`；禁止改写为 `roomId`，也不得用寝室号或 `meter_id` 代替。
3. 绑定会修改当前用户的电表身份映射，提交前展示选中的楼栋、楼层、寝室和电表并等待明确确认。
4. CLI 本地请求体校验失败时不得发送请求；修正字段后仍应视为一次新的写操作，不得自动重试。

## 二课活动报名

1. 查询“我的二课活动”时严格使用二课上游的原始状态映射：`status=0` 全部活动、`status=1` 已参与（已完成签到签退）、`status=2` 未参与（未完成签到签退）、`status=3` 已完成（已完成签到签退且活动负责人已完结活动）；禁止反转 1 和 2。
2. 报名前先查询活动，只允许选择 `activityStatus=8`（报名中）的记录；必须原样使用查询结果中的 `activityId`，禁止根据活动名称或列表序号猜测。
3. 调用报名操作前，向用户展示活动名称、主办方、活动时间、报名截止时间和报名要求，并取得明确确认。
4. 重复报名会在提交前被拒绝。操作响应中只有 `verified=true`、`success=true`、`registered=true` 同时成立时，才能告知用户报名成功。
5. 取消报名前先执行“查询我的二课活动”，从结果中选择真实 `activityId`，并询问用户取消理由；用户未提供理由时使用“取消报名”。
6. 取消操作是高风险写操作：先执行 `--dry-run --json` 展示计划，用户明确确认后再使用 `--yes`。只有响应中 `verified=true`、`success=true`、`registered=false` 时，才能告知用户取消成功。
7. 若 `submitted=true` 但 `verified=false` 或 `success=false`，只能说明请求已经提交但最终状态未确认，并引导用户前往二课系统核实。

不要猜测活动 ID、寝室号、校区、卡号或电表标识。缺少信息时先向用户确认。
