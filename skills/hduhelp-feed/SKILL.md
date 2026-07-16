---
name: hduhelp-feed
description: 使用 hduhelp-cli 处理首页信息流和课表订阅；当用户需要查看聚合信息流、获取课表 ICS、创建或检查 iCalendar 订阅时使用。
---

# HDUHelp 信息流与日历订阅

1. 运行 `hduhelp-cli capabilities --domain feed --json` 并读取目标 schema。
2. 查询首页动态时使用信息流聚合 operation，保留各来源的部分失败信息，不把缺失来源描述成“没有数据”。
3. 用户需要导入日历时选择 ICS 链接或订阅 operation，并明确返回的是可长期订阅地址还是一次性内容。
4. 创建、刷新或暴露订阅地址前说明链接可能包含个人课表访问能力；不要把链接发送给非用户指定的第三方。

参数、scope 和返回字段始终以实时 schema 为准。
