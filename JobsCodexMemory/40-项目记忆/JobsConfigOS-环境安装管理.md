---
type: project-memory
status: active
scope: cross-platform-environment-management
repository: /Users/jobs/Documents/GitHub/JobsGenesis/JobsConfigOS
source: 2026-11-16 用户要求将 REA 加入新系统默认环境，并为新系统配置与 JobsMacEnvVarConfigs 增加可多选的安装／卸载面板及终端卸载入口
created: 2026-11-16
updated: 2026-11-18
tags:
  - codex-memory
  - project
  - macos
---

# JobsConfigOS 环境安装管理

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、需求与入口边界](#confirmed-scope)
- [二、源码行为与维护合同](#lifecycle-contract)
- [三、限定验证基线](#verification-baseline)
- [四、Indra OCR 终端入口](#orc-offline-cli)
- [五、新系统配置多平台目录](#multi-platform-bootstrap)
- [六、八平台图形管理入口](#platform-gui-managers)
- [七、八平台安装卸载统一目录](#paired-platform-uninstall)
- [八、新系统配置源码与成品按功能收拢](#cohesive-bootstrap-layout-20261118)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

保存本项目已确认的入口边界和当前交付基线；后续修改继续同步各仓根目录 `项目相关报告/` 下的资产表。

## 一、<span id="confirmed-scope">需求与入口边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户确认（2026-11-16）：仅本轮 macOS 范围。REA 纳入新系统环境；新系统配置和 JobsMacEnvVarConfigs 分别提供安装／卸载面板，允许多选自定义组件，并补终端反安装脚本。原有终端安装方式保留，不用 GUI 替换。
- 当前实现（source-verified）：原新系统安装入口前九阶段不变，REA 为第十阶段；仅安装官方 `rea-agents` 包，客户端 MCP／Skill 注册和分析引擎按需另外配置。环境子仓原根安装器及快捷入口继续独立使用；面板实施未替换它们，并行的 OCR 任务后来增量扩展根安装器命令登记，不能再把当前根安装器称为实施前字节不变。
- 两个独立 App：父仓根 `【MacOS】🧰新系统配置管理.app`、环境子仓根 `【MacOS】🌍环境配置管理.app`。两仓各自保有完整 `安装面板/` 源码／翻译／构建入口，不依赖父仓或编译机路径运行。
- 终端反安装：父仓 `【MacOS】↩️卸载新系统配置.command/`、环境子仓 `【MacOS】卸载终端环境.command/`。受管实施后端均使用完整同名包 `【MacOS】环境管理后端.command/`，父仓后端位于原新系统安装包内。

## 二、<span id="lifecycle-contract">源码行为与维护合同</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 面板默认空选；搜索／多选、计划预览、安装和卸载确认；整批 ID 交给后端处理依赖顺序，不能逐 ID 启动造成公共依赖预检误拒。目录协议为四列 TSV，执行事件与目录分开。
- 收据记录归属、安装后指纹和原件；卸载恢复本工具实际变更。旧安装缺凭据、对象被用户修改、未知引用或共享依赖仍存时保留并返回未完成，不把目录存在或旧收据存在当作工具健康。
- 命令安装按需补公共支持；卸载发生部分失败时按真实加载关系保留仍被引用的基础模块。旧安装器不参加新事务锁，避免同时运行，发布前继续做指纹复检。
- 两面板均有十语与三主题、独立偏好、日志、手动滚动暂停追尾、后台状态栏及忙碌退出保护。新装 Homebrew 明确选择位置；系统路径使用保留的终端权限流程，不在后台等待密码或失败后暗换路线。
- 2026-11-16 用户进一步确认（confirmed）：针对 Node 缺库不能只报健康检查失败；已授权的当前任务必要依赖应自动定位、补齐／修复、刷新并复检，环境可用后自动续行。只读查询与卸载不触发修复；确定的权限／认证等外部阻断仍如实报告，不原样盲循环。全局专项原则见 [[30-工作流决策/工作流决策#dependency-self-healing|依赖链条件式自愈]]，具体实现与真实环境结果以项目资产表为准。
- 新系统实际安装可发出协作停止请求：当前安全步骤结束后停止后续组件，等待和退避可取消；不强杀包管理器、不自动撤回已完成变更。环境配置部署／卸载不传入系统安装专用停止参数。

## 三、<span id="verification-baseline">限定验证基线</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 2026-11-16（scoped-verified）：新系统基础 42 组件，45 组生命周期／自愈／终端 PTY 与真实 semver 测试通过；后续两行指纹批量化小修改另做新旧原始输出及 5 种状态摘要兼容验证。环境当前 50 组件（含并行接入的 OCR），固定源码隔离回归 44 项重跑通过，覆盖文件部署／恢复；终端卸载另有真实 fzf＋假后端的 11 个 PTY 场景，未执行 OCR 依赖或模型。
- 两 App 为 macOS 13 部署目标的 `x86_64 arm64` 通用包；签名、157／153 份运行资源一致性、97 键×十语三主题原生控件检查和中文空格路径独立复制诊断通过。新系统停止联动使用真实 AppKit 事件循环与有界假工作进程，环境面板保留受控忙碌状态检查；不等同真实鼠标或业务安装验收。
- 本机限定实跑（scoped-verified）：Node 的 simdutf ABI 缺库已用官方匹配修订包修复，实际 Node `v26.13.1`；原全局 npm `12.2.2` 的 1953 个文件／链接与备份一致。REA `6.9.0` 官方包已安装至独立用户前缀，版本、帮助、新登录终端、重复执行及 installed 收据／指纹一致性通过；未额外装 ABI 37，未自动注册客户端 MCP／Skill 或安装分析引擎。
- 本轮面板任务未在真实用户环境运行全量环境同步／反安装，未把原生控件检查等同人工鼠标验收；计算机界面控制通道超时。并行 OCR 定向部署的实跑结果保留在环境仓资产表，本轮只验证其打包及文件生命周期。实际平台下载、权限授权、另一台 Mac 与旧环境接管继续以最新资产表为准。

## 四、<span id="orc-offline-cli">Indra OCR 终端入口</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 用户明确要求（2026-11-16，confirmed）：在 `JobsMacEnvVarConfigs` 加入 `pip install indra-ocr` 的离线识别能力，终端命令使用 `ORC` 拼写、不区分大小写；保留八种组合，不能自行纠正为 `OCR` 而遗漏用户命令。
- 实现位置为环境子仓 `scripts/orc.command/`；根安装器、zsh 入口和 `list` 同步接线，分项后端登记规范 `cmd-orc`。源码组件数为50，旧App包仍49，本次终端任务未重建GUI。工具使用独立 `jobs-orc/venv`，默认模型缓存为同数据目录的 `models/`，仅注入本工具进程，保留显式 `HF_HOME`／`HF_HUB_CACHE`。
- `--install` 只准备工具，不预下载模型；首次实际识别按需下载，`--offline` 同时禁止环境安装与模型联网。已就绪环境不更新Homebrew或pip，stdout保留识别正文，提示与日志走stderr。
- 2026-11-16（scoped-verified）：本机Apple Silicon真实安装indra-ocr 1.1.2与依赖检查通过；在线样张与禁止网络进程中的严格离线识别均退出0、正文逐字节一致。接线17项、终端配色17场及后端50组件生命周期44项隔离通过；其它Mac、数学模型及GUI新包未验，最终运行态与源码差异查项目资产表。


## 五、<span id="multi-platform-bootstrap">新系统配置多平台目录</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：用户于2026-11-17明确要求将原 `【MacOS】🆕新系统配置.command` 目录改为 `【MacOS】🆕新系统配置`，内按操作系统分目录，并以学术服务平台 `部署/` 的平台集合为范围；状态 confirmed。新根名称保留用户指定的 MacOS 前缀，不把它解释为只支持 MacOS。
- 平台集合为 MacOS、WindowsOS、Ubuntu、Debian、RockyLinux、Alpine、AlibabaCloudLinux、FreeBSD；学术项目的 Windows 目录在这里用 WindowsOS 命名。该要求覆盖系统环境初始化，不表示在配置仓复制业务部署，也不将 Apple 专属能力假装为跨平台可用。
- MacOS 原完整包位于 `【MacOS】🆕新系统配置/MacOS/【MacOS】🆕新系统配置.command/`，原组件后端随包迁移，卸载与面板构建引用同任务同步；原“仅本轮macOS范围”只描述2026-11-16任务，已由此次明确平台扩展补充。
- 2026-11-17（scoped-verified）：MacOS迁移后46组生命周期隔离回归通过，42项四列目录及计划、中文空格复制与工程外启动寻址通过；真实整机安装/卸载未执行。现成App本轮未重建，保留自身包内旧布局资源；源码构建器采用新布局。新平台为WindowsOS 20项组件、Unix每平台9项基础组件；macOS PowerShell 7的45项Windows隔离断言与6平台204项Unix隔离断言通过，未冒充目标系统原生验收。各新平台的最新实现与实机边界以项目根 `项目相关报告/新系统配置多平台资产盘点.md` 为准，不从MacOS结果推定其它系统通过。

## 六、<span id="platform-gui-managers">八平台图形管理入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：2026-11-17用户明确要求核心脚本更新后同步更新新系统配置管理App，并认为各平台都应提供GUI；状态confirmed，适用范围为本项目八个平台。此要求补充前一节仅交付CLI的任务范围，今后维护本工具要核对对应GUI和包内资源，保留原终端入口。
- MacOS实际App当前路径为 `【MacOS】🆕新系统配置/MacOS/【MacOS】🧰新系统配置管理.app`，父仓 `安装面板/`保留AppKit源码和构建器；构建器默认输出同一路径。旧笔记中的“父仓根App”位置及“迁移后未重建”描述为历史状态，已由本节取代。源码、产物与目标系统实机分别验证，不能把修改源码等同已更新运行中的旧进程。
- 平台实现采用已有后端与原生桌面能力：WindowsOS使用PowerShell／WinForms管理器，六个Unix平台各有启动入口并共用Tcl/Tk管理器；无桌面服务器仍用CLI。主题／语言为用户偏好，组件勾选只属于当前会话；平台不具备的Apple能力不伪造成可安装项。
- 来源：用户于2026-11-17进一步明确交付不能只有App，要求新系统Mac管理器具备可读源码和至少可直接打开的Xcode工程；状态confirmed。工程在 `【MacOS】🆕新系统配置/MacOS/【MacOS】🧰新系统配置管理.xcodeproj`，直接引用父仓现行Swift源码，保留独立CLI发行构建；源码采用统一@main入口。Debug原生构建／ad-hoc签名／自检与控件冒烟通过，发行App同任务重建并核对源码摘要；无真实系统安装。环境子仓源码虽存在，旧App缺收据的未核实边界不由此任务覆盖。
- 用户于2026-11-17明确所有平台GUI都须源码＋成品双交付；已从原任务证实昨天新增两Mac面板，今天扩展7平台，共9套。当前有独立源码／产品ZIP、逐文件manifest与校验清单，工具在父仓安装面板/PackageGuiDeliverables.py；Windows新增真实AnyCPU/net472启动EXE及完整源码工程，依赖邻接GUI资源；Unix为Tk运行包。环境App也已补构建收据并重建，先前“旧App无收据、未核实”的限定不再作为当前成品状态；实际范围、证据和目标平台未验边界见项目根GUI源码与成品交付审计。
- 最新组件数量、GUI交互、授权、后台能力差异与验证结果统一查看项目根 `项目相关报告/新系统配置多平台资产盘点.md` 及 `新系统配置安装管理资产盘点.md`，不沿用历史计数或推断其它系统实机通过。

## 七、<span id="paired-platform-uninstall">八平台安装卸载统一目录</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：2026-11-18 用户要求把根目录 MacOS 卸载包归入 `🆕新系统配置/`，并指出单一 MacOS 卸载不足以覆盖已扩展的操作系统；状态 confirmed。当前平台集合为 MacOS、WindowsOS、Ubuntu、Debian、RockyLinux、Alpine、AlibabaCloudLinux、FreeBSD，不扩大解释为任意 OS。
- 当前目录以实际 `🆕新系统配置/` 为准；前文 `【MacOS】🆕新系统配置/` 外层路径及根目录单独 MacOS 卸载包位置 superseded。MacOS 卸载与安装包同放 `MacOS/`，WindowsOS 沿用 PowerShell/CMD，六 Unix 平台各有原生 sh 专用卸载包，均转交各自唯一受管后端。入口不得用参数切换到安装或绕过原有收据／确认；无参或空组件不隐式全选。
- 外部构建／打包路径随当前目录更新，既有 Mac App 包内自包含的旧路径合同保留，不因 CLI 移动推断现成 App 失效。本任务不重建 GUI 或重打历史交付物，真实系统卸载亦未执行；实现与限定测试以根 `项目相关报告/新系统配置卸载入口资产盘点.md` 为准。

## 八、<span id="cohesive-bootstrap-layout-20261118">新系统配置源码与成品按功能收拢</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：用户于2026-11-18指出仓根 `安装面板/` 与 `交付产物/` 显得散落，并明确接受收进 `🆕新系统配置/` 及同步工程／构建引用；状态：confirmed（目录边界），实施验收以本轮项目报告为准。适用仓库为 `/Users/jobs/Documents/GitHub/JobsGenesis/JobsConfigOS`，不自动改其它仓或环境子仓。
- Mac原生面板的目标源码／资源／构建入口统一位于 `🆕新系统配置/MacOS/安装面板/`，与同层App及Xcode工程对应；多平台源码与成品归档归 `🆕新系统配置/交付产物/`。功能目录内原有 `安装面板/` 是六Unix平台共享Tcl/Tk实现，保留其职责，不与Mac原生源码合并。
- 当前目录已按上述布局生效（2026-11-18，scoped-verified）；Xcode工程、资源准备和打包入口按新位置引用。现有发行App与历史ZIP保留原字节，不能据此推断已刷新为当前后端资源；当前构建、源／成品差异及验证边界集中到 `JobsConfigOS/项目相关报告/新系统配置卸载入口资产盘点.md#panel-paths`。
- 来源补充：2026-11-18 用户明确由本任务一起完成面板路径修正；状态 confirmed。按现有新布局收口构建／打包／Xcode与说明，14组归档夹具通过，当前App的179份资源、签名、源码摘要和只读自检通过；未修改GUI或重建App。无需等待其它任务，亦不把当前资源核验当作今日重新构建。
- 前面各节关于仓根 `安装面板/`、仓根 `交付产物/` 的位置描述为历史位置（superseded）；其中的旧验证事实保留，不代表迁移后的路径已验。实际迁移需一并修正相对寻址、Xcode输入、构建／打包器和文档引用，并核对Swift源码与既有成品原字节保全；不以整理执行真实安装／卸载或系统配置变更。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
