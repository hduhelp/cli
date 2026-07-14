---
name: hduhelp-cli/identity
source: generated
manifest_sha256: 738449e62bdf88f6551159a699d47438c40603f04fb7a09cf163283710f2fe0f
---

# hduhelp-cli identity skill

This file is generated from the code-owned manifest. Do not edit it.

## identity bindings

- operationId: `IdentityService_Bindings`
- HTTP: GET /hduhelp-neo/identity/bindings
- 说明: 查询绑定列表
- 必需 scope: identity:binding:read
- 响应体: application/json，schema `#/components/schemas/BindingsResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

## identity me

- operationId: `IdentityService_Me`
- HTTP: GET /hduhelp-neo/identity/me
- 说明: 获取当前用户
- 必需 scope: identity:userprofile:read
- 响应体: application/json，schema `#/components/schemas/MeResponseBody`
- 错误策略: HTTP 非 2xx 或业务响应 `code != 0` 时 CLI 以失败退出；缺少必需 scope 时先运行 `auth reauthorize --scope <missing_scope>`。

