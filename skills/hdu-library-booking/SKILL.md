---
name: hdu-library-booking
domain: librarybooking
description: 使用 hduhelp-cli 完成杭电图书馆座位预约、实时选座、查看预约和取消预约；当用户提到预约图书馆、自习室、阅览室、书院座位或取消图书馆座位时使用。
---

# HDU 图书馆座位预约

先运行 `hduhelp-cli capabilities --domain librarybooking --json`，并用 `hduhelp-cli commands list --domain librarybooking --json` 校验当前版本操作。只使用接口返回的 ID，不猜测空间、日期、时间、房间、座位或预约编号。人数由后端固定为 1，不向用户询问人数，也不传人数参数。

## 预约流程

把预约所需信息视为六项：空间、日期、开始时间、时长、房间、座位。保留用户已经明确给出的信息，只补齐缺失项：

1. 空间缺失，或只有空间名称而没有 `categoryId/contentId`：调用 `hduhelp-cli librarybooking categories --json`，展示未禁用分类，等待用户选择。名称能唯一匹配时可直接采用对应 ID。
2. 日期、开始时间或时长任一缺失：调用 `hduhelp-cli librarybooking options --category-id <id> --content-id <id> --json`。只展示返回的 `dates[].times[]` 组合；时长必须来自所选开始时间的 `durationHours`。
3. 前四项齐全：调用 `hduhelp-cli librarybooking seats search --category-id <id> --content-id <id> --date <YYYY-MM-DD> --begin-time <HH:mm> --duration-hours <n> --output-file <临时JSON>`。
4. 用本 Skill 的 `scripts/render-seat-map.mjs` 生成页面：`node <本Skill目录>/scripts/render-seat-map.mjs --input <临时JSON> --output <座位图HTML>`，然后打开该 HTML。页面保持所有座位颜色，缩小到 1 倍以下隐藏座位号，放大到 1 倍及以上显示座位号；用户可切换房间、筛选空闲/插座座位并点击可预约座位。
5. 等待用户给出页面中选中的 `roomId` 和 `seatId`。复述空间、日期、时间、房间和座位号，让用户确认是在执行真实预约；不要替用户选择座位。
6. 用户确认后调用 `hduhelp-cli librarybooking bookings post --data '<包含 categoryId、contentId、date、beginTime、durationHours、roomId、seatId 的 JSON>' --yes --json`。服务端会再次实时验座，失败时重新查询，不复用过期结果。

用户改变空间、日期、时间、时长，或明确放弃选座时，删除本次临时 JSON/HTML。后端会在每次实时座位查询后自动释放上游推荐锁，调用方无需额外执行解锁操作。若实时查询没有空座，给出改时间或空间的选项，不循环请求。

## 取消流程

取消前无条件先调用 `hduhelp-cli librarybooking bookings get --json`，向用户展示 `cancellable=true` 的预约（预约编号、房间、座位、开始和结束时间），等待用户选择。即使用户直接给了 `bookingId`，也必须先查询并确认它仍在可取消列表中。

用户选定后先运行 `hduhelp-cli librarybooking bookings delete --booking-id <id> --dry-run --json`，展示将取消的预约并等待明确确认；确认后仅把 `--dry-run` 替换为 `--yes` 执行。不要取消 `cancellable=false` 的记录，也不要把“查询预约”当作取消成功。

## 边界

- 查询需要 `librarybooking:seat:read`；预约和取消需要 `librarybooking:seat:write`。缺少权限时按 CLI 提示重新授权，不绕过权限。
- `service_credentials(type=library)` 的 Cookie 只由后端读取。不要要求用户在对话中粘贴 Cookie，也不要把凭据写入临时页面或命令行。
- 只有预约成功响应中的 `bookingId` 才表示完成。测试产生的真实预约必须立即按上述取消流程撤销。
