---
type: project-memory
status: active
scope: macos-environment-management
repository: /Users/jobs/Documents/GitHub/JobsGenesis/JobsConfigOS
source: 2026-11-16 用户要求将 REA 加入新系统默认环境，并为新系统配置与 JobsMacEnvVarConfigs 增加可多选的安装／卸载面板及终端卸载入口
created: 2026-11-16
updated: 2026-11-16
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
