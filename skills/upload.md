---
name: hduhelp-cli/upload
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli upload skill

This file is generated from the code-owned manifest. Do not edit it.

## upload get

- operationId: `UploadService_Download`
- HTTP: GET /hduhelp-neo/upload
- 说明: 获取已上传文件
- 参数:
  - query key
- 响应体: application/octet-stream
- CLI 输出: `--output FILE` 流式保存；小响应也可用 `--raw` 输出到 stdout。
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## upload post

- operationId: `UploadService_Upload`
- HTTP: POST /hduhelp-neo/upload
- 说明: 上传文件
- 必需 scope: upload:file:write
- 参数:
  - query usage
- 请求体: multipart/form-data
- CLI 文件参数: --file FILE（字段 file），其它表单字段使用 --form key=value
- 响应体: application/json，schema `#/components/schemas/UploadResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

