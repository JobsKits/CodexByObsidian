---
type: project-memory
status: active
scope: macos-finder-extensions
repository: /Users/jobs/Documents/Github/JobsGenesis/MacOS@Extension
created: 2026-09-13
updated: 2026-10-19
tags:
  - codex-memory
  - project
  - macos
  - finder-extension
---

# MacOS Finder 扩展体系

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、功能与工程边界](#jobs-toc-heading-2)
- [二、安装与文档约束](#jobs-toc-heading-3)
- [三、验证基线](#jobs-toc-heading-4)
- [四、IDE 打开入口与 Pod 合并](#jobs-toc-heading-5)
- [五、更新目标文件夹代码地图](#jobs-toc-heading-6)
- [六、Windows 平行工程](#jobs-toc-heading-7)
- [七、双端 Flutter SDK 版本管理](#flutter-version-manager)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 记录 `MacOS@Extension` 中 Finder 右键功能的工程粒度、安装选择和文档表达约束。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、功能与工程边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-13 明确确认。一个 Finder 右键菜单功能应视为一个独立安装单元；新增能力优先采用“一项右键功能对应一个工程”的结构。
- 现有 `JobsTerminalOpener` 是兼容例外：同一 App + Finder Sync Extension 暂时承载 `用终端打开`、`pod install`、`flutter pub get`、`CodeGraph 代码地图` 和 `空白 Commit 并 Push` 五项功能，但必须把五项分别展示为复选框，不能只提供整个工程的总开关。
- 已替代（2026-09-13）：功能组合只在构建时固化、变更必须重新安装的旧方案不再使用。构建值只作为首次运行默认值；安装器和已安装 App 共用持久化配置，Finder 扩展每次生成菜单时读取当前选择。
- `空白 Commit 并 Push` 只对普通文件夹提供菜单；Git 命令健康、当前文件夹是否位于 Git 工作树、当前分支、暂存区和推送远程必须全部在 Terminal 内校验。暂存区非空时不允许创建所谓空白 Commit。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、安装与文档约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 根安装器使用 macOS 原生复选框 UI，逐项选择全部右键功能，并提供“全部安装”和“取消”；同一工程中的多个已选功能只构建、注册一次。
- `JobsTerminalOpener` App 必须在主窗口提供本工程全部功能的复选框，一项功能独占一行并显示适用条件，同时提供保存、全选和全不选；保存后重新打开 Finder 右键菜单即可生效，不要求重新编译。
- `JobsTerminalOpener` 主窗口必须允许拖动缩放并设置合理最小尺寸；内容从顶部开始排布，高度不足时使用垂直滚动承接，标题、功能项和底部说明均不得被标题栏或窗口边界裁切。
- 仓库根 README 与多功能工程 README 的前言区域必须醒目、简洁地列出所含右键功能，并明确哪些功能可以独立勾选。
- 安装器收到未知功能标识时立即停止；功能选择、工程去重、构建参数、扩展菜单过滤和安装结果汇总必须保持同一映射。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、验证基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- AppleScript 选择器使用 `osacompile` 做语法编译。
- 根安装脚本使用 `zsh -n`，并分别验证全选、部分选择和未知标识解析。
- `JobsTerminalOpener` 使用部分功能集合隔离构建，随后读取宿主 App 与扩展产物的 `JobsTerminalEnabledFeatures`，确认首次运行默认值与勾选项完全一致；共享配置读写还要同时进入两个 target 并通过真实构建。
- 普通验证不得运行完整安装流程，避免注册扩展、重启 Finder 或触发真实依赖安装。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、IDE 打开入口与 Pod 合并 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-18 明确要求；状态：已确认（产品行为）；适用范围：本仓 Finder 右键扩展；创建 / 更新：2026-10-18。增加“用 Xcode 打开项目”“用 VSCode 打开项目”“用 Android Studio 打开项目”。用户同日后续修正：开发 / 安装扩展已经以 Xcode 为前提，Xcode 入口直接打开，不再检查安装或跳下载页；最初要求三个 IDE 统一判空的 Xcode 部分已被本条替代（superseded）。VSCode、Android Studio 仍先自检，缺失时停止项目打开并转官方下载页。Pod 安装与升级必须合为一个右键入口，不得拆分；仅处理目标文件夹的 Pod 依赖，不包含 CocoaPods 工具本身的安装 / 升级。
- 当前源码分别位于 `JobsXcodeOpener`、`JobsVSCodeOpener`、`JobsAndroidStudioOpener`，每项保留独立宿主、扩展、Scheme、Bundle ID 和卸载入口。来源：用户于 2026-10-18 后续自行建立三个独立 Git 仓库，并明确要求与 `MacOS@Extension` 父仓绑定；状态：已确认并完成本地关联。三个子仓以 `../<同名仓>.git`、`branch = main` 登记，父仓 gitlink 指向各自 HEAD，本地元数据通过官方 `absorbgitdirs` 归集到父仓实际 Git 目录的 `modules/`；保留各自 GitHub / Gitee HTTPS 远端及工作分支。此前“父仓直接维护、无独立远端或登记”的状态已被本条替代（superseded）。原有四个子模块保持独立管理，总计七个子模块、十一个可勾选菜单；Terminal 工程仍为五项。下载清单与安装器缺失工程补齐流程须同步覆盖七项；本地关联不等于父仓已提交、推送。
- 来源：用户于 2026-10-18 要求为 `work/`、`Scripts/` 分别补 README；状态：已确认并完成本地文档。`Scripts/SelectFinderExtensionFeatures.applescript` 是统一安装器调用的原生选择界面，目录说明与根 README 保持链接。`work/<工程名>DerivedData/` 保存构建缓存及 Debug App / 内嵌 appex，安装器直接从该路径注册，因此清理前须先通过对应卸载入口停用并注销扩展，再按需重装；不能按纯缓存直接删。统一卸载仅覆盖六个宿主，`JobsGitRemoteCopier` 用子仓专用卸载入口；该专用入口自动清理子仓内部 work，不清理父仓对应目录。父仓只保留 `work/README.md` 可跟踪，其余 work 产物通过 `/work/*` 忽略，保留 `!/work/README.md` 例外。
- VSCode、Android Studio 通过 LaunchServices 查找应用并核验 Bundle ID、App 目录和可执行文件，缺失分支打开官网下载页后立即返回。Xcode 直接用 `/usr/bin/open -a Xcode` 打开，路径作为独立参数传递，无 Shell 拼接；当前目录优先 workspace，其次 project，同优先级多个候选时明确选择，不递归猜测子工程。
- 当前实现沿用已有工程依赖入口，将菜单标题改为“安装/升级 Pod”，保留 `pod-install` 配置 / URL 标识。用本机 `Pods/Manifest.lock` 记录判定已安装并执行 `pod update`，没有记录时执行 `pod install`；仓库自带 `Podfile.lock` 不能当作本机已安装的证据。终端确认时直接回车跳过，任意字符执行；先检查 Ruby、CocoaPods 和项目实际需要的 Bundler。该实现不自动安装或升级 CocoaPods 工具本身。
- 用户于 2026-10-18 实测后明确补充：Pod 操作的大前提是目标同层同时存在 `Podfile`、`*.xcodeproj` 和 `*.xcworkspace`；缺任一项，不显示入口，也不允许宿主弹出 Terminal。此前仅要求 Podfile + xcodeproj 的两件套门禁已被替代（superseded）。工程和 workspace 必须是目录包，不递归从其它层级补齐；Finder、宿主及运行时复核保持一致。
- 已修复的交互边界：将整段多行脚本塞入 Terminal 的交互 `do script` 会显示大量 `quote>` 续行提示，即使最终语法正确也会源码滚屏。Pod、CodeGraph 和空白 Commit 使用每次独立的私有 `.zsh` 载体（目录 0700、文件 0600），Terminal 只接收物理单行的安全启动命令；目标参数写入载体，含引号或换行也不变成交互输入。调度成功不能立即删除载体，因 AppleScript 返回不等于业务结束；由脚本最外层退出 / 信号处理精确清理本次文件及空目录，调度失败由宿主清理，不扫描其它会话。
- 验证边界：构建时使用 `JOBS_SKIP_FINDER_EXTENSION_BUILD_PHASE=1` 跳过脚本注册和 Finder 重启；Xcode 自带 `RegisterWithLaunchServices` 仍可能登记临时 App，隔离构建完成后按本次临时 App 的精确路径注销。源码 / 隔离构建通过不能代替真实 Finder 菜单与签名加载验收，不应在普通验证时运行宿主或完整安装器。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、更新目标文件夹代码地图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-18 明确要求；状态：已确认（入口、目标范围、Homebrew 安装链与回车确认）；适用范围：`JobsTerminalOpener` 的 CodeGraph 菜单；创建 / 更新：2026-10-18。入口统一为“更新代码地图（.codegraph）”，保持单项及 `codegraph-bootstrap` 标识兼容；目标有图时同步，无图时创建。缺失组件时调 Terminal，回车确认后才安装，并体检实际依赖链。
- 当前官方仓库没有可确认的 CodeGraph Homebrew formula / tap，不能使用未落地的提案名。实现通过 Homebrew 准备 Node/npm，再安装官方 `@colbymchenry/codegraph` 到用户独立前缀；保留 Homebrew 系统 `YES` / 用户目录选择。健康 CLI 仅更新地图，不主动升级工具；安装分支复用健康依赖，只修缺失或损坏层，修复一次后立即复检。
- 安装来源、路径、失败命令和每次独立日志在终端可见；环境与 PATH 仅作用于当前子进程，不写 Shell 启动配置，不改变网络代理。CLI 自检禁止 shim 隐式下载，地图操作关闭遥测；不调用 `install`、`watch`、`serve`。
- 已核实发布版 1.6.2：`CODEGRAPH_NO_WATCH=1` 配合 `init --yes` 会进入自动 Git hooks 分支，当前入口使用 `CODEGRAPH_NO_WATCH=0` 避开。`init` 使用明确目标；`status` 可能回退父级，因此先用系统 SQLite 只读检查精确 DB 的 `nodes` 表（禁用用户 `.sqliterc`），异常 DB 直接停止；地图及直属条目符号链接也拒绝。
- 最终 JSON 核对项目 / 输出路径、索引时间、完成状态和必需待处理计数；仅在字段存在时检查较新版本的 `filesNeedingReindex` / `filesWithParseErrors`，兼容发布版 1.6.2。构建、签名及隔离回归已验证，真实工具安装和用户业务目录建图不作为普通测试执行。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、Windows 平行工程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-18 明确要求；状态：已确认（双端范围与目录命名）；创建 / 更新：2026-10-18。Windows 开发人员同样需要开发右键菜单，工程固定放在 `/Users/jobs/Documents/Github/JobsGenesis/Windows@Extension`，与 `MacOS@Extension` 平行；不能把 Windows 源码塞进 macOS 子工程。
- 已替代（superseded，2026-10-18）：初版仅将十项功能做成独立开关，但运行代码、安装与状态仍属于整体；用户明确指出这不符合 macOS 侧的功能解耦思想，不能将“独立勾选”当作“独立工程”。
- 当前约束：用户于 2026-10-18 明确确认，Windows 每个右键功能必须有独立工程目录、业务源码、安装 / 卸载入口和运行状态；总入口只展示安装面板、选择若干功能并编排各自的安装器。单个功能目录可完整拷走独立安装，不依赖总入口或其它功能；纯基础设施可以受控内嵌，不能把集中业务脚本复制十遍冒充解耦。共十包，保留 PowerShell 5.1、当前用户注册和 Windows 11“显示更多选项”边界；Visual Studio 承接 Xcode，CocoaPods 不提供。十个功能包尚未分别登记独立 Git 子模块或远端，Windows 真实桌面验收仍待执行；最新实现与验证以工程 README 为准。
- 来源：用户于 2026-10-18 明确要求新增 Gitee `main`、保留 GitHub `origin` 并关联父仓；状态：已确认，远端推送及本地关联已验证；适用目录：`/Users/jobs/Documents/Github/JobsGenesis/Windows@Extension`；创建 / 更新：2026-10-18。本仓保留 `origin = https://github.com/JobsKits/WindowsOS_Extension.git`，新增 `gitee = https://gitee.com/JobsGo/WindowsOS_Extension.git`，本地 `main` 继续跟踪 `origin/main`，Gitee 目标为 `main`，不另建本地分支。父仓 `JobsGenesis` 以 `path = Windows@Extension`、`url = ../WindowsOS_Extension.git`、`branch = main` 登记子模块，使用官方 `absorbgitdirs` 将元数据归集到父仓 `.git/modules/Windows@Extension`。原先整个 Windows 目录未登记的状态已被本条替代（superseded）；父仓关联及配套说明当前仅在本地，尚未提交或推送。
- 已替代（superseded，2026-10-18）：原“仅处理根 README、19 项回归、不推广其它仓库”的实验范围，在用户实测确认后被授权推广方案替代；现行跨仓工作流见 [[30-工作流决策/工作流决策#十五、Markdown 动态目录过滤器|Markdown 动态目录过滤器]]。
- 当前状态：`/Users/jobs/Documents/Github/JobsGenesis/Windows@Extension` 使用 `.jobs-markdown-toc/` 的自包含工具和精确清单，共管理 13 份含标签说明；`Scripts/MarkdownToc.mjs` 保留同源码兼容入口，CI 继续用此入口核对清单全部原始索引内容。根 README 和 `Scripts/README.md` 说明动态目录、首次接入、日常暂存和安装 / 卸载边界；用户要求的 `Scripts` 目录用途说明已补齐。转换器 38 项、部署器 8 项隔离回归通过，真实索引未改、未创建提交或推送；远端折叠与 Windows 真实桌面按各自环境单独验收。

## 七、<span id="flutter-version-manager">双端 Flutter SDK 版本管理</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-19 先要求 macOS 右键功能，随后明确要求同步实现 Windows 并放入平行仓库；状态：需求已确认，实现已落盘；适用范围：本仓与 `/Users/jobs/Documents/Github/JobsGenesis/Windows@Extension`；创建 / 更新：2026-10-19。两端功能目录均为 `JobsFlutterVersionMgr`，入口“安装/切换 Flutter SDK（FVM）”；保持一项功能一个独立安装单元，包含独立安装 / 卸载并接入总选择器。macOS 当前八工程十二项功能，八个工程均为独立子模块；Windows 当前十一包，新包尚未建立独立远端或子模块。
- 命名决策：用户于 2026-10-19 明确要求更名为 `JobsFlutterVersionMgr`；原名 `JobsFlutterVersionManager` 标为 `superseded`，以本节现行目录为准。两端目录、macOS 工程 / Scheme / 产品 / Bundle ID / URL scheme、安装映射、测试和文档同步更名；稳定业务标识保留。未安装的运行态与远端不作迁移。
- 用户确认的功能：先验证精确所选文件夹自身是 [**Flutter**](https://flutter.dev/) 项目，在终端体检实际工具链，查询官方历史及最新 SDK，通过 [**fzf**](https://formulae.brew.sh/formula/fzf) 单选，由 [**FVM**](https://fvm.app/) 安装或切换项目精确版本。macOS 通过 Homebrew 准备所需工具；Windows 复用健康工具，缺失 Git / fzf 经 WinGet，FVM 使用官方架构 ZIP 并校验 SHA-256。Windows 注册表菜单可见性不能据清单解析动态隐藏，运行第一步严格拒绝无效项目；保留当前用户注册及 Windows 11“显示更多选项”边界。
- 实现约束：只认根 `pubspec.yaml` 的 `dependencies.flutter.sdk: flutter`，排除注释、description、flutter_test-only、链接与非普通目录。官方清单失效时明确最新未知，仅提供已初始化缓存。健康工具复用，缺失 / 损坏层确认后只修一次并复检；fzf 按 Esc 取消，不设置全局 Flutter、不改变代理。版本操作跳过 pub get，成功需核对项目配置、SDK 链接和实际 Flutter / Dart。
- 交互决策：用户于 2026-10-19 在 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo` 实测后，明确要求去掉 macOS 独立管理 GUI，所有 SDK 操作在 Terminal 内进行。宿主仅作为 `LSUIElement` 后台 URL 转发与扩展初始化进程，不创建窗口、项目选择器或 Dock 图标；等待初始化与所有终端派发返回后自动退出。用户同时明确最终确认对调为直接回车执行安装 / 切换、任意非空输入（含空格）取消，EOF 停止；旧“最终回车跳过”已替代（superseded）。两端仅本功能同步此默认值，不改变依赖安装、fzf 取消和其它脚本的确认习惯。已打开的终端使用启动时的脚本副本，须重新右键启动才采用新交互。
- 点击链路：纯代码宿主没有 nib，入口 `main.swift` 显式强持有并挂接 AppDelegate；在 `willFinishLaunching` 注册 URL AppleEvent，再共用严格请求解码。Finder 动作在点击时重新查询所选项目或当前目录，不依赖菜单 `representedObject`。宿主启动、项目接收、Terminal 派发及退出状态追加到 `/tmp/JobsFlutterVersionMgr.log`；业务日志仍由终端脚本在首屏确认后建立。
- 配置保护：在私有 inspection 影子配置目录查询目标自身的 FVM context / cache，防止继承父项目缓存；精确根 `.fvmrc` 合并保留字段，迁移时去除旧 `flutterSdkVersion` 别名并关闭 `updateMelosSettings`。写前快照和并发校验，拒绝 FVM 已知写入位置的外部链接；FVM 成功后先核验真实版本，再补回其序列化剥离的原字段。失败保留现场和快照，不伪称事务回滚。
- 仓库关系：用户随后明确要求新增 Gitee、推送并关联父仓。macOS 新工程原先由父仓作为普通目录维护的状态已被替代（superseded）；现子仓位于 `/Users/jobs/Documents/Github/JobsGenesis/MacOS@Extension/JobsFlutterVersionMgr`，保留 HTTPS `origin = https://github.com/JobsKits/JobsFlutterVersionMgr.git`，新增 `gitee = https://gitee.com/JobsGo/JobsFlutterVersionMgr.git`，本地及两端均用 `main`。父仓登记 `path = JobsFlutterVersionMgr`、`url = ../JobsFlutterVersionMgr.git`、`branch = main`，已用官方 `absorbgitdirs` 归集元数据。子仓 `e0b4b5c`、父仓 `a259b48` 已按子先父后推送两平台；未发布 Windows 此次改动或提交更上层 JobsGenesis。
- 目录边界：本地 `[toc]` 是正常编辑形态。原普通目录曾由父过滤器接入；交付后初始化独立 Git，不会继承父仓的 local 配置，须按新 Git 根独立接入。现子仓自带 `.jobs-markdown-toc/`、精确属性与五份清单，父仓只管理自身四份文档，真实原始暂存 `check` 与工作区字节往返 `verify` 均通过。父安装器测试移至父仓 `Tests/FlutterInstallerIntegrationTests.rb`，保证子仓测试可独立运行；目录渲染的平台实测不由这些检查替代。
- 验证基线：初始 macOS Debug / Release、签名深验、资源字节一致、原生路径 / 载体权限 / 退出清理及五项父安装映射回归（27 断言）通过。2026-10-19 点击修复与后台化后重新构建 Debug、深验签名和资源一致；在用户指定项目通过真实 Finder 右键确认请求送达 Terminal，后台宿主派发后正常退出，原生隔离测试和二十二项业务（169 断言）通过。用户已自行安装并进入终端操作，原“未安装扩展”的初始状态已过时；本轮更新已有 App，本轮修复未提交推送。Windows 最终确认对应 69 条夹具断言、修改文件 Parser / BOM / CRLF 与目录往返通过，真实 Windows 桌面仍待实机验收；SDK 下载、选版与项目兼容性不由这些检查替代。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
