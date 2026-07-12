---
name: hduhelp-cli/academic
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli academic skill

This file is generated from the code-owned manifest. Do not edit it.

## academic all person info

- operationId: `AcademicService_AllPersonInfo`
- HTTP: GET /hduhelp-neo/academic/all/person/info
- 说明: 查询全部在校人员信息
- 必需 scope: academic:studentdirectory:read
- 响应体: application/json，schema `#/components/schemas/AllPersonInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class detail

- operationId: `AcademicService_ClassDetail`
- HTTP: GET /hduhelp-neo/academic/class/detail
- 说明: 获取课程详情
- 必需 scope: academic:course:read, academic:courseroster:read
- 参数:
  - query classID
- 响应体: application/json，schema `#/components/schemas/ClassDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class fav get

- operationId: `AcademicService_ClassQueryFavGet`
- HTTP: GET /hduhelp-neo/academic/class/fav
- 说明: 获取选课收藏
- 必需 scope: academic:coursefavorite:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ClassQueryFavGetResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class fav post

- operationId: `AcademicService_ClassQueryFavSet`
- HTTP: POST /hduhelp-neo/academic/class/fav
- 说明: 设置选课收藏
- 必需 scope: academic:coursefavorite:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/ClassQueryFavSetResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class fav rank

- operationId: `AcademicService_ClassQueryFavRank`
- HTTP: GET /hduhelp-neo/academic/class/fav/rank
- 说明: 选课收藏排行
- 必需 scope: academic:coursefavorite:read
- 响应体: application/json，schema `#/components/schemas/ClassQueryFavRankResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class get

- operationId: `AcademicService_ClassQueryGet`
- HTTP: GET /hduhelp-neo/academic/class/get
- 说明: 按班级号批量取详情
- 必需 scope: academic:course:read
- 参数:
  - query classes
- 响应体: application/json，schema `#/components/schemas/ClassQueryGetResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class map

- operationId: `AcademicService_ClassQueryMap`
- HTTP: GET /hduhelp-neo/academic/class/map
- 说明: 选课字典映射
- 必需 scope: academic:course:read
- 响应体: application/json，schema `#/components/schemas/ClassQueryMapResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic class search

- operationId: `AcademicService_ClassQuerySearch`
- HTTP: GET /hduhelp-neo/academic/class/search
- 说明: 选课检索
- 必需 scope: academic:course:read
- 参数:
  - query query
  - query size
  - query from
- 响应体: application/json，schema `#/components/schemas/ClassQuerySearchResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic classroom list

- operationId: `AcademicService_GetClassrooms`
- HTTP: GET /hduhelp-neo/academic/classroom/list
- 说明: 获取教室列表(含自习标记)
- 必需 scope: academic:classroom:read
- 参数:
  - query buildingID
  - query week
  - query weekday
  - query section
- 响应体: application/json，schema `#/components/schemas/ClassroomsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic classroom unused

- operationId: `AcademicService_UnusedClassrooms`
- HTTP: GET /hduhelp-neo/academic/classroom/unused
- 说明: 获取空闲教室
- 必需 scope: academic:classroom:read
- 参数:
  - query buildingID
  - query week
  - query weekday
  - query section
  - query schoolYear
  - query semester
- 响应体: application/json，schema `#/components/schemas/UnusedClassroomsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic classroom usage

- operationId: `AcademicService_ClassroomUsage`
- HTTP: GET /hduhelp-neo/academic/classroom/usage
- 说明: 获取教室占用
- 必需 scope: academic:classroom:read
- 参数:
  - query locationID
  - query schoolYear
  - query semester
- 响应体: application/json，schema `#/components/schemas/ClassroomUsageResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic code city

- operationId: `AcademicService_CityByCode`
- HTTP: GET /hduhelp-neo/academic/code/city
- 说明: 按城市编码查询城市名称
- 必需 scope: academic:studentorigin:read
- 参数:
  - query code
- 响应体: application/json，schema `#/components/schemas/CityByCodeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic config

- operationId: `AcademicService_AcademicConfig`
- HTTP: GET /hduhelp-neo/academic/config
- 说明: 获取学年学期配置
- 响应体: application/json，schema `#/components/schemas/AcademicConfigResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic freshman base

- operationId: `AcademicService_FreshmanBase`
- HTTP: GET /hduhelp-neo/academic/freshman/base
- 说明: 查询新生录取基础信息
- 必需 scope: academic:freshman:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FreshmanBaseResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic freshman info

- operationId: `AcademicService_FreshmanDetail`
- HTTP: GET /hduhelp-neo/academic/freshman/info
- 说明: 查询新生详细信息
- 必需 scope: academic:freshman:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FreshmanDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic freshman roommate

- operationId: `AcademicService_FreshmanRoommates`
- HTTP: GET /hduhelp-neo/academic/freshman/roommate
- 说明: 查询新生舍友信息
- 必需 scope: academic:freshman:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FreshmanRoommatesResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic global student grade

- operationId: `AcademicService_GlobalStudentGrade`
- HTTP: GET /hduhelp-neo/academic/global/student/grade
- 说明: 查询全局成绩
- 必需 scope: academic:gradedirectory:read
- 参数:
  - query schoolYear
  - query semester
- 响应体: application/json，schema `#/components/schemas/GlobalStudentGradeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic grades

- operationId: `AcademicService_Grades`
- HTTP: GET /hduhelp-neo/academic/grades
- 说明: 获取成绩与绩点
- 必需 scope: academic:grade:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GradesResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library attendance floors

- operationId: `AcademicService_LibraryFloors`
- HTTP: GET /hduhelp-neo/academic/library/attendance/floors
- 说明: 查询本人常去楼层分布
- 必需 scope: academic:libraryattendance:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FloorStatsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library attendance months

- operationId: `AcademicService_LibraryMonths`
- HTTP: GET /hduhelp-neo/academic/library/attendance/months
- 说明: 查询本人到馆月度分布
- 必需 scope: academic:libraryattendance:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/MonthlyStatsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library attendance stats

- operationId: `AcademicService_LibraryAttendanceStats`
- HTTP: GET /hduhelp-neo/academic/library/attendance/stats
- 说明: 查询本人图书馆在馆统计
- 必需 scope: academic:libraryattendance:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/AttendanceStatsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library attendance time-slots

- operationId: `AcademicService_LibraryTimeSlots`
- HTTP: GET /hduhelp-neo/academic/library/attendance/time_slots
- 说明: 查询本人到馆时段分布
- 必需 scope: academic:libraryattendance:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/TimeSlotStatsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read all

- operationId: `AcademicService_LibraryReadAll`
- HTTP: GET /hduhelp-neo/academic/library/read/all
- 说明: 查询本人汇总阅读数据
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - query page
  - query size
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/AllReadDataResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read borrows

- operationId: `AcademicService_LibraryReadBorrows`
- HTTP: GET /hduhelp-neo/academic/library/read/borrows
- 说明: 分页查询本人借阅清单
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - query page
  - query size
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/BorrowListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read first-book

- operationId: `AcademicService_LibraryReadFirstBook`
- HTTP: GET /hduhelp-neo/academic/library/read/first_book
- 说明: 查询本人首本借阅图书
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/FirstBookResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read least-popular

- operationId: `AcademicService_LibraryReadLeastPopular`
- HTTP: GET /hduhelp-neo/academic/library/read/least_popular
- 说明: 查询本人借阅最少的图书
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/LeastPopularResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read max-month

- operationId: `AcademicService_LibraryReadMaxMonth`
- HTTP: GET /hduhelp-neo/academic/library/read/max_month
- 说明: 查询本人借阅最多的月份
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/MaxMonthResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read months

- operationId: `AcademicService_LibraryReadMonths`
- HTTP: GET /hduhelp-neo/academic/library/read/months
- 说明: 查询本人借阅月度统计
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/MonthStatsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read newer

- operationId: `AcademicService_LibraryReadNewer`
- HTTP: GET /hduhelp-neo/academic/library/read/newer
- 说明: 判断本人是否本学年新生
- 必需 scope: academic:libraryborrow:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/NewerResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read preference

- operationId: `AcademicService_LibraryReadPreference`
- HTTP: GET /hduhelp-neo/academic/library/read/preference
- 说明: 查询本人借阅偏好
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/PreferenceResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read summary

- operationId: `AcademicService_LibraryReadSummary`
- HTTP: GET /hduhelp-neo/academic/library/read/summary
- 说明: 查询本人阅读摘要与排名
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ReadingSummaryResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read total-time

- operationId: `AcademicService_LibraryReadTotalTime`
- HTTP: GET /hduhelp-neo/academic/library/read/total_time
- 说明: 查询本人平均借阅时长
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/TotalTimeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read unreturned

- operationId: `AcademicService_LibraryReadUnreturned`
- HTTP: GET /hduhelp-neo/academic/library/read/unreturned
- 说明: 查询本人未归还图书
- 必需 scope: academic:libraryborrow:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/BorrowListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library read unreturned batch

- operationId: `AcademicService_GetUnreturnedBooksList`
- HTTP: GET /hduhelp-neo/academic/library/read/unreturned/batch
- 说明: 批量查询多名学生未归还图书
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query staffIds
- 响应体: application/json，schema `#/components/schemas/UnreturnedBatchResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library seat reservations

- operationId: `AcademicService_LibrarySeatReservations`
- HTTP: GET /hduhelp-neo/academic/library/seat/reservations
- 说明: 查询本人图书馆座位预约
- 必需 scope: academic:libraryseat:read
- 参数:
  - query limit
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SeatReservationListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library seat rooms

- operationId: `AcademicService_LibrarySeatRooms`
- HTTP: GET /hduhelp-neo/academic/library/seat/rooms
- 说明: 查询图书馆座位房间与座位数
- 必需 scope: academic:libraryseat:read
- 响应体: application/json，schema `#/components/schemas/SeatRoomListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library share share

- operationId: `AcademicService_LibraryShareID`
- HTTP: GET /hduhelp-neo/academic/library/share/share
- 说明: 获取本人图书馆分享 ID
- 必需 scope: academic:libraryshare:write
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ShareIDResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library share staff

- operationId: `AcademicService_LibraryShareStaff`
- HTTP: GET /hduhelp-neo/academic/library/share/staff
- 说明: 根据分享 ID 解析学号
- 必需 scope: academic:libraryshare:read
- 参数:
  - query share_id
- 响应体: application/json，schema `#/components/schemas/ShareStaffResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic needy

- operationId: `AcademicService_NeedyList`
- HTTP: GET /hduhelp-neo/academic/needy
- 说明: 查询困难生认定列表
- 必需 scope: academic:financialaiddirectory:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/NeedyListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic needy student

- operationId: `AcademicService_NeedyStudentInfo`
- HTTP: GET /hduhelp-neo/academic/needy/student
- 说明: 查询本人困难生认定信息
- 必需 scope: academic:financialaid:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentNeedyInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic person info

- operationId: `AcademicService_PersonInfo`
- HTTP: GET /hduhelp-neo/academic/person/info
- 说明: 查询本人人员信息
- 必需 scope: academic:student:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/PersonInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic previous-school city

- operationId: `AcademicService_ModifyPreviousSchoolCity`
- HTTP: POST /hduhelp-neo/academic/previous_school/city
- 说明: 修改本人生源地城市
- 必需 scope: academic:studentorigin:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/ModifyCityResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic previous-school detail

- operationId: `AcademicService_PreviousSchoolDetail`
- HTTP: GET /hduhelp-neo/academic/previous_school/detail
- 说明: 查询生源中学同校同城统计
- 必需 scope: academic:previousschool:read
- 参数:
  - query schoolName
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/PreviousSchoolDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic previous-school info

- operationId: `AcademicService_PreviousSchoolInfo`
- HTTP: GET /hduhelp-neo/academic/previous_school/info
- 说明: 查询本人生源中学信息
- 必需 scope: academic:previousschool:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/PreviousSchoolInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schedule

- operationId: `AcademicService_Schedule`
- HTTP: GET /hduhelp-neo/academic/schedule
- 说明: 获取学期课表
- 必需 scope: academic:schedule:read
- 参数:
  - query timestamp
  - query schoolYear
  - query semester
  - query week
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ScheduleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schedule now

- operationId: `AcademicService_ScheduleNow`
- HTTP: GET /hduhelp-neo/academic/schedule/now
- 说明: 获取今明课表
- 必需 scope: academic:schedule:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ScheduleNowResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schedule now v3

- operationId: `AcademicService_ScheduleNowV3`
- HTTP: GET /hduhelp-neo/academic/schedule/now/v3
- 说明: 获取近六日课表(v3)
- 必需 scope: academic:schedule:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ScheduleNowV3ResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schedule private global

- operationId: `AcademicService_GlobalSchedule`
- HTTP: GET /hduhelp-neo/academic/schedule/private/global
- 说明: 获取全局课表(内部)
- 必需 scope: academic:schedule:read
- 参数:
  - query week
  - query weekday
- 响应体: application/json，schema `#/components/schemas/GlobalScheduleResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schedule v2 now

- operationId: `AcademicService_ScheduleNowV2`
- HTTP: GET /hduhelp-neo/academic/schedule/v2/now
- 说明: 获取今明课表(v2)
- 必需 scope: academic:schedule:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ScheduleNowV2ResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schooltime semester listbydate

- operationId: `AcademicService_SemesterListByDate`
- HTTP: GET /hduhelp-neo/academic/schooltime/semester/listByDate
- 说明: 按日期范围查询学期列表
- 必需 scope: academic:semester:read
- 参数:
  - query start_date
  - query end_date
- 响应体: application/json，schema `#/components/schemas/SemesterListResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schooltime time

- operationId: `AcademicService_SchoolTime`
- HTTP: GET /hduhelp-neo/academic/schooltime/time
- 说明: 查询当前校历时间
- 必需 scope: academic:schooltime:read
- 响应体: application/json，schema `#/components/schemas/SchoolTimeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic skl unit detail

- operationId: `AcademicService_SklUnitDetail`
- HTTP: GET /hduhelp-neo/academic/skl/unit/detail
- 说明: 查询教学班成员详情
- 必需 scope: academic:teachingclass:read
- 参数:
  - query unit_id
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SklUnitDetailResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic skl unit info

- operationId: `AcademicService_SklUnits`
- HTTP: GET /hduhelp-neo/academic/skl/unit/info
- 说明: 查询本人所属教学班信息
- 必需 scope: academic:teachingclass:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SklUnitInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student birthday

- operationId: `AcademicService_StudentBirthday`
- HTTP: GET /hduhelp-neo/academic/student/birthday
- 说明: 查询本人生日
- 必需 scope: academic:studentdirectory:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/BirthdayResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student birthdays

- operationId: `AcademicService_StudentBirthdays`
- HTTP: GET /hduhelp-neo/academic/student/birthdays
- 说明: 查询指定日期生日的学生
- 必需 scope: academic:studentdirectory:read
- 参数:
  - query month
  - query day
- 响应体: application/json，schema `#/components/schemas/BirthdaysResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student city

- operationId: `AcademicService_StudentCity`
- HTTP: GET /hduhelp-neo/academic/student/city
- 说明: 查询本人生源地城市
- 必需 scope: academic:studentorigin:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/CityInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student count

- operationId: `AcademicService_StudentCount`
- HTTP: GET /hduhelp-neo/academic/student/count
- 说明: 按年级统计学生人数
- 必需 scope: academic:studentdirectory:read
- 参数:
  - query grade
- 响应体: application/json，schema `#/components/schemas/StudentCountResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student dailyexam

- operationId: `AcademicService_DailyExam`
- HTTP: GET /hduhelp-neo/academic/student/dailyExam
- 说明: 查询本人指定日期的考试安排
- 必需 scope: academic:exam:read
- 参数:
  - query date
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentExamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student dorm

- operationId: `AcademicService_StudentDorm`
- HTTP: GET /hduhelp-neo/academic/student/dorm
- 说明: 查询本人宿舍信息
- 必需 scope: academic:studentaccommodation:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DormInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student exam

- operationId: `AcademicService_StudentExam`
- HTTP: GET /hduhelp-neo/academic/student/exam
- 说明: 查询本人考试安排
- 必需 scope: academic:exam:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentExamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student gate-access

- operationId: `AcademicService_PostStudentGateAccess`
- HTTP: POST /hduhelp-neo/academic/student/gate_access
- 说明: 上报学生门禁放行时段
- 必需 scope: academic:gateaccess:read
- 响应体: application/json，schema `#/components/schemas/GateAccessResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student gpa

- operationId: `AcademicService_StudentGPA`
- HTTP: GET /hduhelp-neo/academic/student/gpa
- 说明: 查询本人学期与总绩点
- 必需 scope: academic:grade:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentGPAResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student grade

- operationId: `AcademicService_StudentGrade`
- HTTP: GET /hduhelp-neo/academic/student/grade
- 说明: 查询本人成绩明细
- 必需 scope: academic:grade:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentGradeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student holidaystay

- operationId: `AcademicService_StudentStaySchool`
- HTTP: GET /hduhelp-neo/academic/student/holidayStay
- 说明: 查询本人假期留校信息
- 必需 scope: academic:studentstatus:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StaySchoolResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student info

- operationId: `AcademicService_StudentInfo`
- HTTP: GET /hduhelp-neo/academic/student/info
- 说明: 查询本人学籍信息
- 必需 scope: academic:student:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student reward

- operationId: `AcademicService_StudentRewards`
- HTTP: GET /hduhelp-neo/academic/student/reward
- 说明: 查询本人奖励信息
- 必需 scope: academic:studentreward:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/RewardsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student schoolrollstatus

- operationId: `AcademicService_StudentSchoolRollStatus`
- HTTP: GET /hduhelp-neo/academic/student/schoolRollStatus
- 说明: 查询本人学籍状态
- 必需 scope: academic:studentstatus:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SchoolRollStatusResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic student select

- operationId: `AcademicService_StudentSelections`
- HTTP: GET /hduhelp-neo/academic/student/select
- 说明: 查询本人选课信息
- 必需 scope: academic:studentselection:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SelectResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

