---
type: environment-memory
status: confirmed
scope: Jobs 本机 ChatGPT 桌面应用与手机远控
app_path: /Applications/ChatGPT.app
created: 2026-10-18
updated: 2026-10-18
source: 当前对话中的本机日志、网络对照及用户成功确认
---

# ChatGPT 手机配对与本机代理

## 已确认的排查结果

- 2026-10-18 用户确认：为 ChatGPT（原 Codex）桌面启动进程显式设置 `HTTP_PROXY`、`HTTPS_PROXY`、`ALL_PROXY` 为 `http://127.0.0.1:7990` 后，手机连接设置成功。此次测试的代理来自 Dolphin Cove；端口是当时本机实测值，迁移电脑或更改代理时须重新读取。
- 之前存在两个先后出现的阻塞：账户需要启用 MFA；用户完成身份验证器设置后，桌面远控 WebSocket 仍反复在 30 秒后超时。普通重启未解决连接超时。
- 真实远控地址为 `wss://chatgpt.com/backend-api/wham/remote/control/server`。无凭据对照测试中，直连 TCP 超时，显式走本机 HTTP / SOCKS 代理均在一秒内收到服务器响应；该无凭据响应本身不代表配对成功。
- 显式代理启动后，本机详细日志于北京时间 2026-10-18 00:20:45 记录 `Connecting → Connected`，并记录远控 WebSocket 已连接；随后用户明确反馈“这次可以了”。

## 后续操作边界

- 浏览器登录成功、系统代理已开启，不能替代远控长连接的实际连通性验证。不能把这次结果泛化为所有 Codex / ChatGPT 版本都不支持 macOS 系统代理；当次具体代理选路分支未完全确认。
- `env ... /Applications/ChatGPT.app/Contents/MacOS/ChatGPT` 直接在终端运行应用。用户确认关闭终端后应用也退出；后续提供启动方案时要处理应用与终端的会话关系，并保留已验证的代理变量。
- 诊断时已核实 `CODEX_MAX_LOG_LEVEL=debug` 可显示 `Codex CLI stderr`；配合 `RUST_LOG=warn,codex_app_server_transport::transport::remote_control=debug` 可取得远控状态和底层错误。调试设置只用于必要的排查，不保存日志中的账户、设备、配对或凭据信息。
- 电脑控制工具曾明确拒绝操作 `com.openai.codex`。可继续做只读日志和网络诊断；不得换用 Shell UI 自动化或内部接口绕过限制。

## 桌面启动入口

- 2026-10-18 用户明确要求创建系统桌面双击启动器，并澄清“后台运行”指关闭终端后不影响 Codex 远程连接。
- 已交付 `/Users/jobs/Desktop/【MacOS】🚀ChatGPT远控启动.command`，入口为原生 `/bin/zsh`；本机代理地址集中定义在脚本顶部。
- 启动器通过 macOS `open -g -a ... --env ...` 请求后台启动，标准输入、输出和错误均连接 `/dev/null`；同时注入大小写 HTTP / HTTPS / ALL_PROXY，并将 NO_PROXY 限定为本机地址。正常使用关闭调试级别，不修改登录信息或系统代理。
- 已运行的 ChatGPT 不能通过 `open --env` 补入新环境，因此启动器只提示用户先按 ⌘Q 退出，不自动终止任务，不加 `-n` 多开。
- `--check` 只检查应用、7990 端口和主进程状态，不执行应用启动。已通过 `zsh -n` 和真实环境自检，识别当前主进程运行中；未实际退出或启动当前 ChatGPT。日志位于系统临时目录中的同名 `.log` 文件。
