---
type: project-memory
status: active
scope: JobsMacEnvVarConfigs-window-recording
repository: /Users/jobs/Documents/GitHub/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs
source: 2026-11-14 用户要求从本地 screcord 蒸馏改写 .command，并先体检、补齐及复检依赖
created: 2026-11-14
updated: 2026-11-14
tags:
  - codex-memory
  - project
  - scripts
---

# JobsMacEnvVarConfigs 窗口录屏

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 保存已确认的终端录屏方向、源码归属、依赖门禁和交付验证边界。

## 一、<span id="scope">已确认方向</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-14 明确要求；状态：需求 confirmed。只录浏览器／明确窗口，不框选区域；从终端使用，不采用浏览器扩展。要求扫描本地第三方源码，蒸馏成目标环境配置仓库的 `.command`，依赖先体检、不满足则补齐并复检后再运行。
- 上游只读参考仓为 `/Users/jobs/Documents/GitHub/3rd/screcord`，来源 [bcharleson/screcord](https://github.com/bcharleson/screcord)，本次基线 `c8d6e37f70301009fa8bc8b8a86686e1b65ab681`；未修改或提交上游。新包为 Jobs 独立实现，不以下载目录或上游构建产物作为运行依赖。
- 用户同日补充 confirmed：工具 README 靠前明确写“参考自 screcord”，其中 screcord 必须超链接至原仓库。
- 用户同日再次补充 confirmed：本仓 `scripts/` 下功能包按终端调用名命名，例如 `code.command` 对应短命令 `code`；本次窗口录屏统一为 `jrecord.command/` 内的 `jrecord.command`，旧中文包名已 `superseded`。本次实施范围为录屏包及真实调用引用，其它功能不纳入本轮重命名。
- 用户同日补充 confirmed：录制开始前全屏显示 5→1 秒倒计时，数字外有两圈圆，数字逐秒出现、以心跳式缩放和淡出衔接；提示必须穿透鼠标点击、不抢焦点，桌面和应用仍可正常操作。实现及运行态限定验证见[本次验证](#verification)。
- 后续用户明确 confirmed：强制关闭启动录屏的终端就等于停止本次录制，不能在后台继续；已有片段应尽力封尾保存。
- 后续用户明确 confirmed：从 `list` 误选功能后，在最初用途确认处按 `←` 应直接返回真实来源 `list`，不开始业务、不递归重开菜单；独立启动时不擅自打开 `list`。

## 二、<span id="implementation">源码和运行边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 源码包为 `scripts/jrecord.command/`，同名入口加 `Core/` 原生源码；必须复制整个包。短命令 `jrecord` 已在源码 entrypoints、list 和根安装器注册；安装器使用完整包转发器，不能裸复制入口而遗漏 Core。
- 原生内核使用 MacOS 15+ ScreenCaptureKit／SCRecordingOutput，无第三方 Swift 包；默认无声音，只采集真实窗口 ID、PID、Bundle ID 和启动时间复核后的窗口。`system` 音频可选，不能保证隔离同应用其它窗口声音；无麦克风、整屏、矩形回退、摄像头或分段。
- 先独立暂存，验证正时长与视频轨道后 `RENAME_EXCL` 发布单个 MP4；不覆盖已有输出，失败保留暂存。不使用列表序号或子串首个匹配代替身份选择。
- Apple 工具链／MacOS 15+ SDK 是原生编译依赖；交互另需 fzf，缺失才经健康 Homebrew 安装／修复。SDK 网络获取持续可取消退避重试；权限、许可、磁盘及系统版本不可由脚本绕过。健康依赖不做全员升级，不改全局 Shell／代理配置。
- `--doctor` 只体检；`--prepare` 补齐并编译但不录屏；帮助优先返回；默认交互最后明确选择开始。原生 Ctrl+C 保存，终端退出尽力封尾；仅清理本次身份复核的进程树。
- 用户于 2026-11-14 实际使用后补充 confirmed：每次录制前询问保存目录，默认系统桌面；保存成功后询问是否打开录制文件所在目录，默认不打开。显式 `--output` 尊重指定地址；非交互缺少地址须停止，不能静默沿用旧 Movies 目录。Ctrl+C 正常保存后也必须进入目录询问。
- 同日窗口枚举纠正 scoped-verified：列表单位为应用窗口，不是标签页。默认列有效且有标题的窗口，最小化／其它空间的正常命名窗仍保留并标注 `[隐藏]`；`--include-auxiliary` 仅显式加入无标题辅助候选，与 `--all` 应用范围独立。录制期间仍完整枚举复核原目标，不因列表过滤规则误停。
- 同日再次实机复核 scoped-verified：用户保留一个 Chrome 主窗口，默认枚举确为 1 项，截图多出的 4 项来自当时已开启的辅助显示。普通选窗菜单已移除辅助切换行，仅保留启动参数 `--include-auxiliary` 的明确诊断入口；header 显示模式、应用范围和真实窗口数，隐藏 fzf 含操作行的总数。空态只属于当前 header，零到一重载后替换，不在列表上方遗留旧空态日志。新菜单与说明已备份同步至实际运行包，浏览器未被操作。
- 同日运行态同步 verified：用户当前入口确实位于 `~/.JobsMacEnv/Scripts/`，本轮已先对比原包并保留完整备份，再同步新包，与源码逐文件一致；新登录 Shell 的 `jrecord --prepare` 和默认列窗已验证。没有运行全仓安装器或改写全局 Shell 配置。
- 媒体停止只信号本次原生内核，日志 tee 保留至 EOF；准备／下载阶段仍按身份回收进程树。监督父 Shell 不掩盖媒体 INT 成功码，并转发 TERM/HUP；原生录制生命周期忽略 SIGPIPE，防日志管道中断破坏视频封尾。
- 同日用户补充 confirmed：帧率、声音行回车必须进入独立 fzf 子菜单；帧率除预设外支持只接收数字的手动输入。当前内核范围为 1..60，预设 15／24／25／30／50／60；声音提供静音 none／系统应用声音 system。← 必须逐级返回，手动输入→帧率→录制配置→窗口→来源 list；独立启动的窗口层返回终端，Esc 取消本轮。录后目录菜单的 ← 返回来源，不再次录制。实现 scoped-verified：来源 list 仅向该子功能传递父层标记并处理返回码 20，无额外回车或递归启动；手动输入拒绝非法字符、范围及整段混合粘贴，纯数字粘贴需真实回车，←／Esc／Ctrl+C 均恢复临时终端输入模式。源码、完整运行包和实际 list 短命令已备份并同步一致。
- 同日倒计时实现 scoped-verified：确认开始后显示五秒提示，移除全部透明提示窗后重新复核原目标再采集，倒计时不计入视频时长。提示不改变前台／key 窗口，真实鼠标点击能穿透到下层应用；倒计时期间 INT／TERM／HUP 分别返回 130／143／129，不生成输出并清理本次空暂存目录，不进入录后打开目录菜单。
- 同日改名及运行态部署 verified：旧运行包与源码改名前快照完全一致，先完整备份到 `/Users/jobs/.codex/backups/jrecord-countdown-20261114.RdcGJp`，再迁为 `~/.JobsMacEnv/Scripts/jrecord.command/`；实际 list、entrypoints 和 `~/.local/bin/jrecord` 均指向新包，与源码逐文件一致。新登录 Shell 的 `jrecord --help` 及真实 `jrecord --prepare` 编译复检通过；原已打开终端／旧 list 须重新打开以加载新映射，不保留旧中文包兼容入口。未运行全仓安装器或改写全局 Shell 配置。
- 后续终端配色修复的源码及运行态边界：本仓同源 Shell 保护与两份 JS POSIX 生成模板已同步；读取同一份颜色答复最多 20 次、总等待约 2 秒，恢复前精确比对本次临时值，遇到外部改色冲突保留新值并诊断具体颜色项／失败原因。zsh 信号 trap 先执行完整清理再显式退出，避免恢复流程被提前结束；实际安装副本已随本轮备份同步。
- 后续最初确认处返回已实现：39 个子功能、父 `list` 和 `jrecord` 的初始确认均可按 `←` 回真实来源，不开始业务、不递归重开；独立或其它来源按各自退出语义处理。`pods` 原先位于最初确认前的 `repair_x` 已移至确认后，确认前不写业务。
- 后续运行态交付 verified：先保存源码／运行态原文并通过基线业务比对，再原子备份同步 118 个既有脚本／短命令，包含实际安装用 `install` 文件、`Scripts/` 与 `~/.local/bin` 副本；备份为 `/Users/jobs/.codex/backups/terminal-style-restore-20261114.XXYPaJ`。这些副本与源码字节一致，完整 `jrecord`／`list` 功能包及新增测试也已同步，`diff -qr` 一致；新登录 `jrecord --help` 和真实 `jrecord --prepare --yes --no-repair` 编译复检通过。旧 Terminal／list 须重新打开加载。

## 三、<span id="verification">本次限定验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 状态：实现 scoped-verified。本机 MacOS 27.2.1／Apple Silicon 的原生 warnings-as-errors 编译、自检和输出碰撞通过；Shell 参数／依赖／重试及真实 PTY 返回交互通过，已核对源码短命令、安装完整包转发和 TOC。
- 真实媒体只使用自建测试窗口：8 项定时、遮挡隔离、INT／TERM／HUP、关窗保存、输出保全及非法凭据测试通过；有效 MP4 有帧和时长、默认 0 音轨，解码未出现覆盖窗口颜色。没有录制用户浏览器内容。
- 初次源码交付未进行环境部署；上述同日后续运行态同步已完成。此前帧率／声音阶段 134 项隔离回归通过，保留原 107 项，并新增真实 PTY 覆盖帧率／声音子菜单、手动数字输入／粘贴边界、临时终端模式恢复与多层 ←。独立生产函数字符／信号 PTY 和真实父 list 交互夹具通过：返回立即重画父菜单，其它功能环境及旧返回门禁保留。原默认一条主窗、显式诊断五项、空态替换、真实窗口计数及父子信号／目录／依赖验证保留；自建窗口真实 Shell 完整链（问目录→录制→Ctrl+C→问打开目录→退出0）已通过，保存目录和录后菜单各一次、MP4有76帧／2.668秒／0音轨。日志 pipe 提前关闭仍生成有效MP4并退出0。此前帧率／声音菜单修改未改原生采集内核，新增的菜单验证使用模拟采集，不触碰用户浏览器。
- 改名及倒计时本轮限定验证 scoped-verified：正式源码为 `jrecord.command`；既有 134 项隔离回归、本轮全部 Swift warnings-as-errors 编译及原生 self-test 通过，63 份文档 TOC 严格 verify 通过。倒计时实机 1628 条动态断言通过，覆盖 5→1 约 5.009 秒、双圆、presentation 缩放／淡出、真实鼠标穿透到自建窗口、前台／key 不变、普通取消／Task 取消及 INT／TERM／HUP 后提示清理。
- 本轮完整生产内核媒体链仅使用自建已签名 App 窗口：五秒倒计时后按 1.5 秒配置采集，产出 48 帧／1.630 秒／0 音轨 MP4，退出 0，首帧无倒计时。生产倒计时 INT／TERM／HUP 分别返回 130／143／129，无输出且无空暂存遗留。安装后真实 `~/.local/bin/jrecord --yes --window-id <自建窗口ID> --output <独立临时MP4> --duration 1.2` 完整 Shell 媒体链也通过，真实倒计时后产出 36 帧／1.226667 秒／0 音轨 MP4，退出 0；没有录制浏览器内容。
- 倒计时交付阶段最终帮助和自述已补倒计时说明，随后既有 134 项隔离回归再次通过；运行包与源码 `diff -qr` 完全一致，63 份文档严格 verify 和 `diff --check` 通过。该阶段运行态部署、内核媒体链和安装后的短命令媒体链分别实测，不以其中一项替代另一项。
- 后续终端配色问题 scoped-verified：用户粘贴安装成功日志后的自动恢复报警，已在隔离 PTY 复现为旧 3×100 ms 超时；答复延迟 350 ms 即出现相同警告。修复后 17 个场景全部通过，覆盖延迟 450 ms、BEL／ST 分片、改色冲突、超时、非法输入、正常业务键盘、三种信号、嵌套及 `NO_COLOR`／`dumb` 降级。真实 Terminal 独立自建窗口普通退出时，文字色／背景色／光标色精确恢复，未操作用户原 TTY。
- 后续终端生命周期最终 scoped-verified：正式录屏源码 137 项隔离回归、1628 条动态断言／真实点击及三种信号清理通过，原生严格编译／self-test 通过。即使忽略 HUP，PTY 断开和父进程 SIGKILL 监测仍分别约 0.106 秒识别，无 TTY 正常运行不会误停。真实媒体只用自建绿色窗口，TTY 断开后约 0.317 秒、父进程 SIGKILL 后约 0.247 秒封尾停止，各保留 27 帧／约 0.90 秒／0 音轨有效 MP4。
- 后续初始确认导航最终 scoped-verified：39 个非录屏子功能的真实 PTY 初始自述 `←` 均返回 20 且无业务；CSI／SS3、Enter、Esc、Ctrl+C、独立来源及其它来源共 7 项按键／来源验证，加 4 类真实 fzf 父菜单往返重画，共 50 类组合通过。最终测试后运行态与源码 `cmp=0`，未再改文件；日志为 `/var/folders/r6/sb0vlrj92qg__pr4zcc4nznm0000gn/T/jobs-list-confirm-tests.lPvGbL/navigation.log`。
- 后续最终源码／运行态交付检查通过：66 份文档 strict verify、67 份源码语法、两份 JS 生成 Shell 语法及 `diff --check` 通过；118 个安装副本、完整录屏／list 包与新增测试的同步和新登录入口复检均完成，配色 17 场景及真实 Terminal 独立窗口恢复的边界保持前述限定。
- 未运行全仓安装器、写入 zsh／系统／终端全局配置、执行用户旧 `restore.sh`、真实安装依赖、授予权限、提交或推送，未打开录制目录或录制用户浏览器内容。MacOS 15／Intel、长录制、真实磁盘满／撤权／依赖下载、system 音频及所有浏览器特殊窗口未逐项验收；倒计时全屏 Space 切换和多屏热插拔未验。原生内核自身遭 SIGKILL 或断电时无法保证保存，保留尽力封尾边界。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
