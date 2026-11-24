---
name: hdu-library-booking
domain: librarybooking
description: 使用 hduhelp-cli 完成杭电图书馆座位预约、用随包 HTML 主动展示实时座位图、查看预约和取消预约；当用户提到预约图书馆、自习室、阅览室、书院座位或取消图书馆座位时使用。
---

# HDU 图书馆座位预约

Mate 工作模式使用当前已挂载的图书馆 MCP 工具查询和提交。使用 CLI 时，先运行 `hduhelp-cli capabilities --domain librarybooking --json`，并用 `hduhelp-cli commands list --domain librarybooking --json` 校验当前版本操作。只使用接口返回的 ID，不猜测空间、日期、时间、房间、座位或预约编号。人数由后端固定为 1，不向用户询问人数，也不传人数参数。

## 预约流程

把预约所需信息视为六项：空间、日期、开始时间、时长、房间、座位。保留用户已经明确给出的信息，只补齐缺失项：

1. 空间缺失，或只有空间名称而没有 `categoryId/contentId`：调用 `hduhelp-cli librarybooking categories --json`，展示未禁用分类，等待用户选择。名称能唯一匹配时可直接采用对应 ID。
2. 日期、开始时间或时长任一缺失：调用 `hduhelp-cli librarybooking options --category-id <id> --content-id <id> --json`。只展示返回的 `dates[].times[]` 组合；时长必须来自所选开始时间的 `durationHours`。
3. 空间、日期、开始时间、时长确定后查询一次座位。CLI 用 `hduhelp-cli librarybooking seats search --category-id <id> --content-id <id> --date <YYYY-MM-DD> --begin-time <HH:mm> --duration-hours <n> --output-file <临时JSON>`。在 Mate 已调用 `hduhelp_librarybooking_seats_search` 时，直接用这次工具返回或落盘的完整结果。不要为作图重复查询或逐个统计房间。
4. 用随包模板生成座位图，有空座就在本轮回复里直接展示。
   - **HDU Mate 工作模式**：运行 `node <本Skill目录>/scripts/render-seat-map.mjs --input <临时JSON> --output <座位图HTML> --inline`。脚本报告 `availableSeats` 大于 0 时立即调用 workspace 的 `show_html`，传入生成的 HTML 路径和标题「图书馆实时座位图」。将返回的展示标记单独放在回复里一行。超出卡片大小限制时，用 `publish_file` 交付完整 HTML。
   - **其他宿主**：运行同一条渲染命令，省略 `--inline`，用宿主的 HTML 预览打开生成的文件。没有预览能力时，提供可打开的 HTML 文件。
5. 请用户点选座位，点「复制预约语句」后把整句话粘贴到对话。根据其中的房间 ID、座位 ID 和对应的查询时段核对选座，复述空间、日期、时间、房间和座位号，请用户确认执行真实预约。
6. 用户确认后用预约工具提交，CLI 命令为 `hduhelp-cli librarybooking bookings create --data '<包含 categoryId、contentId、date、beginTime、durationHours、roomId、seatId 的 JSON>' --yes --json`。服务端会再次实时验座，失败时重新查询，不复用过期结果。

用户改变空间、日期、时间、时长，或明确放弃选座时，删除本次临时 JSON/HTML。若实时查询没有空座，给出改时间或空间的选项，不循环请求。

## 取消流程

取消前无条件先调用 `hduhelp-cli librarybooking bookings list --json`，向用户展示 `cancellable=true` 的预约（预约编号、房间、座位、开始和结束时间），等待用户选择。即使用户直接给了 `bookingId`，也必须先查询并确认它仍在可取消列表中。

用户选定后先运行 `hduhelp-cli librarybooking bookings cancel --booking-id <id> --dry-run --json`，展示将取消的预约并等待明确确认；确认后仅把 `--dry-run` 替换为 `--yes` 执行。不要取消 `cancellable=false` 的记录，也不要把“查询预约”当作取消成功。

## 边界

- 查询需要 `librarybooking:seat:read`；预约和取消需要 `librarybooking:seat:write`。缺少权限时按 CLI 提示重新授权，不绕过权限。
- `service_credentials(type=library)` 的 Cookie 只由后端读取。不要要求用户在对话中粘贴 Cookie，也不要把凭据写入临时页面或命令行。
- 只有预约成功响应中的 `bookingId` 才表示完成。测试产生的真实预约必须立即按上述取消流程撤销。
