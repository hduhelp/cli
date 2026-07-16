---
name: hduhelp-subscription
description: 使用 hduhelp-cli 查询阳光长跑并管理提醒订阅；当用户询问跑步记录、达标要求、成绩概览，或需要查看、订阅、退订提醒渠道时使用。
---

# HDUHelp 跑步与提醒订阅

1. 跑步相关任务运行 `capabilities --domain subscription --json`；提醒渠道管理同时检查 `subscriptions` domain。
2. 用 `commands list --domain <domain> --search <意图> --json` 定位 operation，并读取 schema。
3. 区分跑步记录、达标规则和成绩概览，不根据部分记录自行推断官方达标状态。
4. 订阅或退订前展示渠道和当前状态，得到明确确认后再执行。重复订阅/退订按接口的幂等结果报告。
5. 不把提醒订阅与课表 ICS 地址混淆；课表日历订阅使用 hduhelp-feed。

参数、scope 和风险始终以当前 CLI schema 为准。
