---
name: hduhelp-groupchat
description: 使用 hduhelp-cli 处理 HDUHelp 群聊；当用户需要查找我的课程群、创建或加入班级群/课程群/城市校友群、查看成员或管理群聊时使用。
---

# HDUHelp 群聊

1. 运行 `hduhelp-cli capabilities --domain groupchat --json`，按群类型和动作搜索 operation。
2. 读取 schema，确认群标识、课程、班级、城市和成员身份等参数。
3. 查询类请求可直接执行。创建、加入、退出、解散或成员管理会影响其他用户，执行前展示目标群和动作并等待明确确认。
4. 需要从教务信息推导课程或班级时，先使用 academic 的本人数据，再把明确标识传给群聊 operation；不要按名称猜 ID。
5. 返回邀请信息或成员数据时仅展示完成任务所需字段，不额外扩散个人信息。

高风险写操作不得自动补 `--yes`。
