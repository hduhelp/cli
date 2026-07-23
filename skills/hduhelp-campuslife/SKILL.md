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

## 二课活动报名

1. 报名前先查询活动，只允许选择 `activityStatus=8`（报名中）的记录；必须原样使用查询结果中的 `activityId`，禁止根据活动名称或列表序号猜测。
2. 调用报名操作前，向用户展示活动名称、主办方、活动时间、报名截止时间和报名要求，并取得明确确认。
3. 重复报名会在提交前被拒绝。操作响应中只有 `verified=true`、`success=true`、`registered=true` 同时成立时，才能告知用户报名成功。
4. 取消报名前先执行“查询我的二课活动”，从结果中选择真实 `activityId`，并询问用户取消理由；用户未提供理由时使用“取消报名”。
5. 取消操作是高风险写操作：先执行 `--dry-run --json` 展示计划，用户明确确认后再使用 `--yes`。只有响应中 `verified=true`、`success=true`、`registered=false` 时，才能告知用户取消成功。
6. 若 `submitted=true` 但 `verified=false` 或 `success=false`，只能说明请求已经提交但最终状态未确认，并引导用户前往二课系统核实。

不要猜测活动 ID、寝室号、校区、卡号或电表标识。缺少信息时先向用户确认。
