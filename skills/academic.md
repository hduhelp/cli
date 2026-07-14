---
name: hduhelp-cli/academic
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli academic skill

This file is generated from the code-owned manifest. Do not edit it.

## academic city-code

- operationId: `AcademicService_CityByCode`
- HTTP: GET /hduhelp-neo/academic/city-code
- 说明: 按城市编码查询城市名称
- 必需 scope: academic:studentorigin:read
- 参数:
  - query code
- 响应体: application/json，schema `#/components/schemas/CityByCodeResponseBody`
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

## academic classroom

- operationId: `AcademicService_GetClassrooms`
- HTTP: GET /hduhelp-neo/academic/classroom
- 说明: 获取教室列表
- 必需 scope: academic:classroom:read
- 参数:
  - query buildingID
  - query status
  - query week
  - query weekday
  - query section
  - query schoolYear
  - query semester
- 响应体: application/json，schema `#/components/schemas/ClassroomsResponseBody`
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

## academic config

- operationId: `AcademicService_AcademicConfig`
- HTTP: GET /hduhelp-neo/academic/config
- 说明: 获取学年学期配置
- 响应体: application/json，schema `#/components/schemas/AcademicConfigResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic course

- operationId: `AcademicService_Course`
- HTTP: GET /hduhelp-neo/academic/course
- 说明: 按班级号批量查询课程
- 必需 scope: academic:course:read
- 参数:
  - query id
- 响应体: application/json，schema `#/components/schemas/CourseResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic course-selection

- operationId: `AcademicService_StudentSelections`
- HTTP: GET /hduhelp-neo/academic/course-selection
- 说明: 查询本人选课信息
- 必需 scope: academic:studentselection:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SelectResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic directory birthdays

- operationId: `AcademicService_StudentBirthdays`
- HTTP: GET /hduhelp-neo/academic/directory/birthdays
- 说明: 查询生日目录
- 必需 scope: academic:studentdirectory:read
- 参数:
  - query month
  - query day
- 响应体: application/json，schema `#/components/schemas/BirthdaysResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic directory count

- operationId: `AcademicService_StudentCount`
- HTTP: GET /hduhelp-neo/academic/directory/count
- 说明: 按年级统计学生人数
- 必需 scope: academic:studentdirectory:read
- 参数:
  - query grade
- 响应体: application/json，schema `#/components/schemas/StudentCountResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic directory grade

- operationId: `AcademicService_GlobalStudentGrade`
- HTTP: GET /hduhelp-neo/academic/directory/grade
- 说明: 查询成绩目录
- 必需 scope: academic:gradedirectory:read
- 参数:
  - query schoolYear
  - query semester
- 响应体: application/json，schema `#/components/schemas/GlobalStudentGradeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic directory person

- operationId: `AcademicService_AllPersonInfo`
- HTTP: GET /hduhelp-neo/academic/directory/person
- 说明: 查询在校人员目录
- 必需 scope: academic:studentdirectory:read
- 响应体: application/json，schema `#/components/schemas/AllPersonInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic dorm

- operationId: `AcademicService_StudentDorm`
- HTTP: GET /hduhelp-neo/academic/dorm
- 说明: 查询本人宿舍信息
- 必需 scope: academic:studentaccommodation:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/DormInfoResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic exam

- operationId: `AcademicService_StudentExam`
- HTTP: GET /hduhelp-neo/academic/exam
- 说明: 查询本人考试安排
- 必需 scope: academic:exam:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentExamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic exam today

- operationId: `AcademicService_DailyExam`
- HTTP: GET /hduhelp-neo/academic/exam/today
- 说明: 查询本人指定日期的考试安排
- 必需 scope: academic:exam:read
- 参数:
  - query date
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentExamResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic freshman info

- operationId: `AcademicService_FreshmanDetail`
- HTTP: GET /hduhelp-neo/academic/freshman/info
- 说明: 查询新生信息
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

## academic gate-access

- operationId: `AcademicService_PostStudentGateAccess`
- HTTP: POST /hduhelp-neo/academic/gate-access
- 说明: 上报学生门禁放行时段
- 必需 scope: academic:gateaccess:read
- 响应体: application/json，schema `#/components/schemas/GateAccessResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic grade

- operationId: `AcademicService_StudentGrade`
- HTTP: GET /hduhelp-neo/academic/grade
- 说明: 查询本人成绩与绩点
- 必需 scope: academic:grade:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StudentGradeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic holiday-stay

- operationId: `AcademicService_StudentStaySchool`
- HTTP: GET /hduhelp-neo/academic/holiday-stay
- 说明: 查询本人假期留校信息
- 必需 scope: academic:studentstatus:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/StaySchoolResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library attendance

- operationId: `AcademicService_LibraryAttendance`
- HTTP: GET /hduhelp-neo/academic/library/attendance
- 说明: 按维度查询本人图书馆在馆统计
- 必需 scope: academic:libraryattendance:read
- 参数:
  - query dimension
  - query start
  - query end
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/LibraryAttendanceResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library reading

- operationId: `AcademicService_LibraryReading`
- HTTP: GET /hduhelp-neo/academic/library/reading
- 说明: 按指标查询本人阅读数据
- 必需 scope: academic:libraryborrow:read
- 参数:
  - query metric
  - query start
  - query end
  - query page
  - query size
  - query batch
  - query staffIds
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/LibraryReadingResponseBody`
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

## academic library share get

- operationId: `AcademicService_LibraryShareStaff`
- HTTP: GET /hduhelp-neo/academic/library/share
- 说明: 根据分享 ID 解析学号
- 必需 scope: academic:libraryshare:read
- 参数:
  - query share_id
- 响应体: application/json，schema `#/components/schemas/ShareStaffResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic library share post

- operationId: `AcademicService_LibraryShareID`
- HTTP: POST /hduhelp-neo/academic/library/share
- 说明: 创建或获取本人图书馆分享 ID
- 必需 scope: academic:libraryshare:write
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/ShareIDResponseBody`
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

## academic origin-city

- operationId: `AcademicService_StudentCity`
- HTTP: GET /hduhelp-neo/academic/origin-city
- 说明: 查询本人生源地城市
- 必需 scope: academic:studentorigin:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/CityInfoResponseBody`
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

## academic previous-school

- operationId: `AcademicService_PreviousSchool`
- HTTP: GET /hduhelp-neo/academic/previous-school
- 说明: 查询生源中学与同校同城统计
- 必需 scope: academic:previousschool:read
- 参数:
  - query schoolName
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/PreviousSchoolResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic previous-school city

- operationId: `AcademicService_ModifyPreviousSchoolCity`
- HTTP: POST /hduhelp-neo/academic/previous-school/city
- 说明: 修改本人生源地城市
- 必需 scope: academic:studentorigin:write
- 参数:
  - header X-Staff-Id
- 请求体: application/json
- CLI JSON 参数: --body '{...}' 或 --set key=value
- 响应体: application/json，schema `#/components/schemas/ModifyCityResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic reward

- operationId: `AcademicService_StudentRewards`
- HTTP: GET /hduhelp-neo/academic/reward
- 说明: 查询本人奖励信息
- 必需 scope: academic:studentreward:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/RewardsResponseBody`
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

## academic schedule global

- operationId: `AcademicService_GlobalSchedule`
- HTTP: GET /hduhelp-neo/academic/schedule/global
- 说明: 获取全局课表(内部)
- 必需 scope: academic:schedule:read
- 参数:
  - query week
  - query weekday
- 响应体: application/json，schema `#/components/schemas/GlobalScheduleResponseBody`
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

## academic school-roll-status

- operationId: `AcademicService_StudentSchoolRollStatus`
- HTTP: GET /hduhelp-neo/academic/school-roll-status
- 说明: 查询本人学籍状态
- 必需 scope: academic:studentstatus:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/SchoolRollStatusResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## academic schooltime semester list-by-date

- operationId: `AcademicService_SemesterListByDate`
- HTTP: GET /hduhelp-neo/academic/schooltime/semester/list-by-date
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

## academic teaching-class

- operationId: `AcademicService_TeachingClass`
- HTTP: GET /hduhelp-neo/academic/teaching-class
- 说明: 查询教学班
- 必需 scope: academic:teachingclass:read
- 参数:
  - query unit_id
  - query grade
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/TeachingClassResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

