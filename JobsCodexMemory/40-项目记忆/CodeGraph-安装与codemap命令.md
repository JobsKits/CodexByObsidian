---
type: project-memory
status: active
scope: codegraph-codemap
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS
source: 2026-10-17 用户明确要求三处集成，并确认全依赖链健康体检
created: 2026-10-17
updated: 2026-10-20
tags:
  - codex-memory
  - project
  - shell
  - codegraph
---

# CodeGraph 安装与 codemap 命令

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、三处集成归属](#jobs-toc-heading-2)
- [二、命令与健康检查边界](#jobs-toc-heading-3)
- [三、Finder 目标地图更新入口](#jobs-toc-heading-4)
- [四、CocoaPods 集成后的地图更新](#jobs-toc-heading-5)
- [五、Windows 目标地图更新入口](#windows-codegraph)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 记录代码地图安装、系统初始化与终端命令的跨仓库归属；通用依赖体检规则继续归 `jobs-macos-shell`，不在此重复维护一套规则。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、三处集成归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 职责 | 已确认位置 |
| --- | --- |
| 独立安装器 | `/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS/配置相关/【MacOS】⚙️安装代码地图CodeGraph.command/【MacOS】⚙️安装代码地图CodeGraph.command` |
| 新系统入口 | `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/【MacOS】🆕新系统配置.command/【MacOS】🆕新系统配置.command` |
| 命令源码 | `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs/scripts/codemap.command/codemap.command` |
| 命令运行副本 | 当前用户 `.JobsMacEnv/Scripts/codemap.command`，并注册 `.local/bin/codemap` 及现行 entrypoints 函数 |

新系统脚本已由根目录文件迁入同完整名称目录，同目录有 README。系统入口以自身位置定位相邻 `JobsCommand@iOS` 安装器，路径不依赖终端当前目录。CLI 安装与给业务项目建立地图分开。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、命令与健康检查边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户明确要求 `codemap` 对当前目录建图，`codemap 地址` 对手工输入或拖入的地址建图；支持含空格、中文与多目录。既有地图重建，首次初始化；不以目录存在或退出码为唯一成功证据。
- [**CodeGraph**](https://github.com/colbymchenry/codegraph) 的官方 npm 包为 `@colbymchenry/codegraph`。安装器体检基础工具 → [**Homebrew**](https://brew.sh/) → [**Node.js**](https://nodejs.org) / [**npm**](https://docs.npmjs.com/) → CodeGraph，并以临时样例真实建图复检。
- 用户于 2026-10-17 再次确认“所有第三方依赖都做健康体检，至少 Brew、Node/npm”；`jobs-macos-shell/SKILL.md` 的 1.7.1 已明确完整依赖链、实际可用性、修复后复检及失败停止，故本任务没有重复修改全局 AGENTS 或 Skill。
- 现行安装器复用健康 Node/npm；缺失时通过 Brew 管理 node@24；更新或新装 CLI 使用用户独立 npm 前缀，保留原全局安装。健康检查不隐式下载平台包，建图调用关闭遥测。
- codemap 只使用现有健康 CLI，不隐式安装；产物固定在目标 `.codegraph`，核对官方 JSON 的项目路径、输出路径、索引时间及完整状态。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、Finder 目标地图更新入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-18 明确要求；状态：已确认；适用范围：`MacOS@Extension`。Finder 的“更新代码地图（.codegraph）”与既有 `codemap` 命令独立：健康 CLI 直接更新目标地图，CLI 缺失时允许在终端回车确认后经 Homebrew / Node/npm / 官方包安装链补齐。完整实现、版本兼容和目标隔离边界见 [[MacOS-Finder-扩展体系#五、更新目标文件夹代码地图|Finder 代码地图入口]]；本轮没有修改前两节列出的其它安装器或命令副本。

- 来源：用户于 2026-10-20 明确要求 Windows / macOS 各提供代码地图右键入口，缺失时补齐安装，全部工具链均做健康体检；状态：需求已确认。macOS 保留 `JobsTerminalOpener` 既有兼容入口，每次运行均体检 CLI、zsh、SQLite / JSON、bash / curl / Git / CLT、Homebrew 与 Node/npm。健康独立 CLI 不需要的安装上游缺失只告警，真正进入安装链时必须逐层修复一次并复检。Node/npm 通道按官方 `1.6.2` 的 `>=20 <25` 范围识别兼容性，使用 Brew `node@24` 修复；只读诊断的 PATH 变化隔离在子 Shell。源码语法、真实 Swift 编译与隔离回归通过；新菜单产物仍需按安装器正常安装后在 Finder 验收。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、CocoaPods 集成后的地图更新 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-20 明确要求检查并补齐 `pod install` 后的地图更新、缺失工具安装与全工具链健康体检；状态：需求已确认；适用范围：[[Jobs-iOS-仓库族|Swift / SwiftUI 与 OC 新旧基础工程]]。四侧 `ScriptsByPods/codegraph_init.command/codegraph_init.command` 采用相同自包含实现，地图任务在 `post_integrate` 成功集成后异步启动；Swift、OC 新旧的安装前 `--preflight` 只生成离线报告，后台失败不改写 CocoaPods 的退出状态。
- 健康依赖直接复用，不主动升级。当前没有对应产品的 Brew formula；需要时由 Homebrew 管理 `node@24`，再安装官方 scoped npm 包到用户独立前缀。只读 / 显式离线禁止安装；缺 Homebrew 且后台无法选择安装位置时停止并提示终端处理，不静默选路。
- 体检包括系统工具 / CLT、Brew 版本 / 配置 / doctor、Node 实际执行 / npm 只读配置、SQLite / JSON、CLI 接口和隔离样例建图。doctor 无关警告保留并按实际依赖可执行性判断，不借此修复其它 cask、tap 或未链接包。
- 全局安装锁串行化环境修复，工程锁覆盖索引与导出；采用全局 `TRAPEXIT` 清理，避免 zsh 函数内 EXIT trap 提前触发。索引校验精确目标 DB schema 与 JSON 项目 / 输出路径、完整状态及待处理计数，拒绝地图符号链接；Apple SQLite 无 WAL sidecar 的只读兼容仅用于无 WAL 主库 schema，完整结果继续交 CLI 校验。
- README 与实际挂载同步；隔离回归及真实 CLI 临时样例验证覆盖安装链与地图 / Markdown，未为验收运行真实 `pod install` 或业务工程构建。本地修改不代表已提交或推送。

## 五、<span id="windows-codegraph">Windows 目标地图更新入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：2026-10-20 用户双端需求；状态：实现与隔离验证已完成，Windows 实机待验；仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`。复用独立功能包 `JobsCodeGraphUpdater`，菜单名“更新代码地图（.codegraph）”，单独安装 / 卸载与当前用户菜单登记边界保持。
- Homebrew 在 Windows 的支持范围是 WSL，无法用于本入口的原生工具链。实现采用 Windows PowerShell 5.1 Desktop / .NET → WinGet（需要修复 Node 时）→ 兼容 Node/npm → 用户私有官方 CodeGraph `1.6.2` 包；每次也体检已有 CLI 随包 Node 与 SQLite，健康独立 CLI 可在安装上游缺失时继续使用。
- WinGet 从官方 `OpenJS.NodeJS.LTS` 历史清单选择兼容 `24.x` 精确版本，仅在修复分支确认后重跑安装器；可能替换不兼容 Node 并由官方安装器登记 PATH，脚本只刷新当前进程。每层修复一次并复检，WinGet 不可用时给官方修复来源后停止。npm 连通性、平台包运行时 / SQLite 和 CLI 接口通过后才处理精确目标地图。
- 临时便携 PowerShell Core 下 Worker / ActionModules / Architecture 共 503 项断言（53 / 101 / 349）与 83 份源码解析通过，SQLite 集成未跳过；macOS 代码地图 38 项及 Swift 传输 11 项隔离回归通过。没有执行真实 WinGet / Brew 安装、注册修改后产物、提交或推送；上述验证不替代 Windows PowerShell 5.1 Desktop、Finder / Explorer 真实菜单与依赖安装验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

