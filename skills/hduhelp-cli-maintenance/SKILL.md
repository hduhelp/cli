---
name: hduhelp-cli-maintenance
description: 安全检查和更新 hduhelp-cli，并同步其管理的 Agent Skills；当 CLI 输出 UPDATE_AVAILABLE、用户询问或确认更新 CLI、或 Skill 缺失和陈旧时使用。
---

# HDUHelp CLI 维护

1. 运行 `hduhelp-cli update --check --json`。
2. 发现更新时说明当前版、目标版和 Skill 同步影响，等待用户明确确认。
3. 确认后运行 `hduhelp-cli update --yes --no-input --json`，再运行 `hduhelp-cli version --json`。
4. 运行 `hduhelp-cli skills discover --json`，只处理当前 Agent 对应的安装记录。
5. 状态为 `conflict` 时停止；否则依次执行记录中的 `sync_command` 和 `doctor_command`。

不要把登录、授权或普通业务查询视为更新确认。Windows 返回 `update_scheduled` 时，先在下一次调用确认版本生效。CLI 已更新但 Skill 同步失败时报告部分成功，不要回滚或隐藏状态。
