---
name: hduhelp-cli-maintenance
description: 安全检查和更新 hduhelp-cli，并同步其管理的 Agent Skills；当 CLI 输出 UPDATE_AVAILABLE、用户询问或确认更新 CLI、或 Skill 缺失和陈旧时使用。
---

# HDUHelp CLI 维护

## 检查

1. 运行 `hduhelp-cli update --check --json`。
2. 没有更新时只报告当前版本。发现更新时说明当前版本和目标版本，告知用户还会同步当前 Agent 已安装的托管 Skill，并等待明确确认。
3. 不把登录、授权或普通查询请求视为更新确认。

## 更新

得到明确确认后按顺序执行：

1. `hduhelp-cli update --yes --no-input --json`
2. `hduhelp-cli version --json`
3. 运行 `hduhelp-cli skills discover --json`，只选择当前 Agent 对应的安装记录。不要猜测或更新其他 Agent/范围。
4. 状态为 `conflict` 时停止并报告保留的目录；否则执行记录中的 `sync_command`，再执行 `doctor_command`。
5. 报告 CLI 与 Skill 的结果，并提示用户新建 Agent 任务以加载新版 Skill。

Windows 返回 `update_scheduled` 时，先在下一次 CLI 调用确认目标版本已经生效，再同步 Skill。CLI 已更新但 Skill 同步失败时，报告部分成功和原始错误，不要回滚或隐藏状态。
