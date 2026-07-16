---
name: hduhelp-academic
description: 使用 hduhelp-cli 处理教务与研究生业务；当用户询问本人课表、今明课程、成绩/GPA、考试、选课、学籍、宿舍、新生、教室、校历、图书馆数据或研究生成绩/导师信息时使用。
---

# HDUHelp 教务

1. 先运行 `hduhelp-cli capabilities --domain academic --json`；研究生专属信息同时检查 `graduate` domain。
2. 用 `commands list --domain academic --search <意图> --json` 找到 operation，再用 `schema` 确认过滤参数和 scope。
3. 默认选择“本人”接口。只有用户明确需要目录、全局或他人数据且 scope 合法时，才选择带 `directory` 语义的命令。
4. 查询成绩时优先选择本人“成绩与绩点” operation；学年和学期是服务端过滤条件，不要把目录成绩接口当成替代。
5. 查询课表时选择本人学期课表或今明课表。全局课表是 operator-only，不应出现在 PAT CLI；若发现它，停止并报告契约错误。
6. 对修改收藏、生源地、门禁上报等写操作，先向用户说明影响；高风险命令没有明确确认时不要执行。

始终读取实时 schema，不在 Skill 中固定参数表、scope 或响应字段。
