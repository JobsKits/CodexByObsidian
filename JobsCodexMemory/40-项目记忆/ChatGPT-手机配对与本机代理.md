---
type: environment-memory
status: confirmed
scope: Jobs 本机 ChatGPT 桌面应用与手机远控
app_path: /Applications/ChatGPT.app
created: 2026-10-18
updated: 2026-10-25
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
- 启动器提供 `1、代理 / 2、不代理` 菜单，按用户 2026-10-18 的明确要求，回车默认代理；该选择同时完成本次运行确认，非法输入重选，不能静默切换模式。
- 用户同日进一步要求：选代理后本地端口未就绪不能直接结束，须提示开启 VPN / 代理并等待回车，每次回车重新检测，未通过则继续提示，直到检测通过或用户取消。已实现独立 `probe_proxy_once` / `wait_for_proxy`：单次探测有超时、无自动空转、Ctrl+C 或输入结束取消；只验证本机端口，不能据此声称上游或远控已连接。
- 通过 macOS `open -g -a ...` 请求后台启动，标准输入、输出和错误均连接 `/dev/null`。先从子命令环境清除终端继承的代理和诊断变量；仅代理模式用 `--env` 注入大小写 HTTP / HTTPS / ALL_PROXY 与本机 NO_PROXY，不修改父终端、系统代理或登录信息。
- 不代理表示取消本启动器的代理注入、恢复原生系统网络行为，并不强制绕过系统或应用已有代理。先手动退出应用再重选 2，即可取消本脚本注入；不能把清空现有进程环境或关闭系统代理说成已完成。
- 已运行的 ChatGPT 不能通过 `open --env` 补入新环境，因此启动器只提示用户先按 ⌘Q 退出，不自动终止任务，不加 `-n` 多开。
- `--check` 自检代理模式，`--check --native` 自检不代理模式；均不启动或切换应用，单次自检失败返回非零且不等待交互，原生模式不要求代理端口可用。菜单默认回车 / 2 / 无效输入重选、两分支参数及变量隔离、语法和真实环境两模式自检通过；新增循环已隔离验证连续失败两次后回车成功、Ctrl+C 取消、自检仅检测一次与原生模式不检测。未实际退出或启动当前 ChatGPT。
- 每次运行在 `~/Library/Logs/ChatGPT-Remote-Launcher` 独立记录时间、模式、作用范围、脚本 SHA-256、恢复入口和结果（目录 0700、文件 0600），不记录环境变量原值或凭据。旧版代码备份与哈希记录保留在 `~/Library/Application Support/ChatGPT-Remote-Launcher/backups`。

## 临时隔离 Dolphin Cove 与 aTrust（2026-10-25）

- 用户明确要求：本机 Dolphin Cove 只供 ChatGPT 使用，其他流量保留原有路径；确认另一个 VPN 是 aTrust，专门服务当前 VSCode 任务。本次属于临时调整，后续需要恢复，不能把它推广成永久全局代理偏好。
- 用户已明确同意为应用专用代理重启 ChatGPT 一次；aTrust、VSCode 的进程、配置和内网路由均不在修改范围内。
- 只读确认 Dolphin Cove 在 `127.0.0.1:7990` 监听，TUN 未启用；其系统代理当时已覆盖 5 个网络服务的 HTTP / HTTPS / SOCKS 共 15 个开关。VSCode 当时也有连接经过 7990，因此不能笼统声称关闭系统代理完全不改变其后续公网连接；aTrust 的既有内网路由须保留。
- 已准备 `/Users/jobs/Documents/Codex/2026-10-25/qu-a/outputs/ChatGPT临时代理/`：`snapshot.json` 保存必要原状态，`【MacOS】↩️恢复原系统代理.command` 逐项校验后恢复本次写入，`【MacOS】🚀仅ChatGPT走Dolphin.command` 为新 ChatGPT 注入进程代理与 Chromium 网络代理参数；不会改旧桌面启动器、Dolphin 账号 / 订阅、全局环境或 DNS。
- 实施方案只临时关闭精确指向本机 7990 的已开启系统代理开关，保留地址、端口、PAC 与绕过列表。Dolphin 内部系统代理偏好未改；用户重新启用系统代理或重启 Dolphin 后需复核，不能假定永久保持隔离。
- 记录时状态：快照与恢复入口已准备，隔离验证和脚本语法通过，实际调整及重启待独立执行器完成；最终真实结果以同目录 `status.json`、`snapshot.json` 和 `audit.jsonl` 为准。后续会话先读这些结果，不把“已安排”当成“已验证”。
