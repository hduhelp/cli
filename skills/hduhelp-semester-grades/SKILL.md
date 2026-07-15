---
name: hduhelp-semester-grades
description: 查询 HDUHelp 当前用户指定学年、学期的本科成绩与 GPA；当用户询问成绩、绩点、某学期课程分数或需要恢复成绩查询授权时使用。
---

# HDUHelp 指定学期成绩

使用 `hduhelp-cli` 查询本人数据。不要改用 `academic directory grade`，除非用户明确要求目录查询且已授权对应目录 Scope。

## 工作流

1. 用 `hduhelp-cli schema AcademicService_StudentGrade --json` 读取当前命令契约；命令细节以 `references/generated/command.md` 和运行时 Schema 为准。
2. 从用户问题中确认学年（如 `2023-2024`）和学期（`1` 或 `2`）。缺一项时先询问，不要默认拉取全部历史成绩。
3. 执行：

   ```bash
   hduhelp-cli academic grades list --school-year 2023-2024 --semester 1 --limit 20 --fields courseName,credit,score,gpa --json --no-input --no-open
   ```

4. 若返回 `MISSING_SCOPE`，执行 `hduhelp-cli auth reauthorize --scope academic:grade:read --no-input --no-open --json`，只把 `verification_uri_complete` 的完整 URL 交给用户。不要替用户打开 Agent 浏览器，不要把用户口头回复当作授权完成；随后用 `auth resume --wait --json` 读取服务端状态。
5. 若 `_cli.truncated=true`，保持相同 `--school-year` 和 `--semester`，使用 `_cli.next_cursor` 继续。不要扩大到目录或全局成绩接口。
6. 成绩中 `score=0` 且 `gpa>0` 可能代表特殊等级制结果。按原始结构陈述并提示歧义，不要解释为不及格，也不要自行改写分数。

## 安全规则

- 只查询当前用户；不得在失败后静默切换到目录接口。
- 不读取、展示或要求用户粘贴 PAT。
- 始终使用 `--json --no-input --no-open`。
- 错误恢复只执行返回 `hint` 中当前 CLI 能解析的命令；写操作需要用户明确授权。
