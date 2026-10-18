---
type: project-memory
status: active
scope: macos-finder-extensions
repository: /Users/jobs/Documents/Github/JobsGenesis/MacOS@Extension
created: 2026-09-13
updated: 2026-10-18
tags:
  - codex-memory
  - project
  - macos
  - finder-extension
---

# MacOS Finder 扩展体系

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 记录 `MacOS@Extension` 中 Finder 右键功能的工程粒度、安装选择和文档表达约束。

## 一、功能与工程边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-09-13 明确确认。一个 Finder 右键菜单功能应视为一个独立安装单元；新增能力优先采用“一项右键功能对应一个工程”的结构。
- 现有 `JobsTerminalOpener` 是兼容例外：同一 App + Finder Sync Extension 暂时承载 `用终端打开`、`pod install`、`flutter pub get`、`CodeGraph 代码地图` 和 `空白 Commit 并 Push` 五项功能，但必须把五项分别展示为复选框，不能只提供整个工程的总开关。
- 已替代（2026-09-13）：功能组合只在构建时固化、变更必须重新安装的旧方案不再使用。构建值只作为首次运行默认值；安装器和已安装 App 共用持久化配置，Finder 扩展每次生成菜单时读取当前选择。
- `空白 Commit 并 Push` 只对普通文件夹提供菜单；Git 命令健康、当前文件夹是否位于 Git 工作树、当前分支、暂存区和推送远程必须全部在 Terminal 内校验。暂存区非空时不允许创建所谓空白 Commit。

## 二、安装与文档约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 根安装器使用 macOS 原生复选框 UI，逐项选择全部右键功能，并提供“全部安装”和“取消”；同一工程中的多个已选功能只构建、注册一次。
- `JobsTerminalOpener` App 必须在主窗口提供本工程全部功能的复选框，一项功能独占一行并显示适用条件，同时提供保存、全选和全不选；保存后重新打开 Finder 右键菜单即可生效，不要求重新编译。
- `JobsTerminalOpener` 主窗口必须允许拖动缩放并设置合理最小尺寸；内容从顶部开始排布，高度不足时使用垂直滚动承接，标题、功能项和底部说明均不得被标题栏或窗口边界裁切。
- 仓库根 README 与多功能工程 README 的前言区域必须醒目、简洁地列出所含右键功能，并明确哪些功能可以独立勾选。
- 安装器收到未知功能标识时立即停止；功能选择、工程去重、构建参数、扩展菜单过滤和安装结果汇总必须保持同一映射。

## 三、验证基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- AppleScript 选择器使用 `osacompile` 做语法编译。
- 根安装脚本使用 `zsh -n`，并分别验证全选、部分选择和未知标识解析。
- `JobsTerminalOpener` 使用部分功能集合隔离构建，随后读取宿主 App 与扩展产物的 `JobsTerminalEnabledFeatures`，确认首次运行默认值与勾选项完全一致；共享配置读写还要同时进入两个 target 并通过真实构建。
- 普通验证不得运行完整安装流程，避免注册扩展、重启 Finder 或触发真实依赖安装。

## 四、IDE 打开入口与 Pod 合并 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 明确要求；状态：已确认（产品行为）；适用范围：本仓 Finder 右键扩展；创建 / 更新：2026-10-18。增加“用 Xcode 打开项目”“用 VSCode 打开项目”“用 Android Studio 打开项目”。用户同日后续修正：开发 / 安装扩展已经以 Xcode 为前提，Xcode 入口直接打开，不再检查安装或跳下载页；最初要求三个 IDE 统一判空的 Xcode 部分已被本条替代（superseded）。VSCode、Android Studio 仍先自检，缺失时停止项目打开并转官方下载页。Pod 安装与升级必须合为一个右键入口，不得拆分；仅处理目标文件夹的 Pod 依赖，不包含 CocoaPods 工具本身的安装 / 升级。
- 当前源码分别位于 `JobsXcodeOpener`、`JobsVSCodeOpener`、`JobsAndroidStudioOpener`，每项保留独立宿主、扩展、Scheme、Bundle ID 和卸载入口。来源：用户于 2026-10-18 后续自行建立三个独立 Git 仓库，并明确要求与 `MacOS@Extension` 父仓绑定；状态：已确认并完成本地关联。三个子仓以 `../<同名仓>.git`、`branch = main` 登记，父仓 gitlink 指向各自 HEAD，本地元数据通过官方 `absorbgitdirs` 归集到父仓实际 Git 目录的 `modules/`；保留各自 GitHub / Gitee HTTPS 远端及工作分支。此前“父仓直接维护、无独立远端或登记”的状态已被本条替代（superseded）。原有四个子模块保持独立管理，总计七个子模块、十一个可勾选菜单；Terminal 工程仍为五项。下载清单与安装器缺失工程补齐流程须同步覆盖七项；本地关联不等于父仓已提交、推送。
- 来源：用户于 2026-10-18 要求为 `work/`、`Scripts/` 分别补 README；状态：已确认并完成本地文档。`Scripts/SelectFinderExtensionFeatures.applescript` 是统一安装器调用的原生选择界面，目录说明与根 README 保持链接。`work/<工程名>DerivedData/` 保存构建缓存及 Debug App / 内嵌 appex，安装器直接从该路径注册，因此清理前须先通过对应卸载入口停用并注销扩展，再按需重装；不能按纯缓存直接删。统一卸载仅覆盖六个宿主，`JobsGitRemoteCopier` 用子仓专用卸载入口；该专用入口自动清理子仓内部 work，不清理父仓对应目录。父仓只保留 `work/README.md` 可跟踪，其余 work 产物通过 `/work/*` 忽略，保留 `!/work/README.md` 例外。
- VSCode、Android Studio 通过 LaunchServices 查找应用并核验 Bundle ID、App 目录和可执行文件，缺失分支打开官网下载页后立即返回。Xcode 直接用 `/usr/bin/open -a Xcode` 打开，路径作为独立参数传递，无 Shell 拼接；当前目录优先 workspace，其次 project，同优先级多个候选时明确选择，不递归猜测子工程。
- 当前实现沿用已有工程依赖入口，将菜单标题改为“安装/升级 Pod”，保留 `pod-install` 配置 / URL 标识。用本机 `Pods/Manifest.lock` 记录判定已安装并执行 `pod update`，没有记录时执行 `pod install`；仓库自带 `Podfile.lock` 不能当作本机已安装的证据。终端确认时直接回车跳过，任意字符执行；先检查 Ruby、CocoaPods 和项目实际需要的 Bundler。该实现不自动安装或升级 CocoaPods 工具本身。
- 用户于 2026-10-18 实测后明确补充：Pod 操作的大前提是目标同层同时存在 `Podfile`、`*.xcodeproj` 和 `*.xcworkspace`；缺任一项，不显示入口，也不允许宿主弹出 Terminal。此前仅要求 Podfile + xcodeproj 的两件套门禁已被替代（superseded）。工程和 workspace 必须是目录包，不递归从其它层级补齐；Finder、宿主及运行时复核保持一致。
- 已修复的交互边界：将整段多行脚本塞入 Terminal 的交互 `do script` 会显示大量 `quote>` 续行提示，即使最终语法正确也会源码滚屏。Pod、CodeGraph 和空白 Commit 使用每次独立的私有 `.zsh` 载体（目录 0700、文件 0600），Terminal 只接收物理单行的安全启动命令；目标参数写入载体，含引号或换行也不变成交互输入。调度成功不能立即删除载体，因 AppleScript 返回不等于业务结束；由脚本最外层退出 / 信号处理精确清理本次文件及空目录，调度失败由宿主清理，不扫描其它会话。
- 验证边界：构建时使用 `JOBS_SKIP_FINDER_EXTENSION_BUILD_PHASE=1` 跳过脚本注册和 Finder 重启；Xcode 自带 `RegisterWithLaunchServices` 仍可能登记临时 App，隔离构建完成后按本次临时 App 的精确路径注销。源码 / 隔离构建通过不能代替真实 Finder 菜单与签名加载验收，不应在普通验证时运行宿主或完整安装器。

## 五、更新目标文件夹代码地图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 明确要求；状态：已确认（入口、目标范围、Homebrew 安装链与回车确认）；适用范围：`JobsTerminalOpener` 的 CodeGraph 菜单；创建 / 更新：2026-10-18。入口统一为“更新代码地图（.codegraph）”，保持单项及 `codegraph-bootstrap` 标识兼容；目标有图时同步，无图时创建。缺失组件时调 Terminal，回车确认后才安装，并体检实际依赖链。
- 当前官方仓库没有可确认的 CodeGraph Homebrew formula / tap，不能使用未落地的提案名。实现通过 Homebrew 准备 Node/npm，再安装官方 `@colbymchenry/codegraph` 到用户独立前缀；保留 Homebrew 系统 `YES` / 用户目录选择。健康 CLI 仅更新地图，不主动升级工具；安装分支复用健康依赖，只修缺失或损坏层，修复一次后立即复检。
- 安装来源、路径、失败命令和每次独立日志在终端可见；环境与 PATH 仅作用于当前子进程，不写 Shell 启动配置，不改变网络代理。CLI 自检禁止 shim 隐式下载，地图操作关闭遥测；不调用 `install`、`watch`、`serve`。
- 已核实发布版 1.6.2：`CODEGRAPH_NO_WATCH=1` 配合 `init --yes` 会进入自动 Git hooks 分支，当前入口使用 `CODEGRAPH_NO_WATCH=0` 避开。`init` 使用明确目标；`status` 可能回退父级，因此先用系统 SQLite 只读检查精确 DB 的 `nodes` 表（禁用用户 `.sqliterc`），异常 DB 直接停止；地图及直属条目符号链接也拒绝。
- 最终 JSON 核对项目 / 输出路径、索引时间、完成状态和必需待处理计数；仅在字段存在时检查较新版本的 `filesNeedingReindex` / `filesWithParseErrors`，兼容发布版 1.6.2。构建、签名及隔离回归已验证，真实工具安装和用户业务目录建图不作为普通测试执行。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
