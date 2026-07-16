---
name: hduhelp-campuslife
description: 使用 hduhelp-cli 处理校园生活服务；当用户需要查询校园卡余额或消费、宿舍电费、电表绑定、校车、网络或其他 campuslife 业务时使用。
---

# HDUHelp 校园生活

1. 运行 `hduhelp-cli capabilities --domain campuslife --json`。
2. 根据用户意图用 `commands list --domain campuslife --search <关键词> --json` 定位 operation。
3. 执行前读取 schema，区分只读查询与绑定、充值或修改类操作。
4. 查询寝室电费前优先使用当前账号已有绑定；涉及真实寝室、电表或身份映射变更时，先展示将修改的对象并等待确认。
5. 返回消费流水等长列表时遵守 CLI 输出上限；需要进一步筛选时使用服务端参数，不伪造服务端分页。

不要猜测寝室号、校区、卡号或电表标识。缺少信息时先向用户确认。
