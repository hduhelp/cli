---
name: hduhelp-emptyschedule
description: 使用 hduhelp-cli 查询和管理空课表；当用户需要找空闲教室、查看或创建空课表房间、管理收藏、成员、规则或排班结果时使用。
---

# HDUHelp 空课表

1. 运行 `hduhelp-cli capabilities --domain emptyschedule --json`，再按“空闲教室、房间、收藏、成员、规则、排班”等关键词搜索。
2. 读取目标 operation 的 schema，明确日期、周次、星期、节次、校区和容量等条件。
3. 单次查询直接调用原子 operation。需要组合多个查询时由 Agent 明确分步执行；CLI 未提供 Built-in Workflow 时不要假装整个过程具有事务性。
4. 创建房间、修改成员或删除收藏/排班结果前，先复述目标对象和影响。删除类命令必须遵守 `--dry-run` 与明确确认门禁。
5. 输出候选教室时保留筛选条件，并说明结果是服务端结果还是客户端有界视图。

不要调用 academic 全局课表；该接口仅供 operator 使用。
