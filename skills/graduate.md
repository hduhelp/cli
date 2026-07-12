---
name: hduhelp-cli/graduate
source: generated
manifest_sha256: 414ee3f014eb69d5134e1553d6b530d72fe1b901228385a24611f8b080756afe
---

# hduhelp-cli graduate skill

This file is generated from the code-owned manifest. Do not edit it.

## graduate grades

- operationId: `GraduateService_GraduateGrades`
- HTTP: GET /hduhelp-neo/graduate/grades
- 说明: 查询本人研究生成绩
- 必需 scope: graduate:grade:read
- 参数:
  - query schoolYear
  - query semester
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GraduateGradesResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## graduate info

- operationId: `GraduateService_GraduateInfo`
- HTTP: GET /hduhelp-neo/graduate/info
- 说明: 查询本人研究生学籍/个人信息
- 必需 scope: graduate:student:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GraduateProfileResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## graduate tutors

- operationId: `GraduateService_GraduateTutors`
- HTTP: GET /hduhelp-neo/graduate/tutors
- 说明: 查询本人研究生导师
- 必需 scope: graduate:tutor:read
- 参数:
  - header X-Staff-Id
- 响应体: application/json，schema `#/components/schemas/GraduateTutorsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

