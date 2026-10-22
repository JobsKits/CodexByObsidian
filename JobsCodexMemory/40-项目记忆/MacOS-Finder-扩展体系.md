---
type: project-memory
status: active
scope: macos-finder-extensions
repository: /Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension
created: 2026-09-13
updated: 2026-10-22
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
- [四、IDE 打开入口与 Pod 合并](#ide-project-menu)
- [五、更新目标文件夹代码地图](#jobs-toc-heading-6)
- [六、Windows 平行工程](#jobs-toc-heading-7)
- [七、双端 Flutter SDK 版本管理](#flutter-version-manager)
- [八、Git 拉取与 Flutter 依赖提取子仓关联](#git-pull-dependency-submodules)
- [九、双端 Flutter 第三方依赖提取](#flutter-dependency-extractor)
- [十、十个扩展工程统一单仓管理](#single-repository)
- [十一、Windows 安装与卸载面板对齐](#windows-selection-panel)
- [十二、双端 Flutter 项目右键运行](#flutter-project-runner)
- [十三、桌面右键新建 iOS 模拟器](#ios-simulator-creator)
  - [13.1、沙盒桌面识别与实测验收](#ios-simulator-desktop-verification)
- [十四、双端 Flutter 打包右键入口](#flutter-packager)
- [十五、双端 Flutter 项目体检与自动化生产代码](#flutter-doctor-codegen)
- [十六、单文件运行授权右键入口](#single-file-run-authorization)
- [十七、双端桌面 Git 动态代理配置入口](#git-dynamic-proxy-menu)
- [十八、双端桌面右键新建 Android 模拟器](#android-simulator-creator)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 记录 `MacOS@Extension` 中 Finder 右键功能的工程粒度、安装选择和文档表达约束。

**现行 Git 归属（2026-10-20）：** 十个工程统一由本仓直接跟踪，详见[单仓管理](#single-repository)。第四、七、八节关于独立子仓、远端、gitlink 和缺失下载补齐的历史状态已被该决策替代（`superseded`）；工程独立安装单元及产品行为继续有效。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、功能与工程边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-13 明确确认。一个 Finder 右键菜单功能应视为一个独立安装单元；新增能力优先采用“一项右键功能对应一个工程”的结构。
- 现有 `JobsTerminalOpener` 是兼容例外：同一 App + Finder Sync Extension 暂时承载 `用终端打开`、`pod install`、`flutter pub get`、`CodeGraph 代码地图` 和 `空白 Commit 并 Push` 五项功能，但必须把五项分别展示为复选框，不能只提供整个工程的总开关。
- 已替代（2026-09-13）：功能组合只在构建时固化、变更必须重新安装的旧方案不再使用。构建值只作为首次运行默认值；安装器和已安装 App 共用持久化配置，Finder 扩展每次生成菜单时读取当前选择。
- `空白 Commit 并 Push` 只对普通文件夹提供菜单；Git 命令健康、当前文件夹是否位于 Git 工作树、当前分支、暂存区和推送远程必须全部在 Terminal 内校验。暂存区非空时不允许创建所谓空白 Commit。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、安装与文档约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-21 根据 Flutter 运行扩展独立安装日志明确要求；状态：已确认；适用范围：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension` 下全部子功能目录的独立安装 `.command`；创建 / 更新：2026-10-21。统一在自述后直接回车安装，任意非空输入（包括空格）后回车跳过，Ctrl+C 或输入结束停止；没有可交互终端时拒绝安装。旧“回车跳过、非空输入安装”已替代（`superseded`），脚本头部、运行提示及就近 README 必须一致。总安装器仍先进入原生功能选择，空选门禁及卸载的精确 `YES` 确认继续保留，不将本约定扩大到其它业务确认。
- 来源：用户于 2026-10-21 明确要求；状态：已确认；适用范围：`OS@Extension` 下 macOS 总安装 / 卸载及独立功能目录中的安装 / 卸载入口；创建 / 更新：2026-10-21。`MacOS@Extension` 根目录的 `【MacOS】🧩安装Finder扩展.command`、`【MacOS】🧩卸载Finder扩展.command` 直接放置；各功能目录中的安装 / 卸载入口同样直接放置，与本目录 `README.md` 平级，不额外套脚本同名文件夹。各功能保持物理目录解耦；例如 `JobsAndroidStudioOpener` 的两个入口共用该功能 README。具体路径清单与验收统一维护在 README Skill 的同级附件，不把例外推广到其它独立脚本包。
- 来源：用户于 2026-10-19 明确要求并在预览后修正；状态：已确认；适用范围：根安装器的功能选择窗口；创建 / 更新：2026-10-19。使用原生复选框 UI，提供“全选 / 全不选”，选好后点击“安装”，没有勾选时安装按钮置灰且回车不能绕过；同一工程中的多个已选功能只构建、注册一次。中间选项区固定，不允许滚动，按内容确定窗口尺寸，较矮屏幕使用两列保证选项和底栏完整可见。旧“全部安装”直通按钮与中间滚动方案均已替代（superseded）；取消或关闭窗口停止后续安装。
- `JobsTerminalOpener` App 必须在主窗口提供本工程全部功能的复选框，一项功能独占一行并显示适用条件，同时提供保存、全选和全不选；保存后重新打开 Finder 右键菜单即可生效，不要求重新编译。
- `JobsTerminalOpener` 主窗口必须允许拖动缩放并设置合理最小尺寸；内容从顶部开始排布，高度不足时使用垂直滚动承接，标题、功能项和底部说明均不得被标题栏或窗口边界裁切。
- 仓库根 README 与多功能工程 README 的前言区域必须醒目、简洁地列出所含右键功能，并明确哪些功能可以独立勾选。
- 安装器收到未知功能标识时立即停止；功能选择、工程去重、构建参数、扩展菜单过滤和安装结果汇总必须保持同一映射。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、验证基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 当前 `Scripts/SelectFinderExtensionFeatures.swift` 选择器使用 `swiftc` 编译，并验证全选 / 全不选、空选禁用与普通 / 矮屏完整显示；旧 AppleScript / `osacompile` 验证已替代（superseded）。单独预览只返回选择结果，不运行安装器。
- 根安装脚本使用 `zsh -n`，并分别验证全选、部分选择和未知标识解析。
- `JobsTerminalOpener` 使用部分功能集合隔离构建，随后读取宿主 App 与扩展产物的 `JobsTerminalEnabledFeatures`，确认首次运行默认值与勾选项完全一致；共享配置读写还要同时进入两个 target 并通过真实构建。
- 普通验证不得运行完整安装流程，避免注册扩展、重启 Finder 或触发真实依赖安装。

## 四、<span id="ide-project-menu">IDE 打开入口与 Pod 合并</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 明确要求；状态：已确认（产品行为）；适用范围：本仓 Finder 右键扩展；创建 / 更新：2026-10-18。增加“用 Xcode 打开项目”“用 VSCode 打开项目”“用 Android Studio 打开项目”。用户同日后续修正：开发 / 安装扩展已经以 Xcode 为前提，Xcode 入口直接打开，不再检查安装或跳下载页；最初要求三个 IDE 统一判空的 Xcode 部分已被本条替代（superseded）。VSCode、Android Studio 仍先自检，缺失时停止项目打开并转官方下载页。Pod 最终以本节后文“Pod 原生命令”约定为准；早期安装 / 升级合并方案已被替代（superseded）。
- 来源：用户于 2026-10-20 通过 Finder 截图明确要求，并补充 Flutter 约束；状态：已确认（产品行为）；适用范围：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension` 下三个 IDE 扩展；创建 / 更新：2026-10-20。Xcode 项目目录只显示 Xcode 打开入口，隐藏 VSCode / Android Studio；非 Xcode 目录及普通文件不显示 Xcode 入口。Flutter 根目录只保留 Android Studio / VSCode，Flutter 判定优先于同层原生工程；单独选择其 `ios/` 原生目录或有效工程包时仍按 Xcode 处理。不递归把 Flutter 子工程误认为根项目。
  - 当前实现：三个独立子仓各自携带相同的 `XcodeProjectDetector.swift` / `FlutterProjectValidator.swift`。Xcode 检查当前目录 / 有效工程包的 `project.pbxproj`、`contents.xcworkspacedata` 或当前层普通文件 `Package.swift`；Flutter 复用 SDK 管理器的 `dependencies.flutter.sdk: flutter` 清单解析。菜单生成与执行均复核，编辑器在应用查找 / 下载前拒绝 Xcode 目标；独立扩展须一同重新构建安装才能更新真实菜单。源码隔离验证与真实 Finder 安装验收继续分开记录。
- 当前源码分别位于 `JobsXcodeOpener`、`JobsVSCodeOpener`、`JobsAndroidStudioOpener`，每项保留独立宿主、扩展、Scheme、Bundle ID 和卸载入口。来源：用户于 2026-10-18 后续自行建立三个独立 Git 仓库，并明确要求与 `MacOS@Extension` 父仓绑定；状态：已确认并完成本地关联。三个子仓以 `../<同名仓>.git`、`branch = main` 登记，父仓 gitlink 指向各自 HEAD，本地元数据通过官方 `absorbgitdirs` 归集到父仓实际 Git 目录的 `modules/`；保留各自 GitHub / Gitee HTTPS 远端及工作分支。此前“父仓直接维护、无独立远端或登记”的状态已被本条替代（superseded）。原有四个子模块保持独立管理，总计七个子模块、十一个可勾选菜单；Terminal 工程仍为五项。下载清单与安装器缺失工程补齐流程须同步覆盖七项；本地关联不等于父仓已提交、推送。
- 来源：用户于 2026-10-18 要求为 `work/`、`Scripts/` 分别补 README；状态：已确认并完成本地文档。`Scripts/SelectFinderExtensionFeatures.applescript` 是统一安装器调用的原生选择界面，目录说明与根 README 保持链接。`work/<工程名>DerivedData/` 保存构建缓存及 Debug App / 内嵌 appex，安装器直接从该路径注册，因此清理前须先通过对应卸载入口停用并注销扩展，再按需重装；不能按纯缓存直接删。统一卸载仅覆盖六个宿主，`JobsGitRemoteCopier` 用子仓专用卸载入口；该专用入口自动清理子仓内部 work，不清理父仓对应目录。父仓只保留 `work/README.md` 可跟踪，其余 work 产物通过 `/work/*` 忽略，保留 `!/work/README.md` 例外。
- VSCode、Android Studio 通过 LaunchServices 查找应用并核验 Bundle ID、App 目录和可执行文件，缺失分支打开官网下载页后立即返回。Xcode 直接用 `/usr/bin/open -a Xcode` 打开，路径作为独立参数传递，无 Shell 拼接；当前目录优先 workspace，其次 project，同优先级多个候选时明确选择，不递归猜测子工程。
- VSCode 点击链路：来源为用户于 2026-10-19 反馈菜单可见但无法启动，并在修复后明确确认“功能OK了”；状态：已实测确认；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsVSCodeOpener`；创建 / 更新：2026-10-19。纯代码宿主以 `main.swift` 强持有并显式挂接 AppDelegate，不能仅依赖 `@main`；`applicationWillFinishLaunching` 提前注册 URL AppleEvent。Finder 的选中项与空白目录使用独立菜单动作，在点击时查询 `selectedItemURLs()` / `targetedURL()`，不依赖转发中可能丢失的 `representedObject`。扩展仅用 `jobsvscodeopener://open?p=<base64url 路径>` 转交宿主；宿主完成应用健康检查和目录打开，异步回调后自动退出，手动运行仍显示配置窗口。Debug ad-hoc 构建、签名深验、请求编解码和主线程完成回调回归通过；真实 URL 冷启动已打开用户截图中的 Flutter 项目并正常退出，Finder 右键功能经用户确认。本地已更新原注册产物，未提交或推送。
- <span id="native-pod-install">Pod 原生命令</span>：来源为用户于 2026-10-20 明确指出入口过于复杂，并授权完全重写；状态：已确认；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsTerminalOpener`；创建 / 更新：2026-10-20。菜单标题为 `pod install`，资格只有两个同时满足的条件：目标同层存在 `*.xcodeproj` 目录与 `Podfile` 普通文件；无需 `.xcworkspace`，不递归补齐。Finder 与宿主共用验证器。点击后在 Terminal 原生交互 Shell 中直接执行物理单行 `cd -- <安全引用目标路径> && pod install`，不添加确认、升级选择、Ruby / Bundler 预检、Gem 环境切换、专用脚本或业务日志包装；Podfile 自身提示和错误由原生命令负责。保留 `pod-install` URL / `pod_install` 配置标识兼容既有启用选择。菜单及宿主改动须重新构建安装后生效。
  - 真实终端验收（2026-10-20，用户明确要求运行安装）：OC 新工程在独立 Terminal 分开执行 `cd` 和 `pod install`，与右键一样不出现 Flutter / FVM / SPM 提示并成功安装 229 项依赖 / 188 个 Pods；该 OC Podfile 未挂载这些交互。Swift 工程通过右键使用的同一宿主 URL 链实际启动，出现挂载脚本、FVM、SPM 确认，最终安装 121 项依赖 / 139 个 Pods。交互由目标 Podfile 的实际挂载决定，不能用不同项目的日志判定菜单是否保留交互；启动器本轮未再修改。
  - 已替代（superseded，见本条）：旧三件套门禁、安装/升级合并及任意输入选择 update、Gem/Bundler 环境分流、Pod 专用 `action.zsh`、`tee` / `script` 录制与确认自述均不再用于 Pod 入口；此前 48 项 / 473 断言为旧实现历史基线，不作为重写后的验收结果。旧实现曾出现隐蔽输入等待和 Gem 锁误判，现以原生直发方式收口。CodeGraph 和 Git 等其它复杂动作继续使用自己的载体及既有流程。
- 已修复的交互边界：将整段多行脚本塞入 Terminal 的交互 `do script` 会显示大量 `quote>` 续行提示，即使最终语法正确也会源码滚屏。CodeGraph 和空白 Commit 使用每次独立的私有 `.zsh` 载体（目录 0700、文件 0600），Terminal 只接收物理单行的安全启动命令；目标参数写入载体，含引号或换行也不变成交互输入。调度成功不能立即删除载体，因 AppleScript 返回不等于业务结束；由脚本最外层退出 / 信号处理精确清理本次文件及空目录，调度失败由宿主清理，不扫描其它会话。
- 验证边界：构建时使用 `JOBS_SKIP_FINDER_EXTENSION_BUILD_PHASE=1` 跳过脚本注册和 Finder 重启；Xcode 自带 `RegisterWithLaunchServices` 仍可能登记临时 App，隔离构建完成后按本次临时 App 的精确路径注销。源码 / 隔离构建通过不能代替真实 Finder 菜单与签名加载验收，不应在普通验证时运行宿主或完整安装器。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、更新目标文件夹代码地图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-18 明确要求；状态：已确认（入口、目标范围、Homebrew 安装链与回车确认）；适用范围：`JobsTerminalOpener` 的 CodeGraph 菜单；创建 / 更新：2026-10-18。入口统一为“更新代码地图（.codegraph）”，保持单项及 `codegraph-bootstrap` 标识兼容；目标有图时同步，无图时创建。缺失组件时调 Terminal，回车确认后才安装，并体检实际依赖链。
- 当前官方仓库没有可确认的 CodeGraph Homebrew formula / tap，不能使用未落地的提案名。实现通过 Homebrew 准备 Node/npm，再安装官方 `@colbymchenry/codegraph` 到用户独立前缀；保留 Homebrew 系统 `YES` / 用户目录选择。健康 CLI 仅更新地图，不主动升级工具；安装分支复用健康依赖，只修缺失或损坏层，修复一次后立即复检。
- 安装来源、路径、失败命令和每次独立日志在终端可见；环境与 PATH 仅作用于当前子进程，不写 Shell 启动配置，不改变网络代理。CLI 自检禁止 shim 隐式下载，地图操作关闭遥测；不调用 `install`、`watch`、`serve`。
- 已核实发布版 1.6.2：`CODEGRAPH_NO_WATCH=1` 配合 `init --yes` 会进入自动 Git hooks 分支，当前入口使用 `CODEGRAPH_NO_WATCH=0` 避开。`init` 使用明确目标；`status` 可能回退父级，因此先用系统 SQLite 只读检查精确 DB 的 `nodes` 表（禁用用户 `.sqliterc`），异常 DB 直接停止；地图及直属条目符号链接也拒绝。
- 最终 JSON 核对项目 / 输出路径、索引时间、完成状态和必需待处理计数；仅在字段存在时检查较新版本的 `filesNeedingReindex` / `filesWithParseErrors`，兼容发布版 1.6.2。构建、签名及隔离回归已验证，真实工具安装和用户业务目录建图不作为普通测试执行。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、Windows 平行工程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 目录层级决策：来源为用户于 2026-10-20 将两端工程移入 `OS@Extension`，并明确选择“仅分类目录，JobsGenesis 直接管理两端”；状态：已确认；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension`、`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`；创建 / 更新：2026-10-20。`OS@Extension` 不建立独立 Git，顶层 `.gitmodules` 使用 `path = OS@Extension/MacOS@Extension` / `OS@Extension/WindowsOS@Extension`；section 名、两端远端、分支和原 gitlink 提交号保留。两端 `.git` 指向 `../../.git/modules/<原 section 名>`，实际元数据继续归顶层 `JobsGenesis/.git/modules/`。旧的顶层直属工作目录位置已替代（superseded）；下列适用路径按新位置维护，macOS 内部仍按第十节十工程单仓约束，不恢复历史子 Git。
- 命名决策：来源为用户于 2026-10-20 明确要求“改为 WindowsOS@Extension，关联性的都改”；状态：已确认；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`；创建 / 更新：2026-10-20。旧目录名 `Windows@Extension` 已替代（superseded），下列适用路径按现名维护。父仓 `.gitmodules` 的 section / path、本地注册、gitlink 及 `.git/modules/WindowsOS@Extension` 已同步；源码头、两端文档、下载清单和 SourceTree 收藏路径一并更新。远端真实仓名仍为 `WindowsOS_Extension`；原有提交、分支、远端与未提交内容保留，未创建提交或推送。
- 来源：用户于 2026-10-18 明确要求；状态：已确认（双端范围与目录命名）；创建 / 更新：2026-10-18。Windows 开发人员同样需要开发右键菜单，工程固定放在 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`，与 `MacOS@Extension` 平行；不能把 Windows 源码塞进 macOS 子工程。
- 已替代（superseded，2026-10-18）：初版仅将十项功能做成独立开关，但运行代码、安装与状态仍属于整体；用户明确指出这不符合 macOS 侧的功能解耦思想，不能将“独立勾选”当作“独立工程”。
- 当前约束：用户于 2026-10-18 明确确认，Windows 每个右键功能必须有独立工程目录、业务源码、安装 / 卸载入口和运行状态；总入口只展示安装面板、选择若干功能并编排各自的安装器。单个功能目录可完整拷走独立安装，不依赖总入口或其它功能；纯基础设施可以受控内嵌，不能把集中业务脚本复制十遍冒充解耦。共十包，保留 PowerShell 5.1、当前用户注册和 Windows 11“显示更多选项”边界；Visual Studio 承接 Xcode，CocoaPods 不提供。十个功能包尚未分别登记独立 Git 子模块或远端，Windows 真实桌面验收仍待执行；最新实现与验证以工程 README 为准。
- 来源：用户于 2026-10-18 明确要求新增 Gitee `main`、保留 GitHub `origin` 并关联父仓；状态：已确认，远端推送及本地关联已验证；适用目录：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`；创建 / 更新：2026-10-18。本仓保留 `origin = https://github.com/JobsKits/WindowsOS_Extension.git`，新增 `gitee = https://gitee.com/JobsGo/WindowsOS_Extension.git`，本地 `main` 继续跟踪 `origin/main`，Gitee 目标为 `main`，不另建本地分支。父仓 `JobsGenesis` 以 `path = OS@Extension/WindowsOS@Extension`、`url = ../WindowsOS_Extension.git`、`branch = main` 登记子模块，使用官方 `absorbgitdirs` 将元数据归集到父仓 `.git/modules/WindowsOS@Extension`。原先整个 Windows 目录未登记的状态已被本条替代（superseded）；父仓关联及配套说明当前仅在本地，尚未提交或推送。
- 已替代（superseded，2026-10-18）：原“仅处理根 README、19 项回归、不推广其它仓库”的实验范围，在用户实测确认后被授权推广方案替代；现行跨仓工作流见 [[30-工作流决策/工作流决策#十五、Markdown 动态目录过滤器|Markdown 动态目录过滤器]]。
- 当前状态：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension` 使用 `.jobs-markdown-toc/` 的自包含工具和精确清单，共管理 22 份含标签说明（2026-10-21 按实际清单复验）；`Scripts/MarkdownToc.mjs` 保留同源码兼容入口，CI 继续用此入口核对清单全部原始索引内容。根 README 和 `Scripts/README.md` 说明动态目录、首次接入、日常暂存和安装 / 卸载边界；用户要求的 `Scripts` 目录用途说明已补齐。最初接入时转换器 38 项、部署器 8 项隔离回归通过，真实索引未改、未创建提交或推送；后续 CI 修复与发布见下条，远端折叠与 Windows 真实桌面仍按各自环境单独验收。

- <span id="windows-ci">Windows CI 验证基线</span>：来源为用户于 2026-10-21 明确授权修复并提交推送至 GitHub，持续到 CI 通过；状态：已实现并验证；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`。目录过滤器及兼容入口以 `bigint dev/ino` 比较目录身份，解决 Windows 路径大小写误判，保留父仓 / 嵌套仓保护；PowerShell 参数探针显式 UTF-8 输出，5.1 JSON 数组先赋值再展开；FVM 测试用字面路径 API 创建真实文件 / 目录及悬空链接，保留特殊字符覆盖。工作流未取消时继续执行全部独立检查，任一步失败仍整体失败。`main` 最终提交 `f11ce70` 已推送 GitHub，[运行 39457788523](https://github.com/JobsKits/WindowsOS_Extension/actions/runs/39457788523) 在 Windows PowerShell 5.1 下全部 16 组检查成功，用时 3 分 9 秒；22 份目录索引与工作区往返通过，本地 40 项 TOC 回归通过。Windows 桌面菜单及 FlutterRunner `-Native` 验收仍独立执行，不由此 CI 结果替代。创建 / 更新：2026-10-21。

- <span id="windows-local-regression">Windows 本地回归基线</span>：来源为用户于 2026-10-21 要求安装 PowerShell 后测试 Windows 侧右键菜单；状态：本地修复及自动回归已验证；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`。Homebrew 当前使用 `brew install powershell`，本机为 `7.6.7`。当前十五包（含独立 `JobsFlutterSdkInspector`）；已补齐包数断言、SDK 入口模拟与专项 CI 入口，修复 `^0.x` 上界、重复环境约束取值和十五项短屏布局。13 组 PowerShell 回归共 1,322 断言、98 份 Parser / BOM、十五包基础副本一致性、28 个 C++ 项目识别夹具、38 项目录回归及 23 份文档往返通过。该结果来自 macOS，不覆盖 Windows PowerShell 5.1、WinForms、真实注册表 / argv、Explorer COM 菜单或 CMD 后台生命周期；原 Windows CI `f11ce70` 基线保留，本轮改动未提交推送。创建 / 更新：2026-10-21。

## 七、<span id="flutter-version-manager">双端 Flutter SDK 版本管理</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-19 先要求 macOS 右键功能，随后明确要求同步实现 Windows 并放入平行仓库；状态：需求已确认，实现已落盘；适用范围：本仓与 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`；创建 / 更新：2026-10-19。两端功能目录均为 `JobsFlutterVersionMgr`，入口“安装/切换 Flutter SDK（FVM）”；保持一项功能一个独立安装单元，包含独立安装 / 卸载并接入总选择器。macOS 当前八工程十二项功能，八个工程均为独立子模块；Windows 当前十一包，新包尚未建立独立远端或子模块。
- 命名决策：用户于 2026-10-19 明确要求更名为 `JobsFlutterVersionMgr`；原名 `JobsFlutterVersionManager` 标为 `superseded`，以本节现行目录为准。两端目录、macOS 工程 / Scheme / 产品 / Bundle ID / URL scheme、安装映射、测试和文档同步更名；稳定业务标识保留。未安装的运行态与远端不作迁移。
- 用户确认的功能：先验证精确所选文件夹自身是 [**Flutter**](https://flutter.dev/) 项目，在终端体检实际工具链，查询官方历史及最新 SDK，通过 [**fzf**](https://formulae.brew.sh/formula/fzf) 单选，由 [**FVM**](https://fvm.app/) 安装或切换项目精确版本。macOS 通过 Homebrew 准备所需工具；Windows 复用健康工具，缺失 Git / fzf 经 WinGet，FVM 使用官方架构 ZIP 并校验 SHA-256。Windows 注册表菜单可见性不能据清单解析动态隐藏，运行第一步严格拒绝无效项目；保留当前用户注册及 Windows 11“显示更多选项”边界。
- 实现约束：只认根 `pubspec.yaml` 的 `dependencies.flutter.sdk: flutter`，排除注释、description、flutter_test-only、链接与非普通目录。官方清单失效时明确最新未知，仅提供已初始化缓存。健康工具复用，缺失 / 损坏层确认后只修一次并复检；fzf 按 Esc 取消，不设置全局 Flutter、不改变代理。版本操作跳过 pub get，成功需核对项目配置、SDK 链接和实际 Flutter / Dart。
- 交互决策：用户于 2026-10-19 在 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo` 实测后，明确要求去掉 macOS 独立管理 GUI，所有 SDK 操作在 Terminal 内进行。宿主仅作为 `LSUIElement` 后台 URL 转发与扩展初始化进程，不创建窗口、项目选择器或 Dock 图标；等待初始化与所有终端派发返回后自动退出。用户同时明确最终确认对调为直接回车执行安装 / 切换、任意非空输入（含空格）取消，EOF 停止；旧“最终回车跳过”已替代（superseded）。两端仅本功能同步此默认值，不改变依赖安装、fzf 取消和其它脚本的确认习惯。已打开的终端使用启动时的脚本副本，须重新右键启动才采用新交互。
- 点击链路：纯代码宿主没有 nib，入口 `main.swift` 显式强持有并挂接 AppDelegate；在 `willFinishLaunching` 注册 URL AppleEvent，再共用严格请求解码。Finder 动作在点击时重新查询所选项目或当前目录，不依赖菜单 `representedObject`。宿主启动、项目接收、Terminal 派发及退出状态追加到 `/tmp/JobsFlutterVersionMgr.log`；业务日志仍由终端脚本在首屏确认后建立。
- 配置保护：在私有 inspection 影子配置目录查询目标自身的 FVM context / cache，防止继承父项目缓存；精确根 `.fvmrc` 合并保留字段，迁移时去除旧 `flutterSdkVersion` 别名并关闭 `updateMelosSettings`。写前快照和并发校验，拒绝 FVM 已知写入位置的外部链接；FVM 成功后先核验真实版本，再补回其序列化剥离的原字段。失败保留现场和快照，不伪称事务回滚。
- 仓库关系：用户随后明确要求新增 Gitee、推送并关联父仓。macOS 新工程原先由父仓作为普通目录维护的状态已被替代（superseded）；现子仓位于 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsFlutterVersionMgr`，保留 HTTPS `origin = https://github.com/JobsKits/JobsFlutterVersionMgr.git`，新增 `gitee = https://gitee.com/JobsGo/JobsFlutterVersionMgr.git`，本地及两端均用 `main`。父仓登记 `path = JobsFlutterVersionMgr`、`url = ../JobsFlutterVersionMgr.git`、`branch = main`，已用官方 `absorbgitdirs` 归集元数据。子仓 `e0b4b5c`、父仓 `a259b48` 已按子先父后推送两平台；未发布 Windows 此次改动或提交更上层 JobsGenesis。
- 目录边界：本地 `[toc]` 是正常编辑形态。原普通目录曾由父过滤器接入；交付后初始化独立 Git，不会继承父仓的 local 配置，须按新 Git 根独立接入。现子仓自带 `.jobs-markdown-toc/`、精确属性与五份清单，父仓只管理自身四份文档，真实原始暂存 `check` 与工作区字节往返 `verify` 均通过。父安装器测试移至父仓 `Tests/FlutterInstallerIntegrationTests.rb`，保证子仓测试可独立运行；目录渲染的平台实测不由这些检查替代。
- 验证基线：初始 macOS Debug / Release、签名深验、资源字节一致、原生路径 / 载体权限 / 退出清理及五项父安装映射回归（27 断言）通过。2026-10-19 点击修复与后台化后重新构建 Debug、深验签名和资源一致；在用户指定项目通过真实 Finder 右键确认请求送达 Terminal，后台宿主派发后正常退出，原生隔离测试和二十二项业务（169 断言）通过。用户已自行安装并进入终端操作，原“未安装扩展”的初始状态已过时；本轮更新已有 App，本轮修复未提交推送。Windows 最终确认对应 69 条夹具断言、修改文件 Parser / BOM / CRLF 与目录往返通过，真实 Windows 桌面仍待实机验收；SDK 下载、选版与项目兼容性不由这些检查替代。

## 八、<span id="git-pull-dependency-submodules">Git 拉取与 Flutter 依赖提取子仓关联</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-19 已建立两个独立子 Git，并明确要求关联父仓、补齐 README 目录过滤器；状态：已确认并完成本地接入；创建 / 更新：2026-10-19；适用根目录：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension`。`JobsGitPuller`、`JobsFlutterDependencyExtractor` 均以同名 `path`、`../<真实仓名>.git`、`branch = main` 登记，元数据经官方 `absorbgitdirs` 归集。此前父仓普通目录的描述已替代（superseded）；父仓现有十个独立子模块、十四项功能。
- 两新仓保留本地 `main`、HTTPS GitHub `origin` 及 HTTPS Gitee 远端；Gitee 远端别名实际均为 `main`，与本地分支同名但职责不同，不自动改名。父仓只记录固定提交，不重复跟踪源码；原有八个子模块的提交指针保持不变。
- 目录分别归实际 Git 根管理：Git 拉取子仓五份、依赖提取子仓六份（均包含工具 README），各自携带 `.jobs-markdown-toc/` 与精确属性；父仓移除原跨界 Git 拉取条目，仅管理自身四份。工作区往返、临时索引整文件暂存 / 原始 blob 检查 / 检出字节还原通过；真实子仓索引保持接入前版本，首次发布须由用户整文件暂存全部清单文档及工具后运行 `check`，不能把临时索引通过等同于已发布。
- 总下载清单、安装器与原生选择器同步十工程 / 十四功能，缺失子工程走统一下载补齐；总卸载覆盖九宿主，复制 Git 地址仍用子仓专用卸载。九项隔离集成回归（50 断言）、三个入口语法与 Swift typecheck 通过；本轮未执行真实安装、注册、提交或推送。

## 九、<span id="flutter-dependency-extractor">双端 Flutter 第三方依赖提取</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-19 明确要求；状态：需求已确认，实现已落盘；创建 / 更新：2026-10-19；适用范围：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsFlutterDependencyExtractor` 与平行 Windows 仓库同名独立包。右键入口为“提取 Flutter 第三方依赖”，各自独立安装 / 卸载并接入总面板；菜单注册与原有功能分离。
- 用户确认的交互：提取终点支持输入或拖入，直接回车采用系统桌面；macOS 另交付桌面同名脚本文件夹 `【MacOS】提取Flutter第三方依赖.command/`，包含同名 `.command`、`ExtractFlutterDependencies.dart`、`README.md`，整体复制后可脱离 Finder 扩展运行。
- 现行实现：两端共用无额外包依赖的 Dart 引擎，交叉核对 `pubspec.lock` 与 `.dart_tool/package_config.json`，复制 hosted / Git / path 的实际锁定 Pub 源码、资源、包内平台源码与许可证，包含直接 / 间接 / 开发依赖。Workspace 核对真实成员声明及嵌套成员链，支持标准块 / 行内列表与 `*`、`**`、`?`，仅选中项目依赖闭包；不将 Flutter / Dart SDK 或 CocoaPods / Gradle 另外下载的原生缓存包含在源码归档内。
- 保护边界：只读项目和缓存，不自动 pub get / 下载工具；解析缺失、陈旧或版本不匹配时停止。输出每次独立命名，包含 `packages/`、`manifest.json`、原始项目 YAML / 锁文件及 README，完成后原子改名；失败不报告完整成功。目标不能落在项目或包内，包内链接物化，包外 / 循环链接拒绝。原始配置可能包含私有地址或本地路径，分享前检查。
- 验证基线：33 项隔离提取回归、macOS 交互 49 断言及总安装映射 50 断言通过，独立 `.command` 经真实本地 Dart 完整运行；macOS Debug 隔离构建与深度签名验证通过，Windows 脚本 / 打包夹具通过，真实 Windows 桌面和本功能 Finder 签名加载仍待实机验收。本轮未执行真实扩展安装、提交或推送；子仓关联状态以前一节为准。

## 十、<span id="single-repository">十个扩展工程统一单仓管理</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-20 明确表示已删除本仓名下全部子 Git 远端，并要求将工程归为一起管理、完成剩余收尾；状态：用户决策已确认；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension`；创建 / 更新：2026-10-20。
- 现行结构：十个扩展工程都是本仓普通源码目录；不再登记本仓内部 `.gitmodules`、gitlink、各工程 `.git` 和本仓 local 的对应 `submodule.*`。原第四、七、八节的十子仓关系标为 `superseded`，不得再初始化、下载或重新关联那些已删除的独立远端。
- 一个功能一个独立安装单元的约束继续有效；宿主、扩展、Scheme、Bundle ID、独立构建 / 安装 / 卸载入口均保留。总安装器只使用随本仓取得的源码，工程缺失时提示重新取得完整仓库并停止。用户已移除本仓三份子模块维护入口，不恢复这些入口。
- 文档目录过滤器收口为仓库根的一套工具、精确清单和 local 驱动，各工程含有效 `[toc]` 的说明归根清单管理；不再按旧子仓边界漏管，也不在普通工程目录安装独立 Git 过滤器。构建产物及个人 `xcuserdata` 留在磁盘并忽略。
- 迁移保留旧历史、索引、配置及未提交源码；旧子仓元数据已完整归档至 `/Users/jobs/.codex/backups/MacOS-Extension-single-repository-20261020-Ycdgru`。通过导入旧索引 blob / mode 将源码归本仓跟踪，原未暂存修改与六份未跟踪 Swift 文件保持各自状态。未授权提交、推送或改变本仓对外层 `JobsGenesis` 的既有关联。
- 验证：内部关联均为零；198 份迁移索引与旧 blob / mode 一致，171 份非文档业务文件字节不变，十份旧历史完整性通过。31 份文档本地标签 / 往返及隔离索引检查通过，完整源码导出后十工程配置齐全，安装器 11 项 / 71 断言与语法检查通过；README 折叠目录和单仓章节已作本地渲染预览。未运行真实扩展安装或远端发布。

## 十一、<span id="windows-selection-panel">Windows 安装与卸载面板对齐</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-20 明确要求 Windows 文件夹对标 MacOS@Extension，提供安装面板和安装 / 卸载两份脚本；状态：需求已确认；创建 / 更新：2026-10-20；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension`。
- 根目录中文入口为 `【Windows】🧩安装资源管理器扩展.cmd`、`【Windows】🧩卸载资源管理器扩展.cmd`；保留英文兼容入口与 `Configure.cmd`。总入口继续只编排十三个独立包，各包安装、卸载和状态边界不变。
- 原生面板提供全选 / 全不选，固定无滚动，按工作区使用单列或双列；安装每次默认全选，空选安装 / 卸载按钮禁用且回车不能绕过，取消或关闭不执行操作。Install 只安装所选并保留未选的已有功能，Configure 保存完整启用状态、允许全不选关闭全部，Uninstall 仅移除选中的已安装项。
- 所有根 `.cmd` 支持 `-Preview`：标题标记仅预览、按钮返回选择，不部署、不写状态或注册表；卸载预览可展示全部十三项，真实卸载仍只列已安装项。Windows 实际桌面显示、键盘及注册表行为须单独验收。
- 验证基线：macOS 便携 PowerShell `7.4.6` 下，面板布局 / 操作计划、包架构、清单与注册计划合计 620 个断言通过，84 份 PowerShell 语法 / BOM 检查和十三包模板一致性通过；38 项文档目录回归、20 份工作区文档往返通过。WinForms 控件事件、原生参数及真实注册表分支尚未在 Windows 执行，不把本地结果等同于 Windows PowerShell 5.1 桌面验收；本轮未提交或推送。

## 十二、<span id="flutter-project-runner">双端 Flutter 项目右键运行</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-20 明确要求；状态：需求已确认、源码已实现；创建 / 更新：2026-10-20。适用目录：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsFlutterRunner` 与 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/WindowsOS@Extension/JobsFlutterRunner`。两端都是独立安装单元并接入各自总面板；菜单为“运行 Flutter 项目”，只在精确 Flutter 根目录显示。
- 用户确认的交互：macOS 在 Terminal、Windows 在 CMD 选择运行设备并显示日志；关闭终端不影响后台 Flutter。macOS 选择 iOS 模拟器而没有可用设备时，直接内置原 `【MacOS】📱双击初始化iOS模拟器.command` 的型号 / Runtime 选择、创建及启动逻辑，不依赖原脚本的绝对路径。无 Runtime 时提示先在 Xcode 安装；不删除或关闭其它模拟器。
- 实现约束：按真实 `dependencies.flutter.sdk: flutter` 识别根目录，拒绝链接与普通 Dart / flutter_test-only；按项目已有平台目录过滤设备。复用项目已配置的 FVM SDK，否则使用 PATH Flutter，不静默切换已声明的 FVM 项目到全局 SDK。已有 Android AVD 可在终端启动，不自动创建 Android AVD。
- 后台与控制：macOS 使用当前桌面会话的 launchd、私有 FIFO 和会话脚本快照；Windows 使用原生 detached 监督进程与专属 Job 持有 Flutter 子树。Flutter machine 协议支持日志、热重载、热重启、明确停止及重新右键连接；注销 / 关机不承诺继续运行。日志和状态保留在各功能的用户数据目录。
- 菜单边界：Windows 采用原生 C++ `IShellExtInit` / `IContextMenu`，非 Flutter 目标不插入菜单项，不能降级为静态菜单全目录显示后再拒绝。首次安装需已有 MSVC / Windows SDK 与系统 .NET Framework 编译器；编译成功后才注册，缺少工具明确停止，不自动安装编译器。Windows 11 经典菜单的“显示更多选项”边界保留。
- 验证边界：macOS 原生构建、深度签名、资源一致性、项目与路径隔离检查及终端 / JSON 测试通过；真实 launchd + 假 Flutter 已验证入口退出、HUP 后存活、日志增长、异常崩溃后重新启动、重连、热重载及停止。Windows 隔离 / 静态验证与真实 Windows 编译、Explorer 加载及 CMD 关闭后的实机验收分开记录；不能把当前 macOS 主机上的验证等同于 Windows 实机通过。未安装启用本功能、提交或推送。

## 十三、<span id="ios-simulator-creator">桌面右键新建 iOS 模拟器</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-20 根据真实桌面菜单截图明确要求，状态：已确认；适用范围：本仓全部 Finder 扩展。系统桌面空白菜单只加入“新建 iOS 模拟器”；该模拟器入口不加入普通文件夹背景或任何选中项菜单。其它功能保留文件 / 文件夹 / 项目的原条件菜单，桌面上选中的项目不受空白菜单排除规则影响。此前模拟器同时出现在普通目录与选中项的初版范围标为 `superseded`，按本条收口。桌面按系统目录与目录服务真实 Home/Desktop 的规范路径比较，兼容沙盒与链接，不按目录名猜测。

- 来源：用户于 2026-10-20 明确要求将 `JobsCommand@iOS/其他/【MacOS】📱双击初始化iOS模拟器.command` 逻辑写入 macOS 桌面右键扩展；状态：需求已确认，源码、隔离验证与真实桌面菜单显示验收完成；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension`；创建 / 更新：2026-10-20。
- 独立普通源码目录 `JobsIOSSimulatorCreator`，菜单“新建 iOS 模拟器”，含宿主、Finder 扩展、独立安装 / 卸载并接总面板，不建子 Git。仅系统桌面空白可用，不要求 iOS 项目；普通目录与选中项不显示；唯一 `jobsiossimulatorcreator://simulator/create` 动作转交 Terminal，派发后后台宿主退出。宿主 / 扩展 ID 为 `com.jobs.iossimulatorcreator` / `com.jobs.iossimulatorcreator.findersync`。
- 自包含业务 `Scripts/CreateIOSSimulator.zsh` 随 App 打包，不依赖原目录；先选完整 iPhone / iPad 型号，再选去重后的可用 iOS Runtime，健康 fzf 优先、编号回退，秒级时间 + PID 和已有名称检查防同名。自述回车继续，最终回车创建、非空取消，无交互停止。右键入口省去旧清场，不关闭 / 删除已有设备，不装工具 / Runtime、不改代理或 xcode-select；失败保留新 UDID。`--help` / `--check` 只读。初版“先选系统再按兼容白名单筛机型”的策略于 2026-10-21 标为 `superseded`，按下一条平行核心决策收口。
- 来源：用户于 2026-10-20 反馈另一台 Mac 右键只显示 Duo、独立脚本正常，2026-10-21 确认独立脚本封装良好并要求与右键入口平行；状态：用户决策已确认、双侧核心已统一；适用范围：`JobsCommand@iOS/其他/【MacOS】📱双击初始化iOS模拟器.command/【MacOS】📱双击初始化iOS模拟器.command` 与 `JobsIOSSimulatorCreator/Scripts/CreateIOSSimulator.zsh`。独立脚本为规范源，两份完整脚本的 `Jobs iOS simulator core` 标记块逐字节一致，运行时各自独立，不 `source` 另一仓库或外置公共库；一致性回归防止分叉。独立入口保留既有清场 / Homebrew / fzf 封装，右键保持现有设备与调试会话；两侧只读入口都在前置写操作前分流。型号列表只取 Xcode 完整 `devicetypes` 中具名 iPhone / iPad，不按某个 Runtime 白名单、版本边界或家族字段提前隐藏，组合由 `simctl create` 最终判定，明确不兼容才回选。已观察本机 iOS 27.1 支持名单只有 Duo、27.0 有 62 种设备；完整名称清单有 45 种 iPhone / 43 种 iPad，不能将显示机型等同于全部组合可创建。目标机器需重新安装以更新 App 资源；未实际创建模拟器、未提交推送。
- 本机 Xcode 27.1 使用 `Contents/Applications/DeviceHub.app`，Bundle ID `com.apple.dt.Devices`；同时兼容同一 Xcode 的旧 Simulator 布局，不能只查旧 `Developer/Applications/Simulator.app`。Device Hub 打开后按设备名选中，不用未知深层 URL 参数。
- 平行核心验收（2026-10-21）：同一套隔离回归对两侧分别通过 33 项 / 206 断言，核心块字节一致，覆盖独立入口前置顺序与失败停止、只读绕过前置，以及完整文件复制到中文 / 空格 / 单引号 / `$` 路径后真实执行帮助。两侧真实 `--check` 都列出 88 种 iPhone / iPad；没有真实安装、清场、创建设备或重新部署右键 App，目标机器仍需取得新源码并重装以更新资源。
- 单次选择约束（2026-10-21）：来源为用户新电脑最初反馈“确认创建后再次弹出型号 / 系统列表，终端没有错误”；正常只应选择一轮。双侧核心已有显式重选门禁：泛化 `Unable to create a device for device type` 不判为不兼容，明确 `Incompatible device` 后也只有精确输入 `r` / `R` 才重选，回车 / 其它输入 / EOF 停止。宿主 `AppDelegate` 每次运行只接受首个合法创建请求，重复 URL 回调不再次派发，派发完成后也不重置。该阶段两侧各通过 38 项 / 279 断言、真实 AppDelegate 配假 Model 通过 26 条断言，生产宿主 Swift 类型检查通过。此前“现场根因待日志确认”的状态已被后续日志与默认组合决策取代（`superseded`）；门禁与去重保护保留。
- 回车默认组合（2026-10-21）：用户随后提供真实日志，确认默认 iPhone 18 Pro / iOS 27.1 返回 403 / `Incompatible device`，并明确要求一路回车能够创建。现仍完整保留型号，仅将存在确认支持的已装系统的型号优先，其次未知、最后全部明确不兼容；选定型号后排除明确不兼容的 Runtime，确认支持的版本优先、组内最新优先。有效非空 `supportedDeviceTypes` 匹配结论优先于机型通用版本范围，缺失 / 空 / 不完整名单不猜测为不支持，仅用有效上下限排除越界项。编号模式改为回车第 1 项，q / Esc / EOF 取消；fzf 仅对子进程移除默认选项环境变量，防止外部反转或筛掉推荐首项。旧“两个独立清单首项直接组合、编号回车取消”的策略标为 `superseded`。两侧真实只读体检完整保留 88 个型号，首选 iPhone 18 Pro / iOS 27.0；仅装 Duo 专用系统的夹具默认 Duo 且传统机型仍显示。验证：两侧各 53 项 / 376 断言通过，核心字节一致；包含外部 fzf 默认选项隔离及父 Shell 配置保留。状态：用户需求与现场原因已确认、源码与隔离验证完成；目标机器需重装后验证实际创建成功，未真实创建设备或部署、未提交推送。
- 注册成功必须对应当前 appex 精确路径，旧路径 `+` 不算成功；独立安装清旧 LaunchServices / PlugInKit 登记但保留旧 App 文件，注册新 App 后显式初始化。总安装映射支持小写宿主 ID 覆盖，原功能保留产品名推导；源码当前 16 功能 / 12 工程（含第十二节 Flutter 运行），总卸载继续保留复制 Git 地址的专用入口。
- 初版验证记录：Xcode 27.1 / 27A9275、arm64 Debug 双 target 构建、ad-hoc 深签和资源字节一致通过；业务 25 项 / 140 断言、原生 60 断言、独立安装 10 项 / 66 断言、父映射 19 项 / 108 断言通过，真实只读清单 / Device Hub 核验通过。未启用扩展、未重启 Finder、未真实创建模拟器；Xcode 自动登记的隔离产物已精确注销，真实菜单 / 权限 / 创建待安装验收；未提交推送。

- 桌面范围修复与部署验收（2026-10-20）：7 个原 container 扩展均屏蔽真实桌面，Simulator 隐藏全部 items / 普通目录菜单；其中“仅监控桌面”的中间方案已被后续实测推翻（`superseded`），以[沙盒桌面识别与实测验收](#ios-simulator-desktop-verification)为准；原 4 个 items-only 扩展不改。初轮 `Tests/DesktopFinderMenuTests.rb` 3 项 / 49 条 Ruby 断言及 165 条真实 Swift 菜单 / 点击 / 路径断言通过，Simulator 原生回归当时为 65 断言。8 个已安装工程已在原 `work/<工程>DerivedData` 增量构建、深签、精确路径注册启用，统一刷新 Finder 一次；其余 4 项 Jobs 注册与启用状态与操作前一致。此前“未启用、待安装”的初版状态已被本次用户安装及更新取代；尚未执行真实创建设备。更新前 App 与注册状态已保存在系统临时目录 `JobsDesktopMenus-before-20261020-63125-1pv3szu`，含激活审计；源码未提交推送。

### 13.1、<span id="ios-simulator-desktop-verification">沙盒桌面识别与实测验收</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-20 反馈真实桌面缺少入口后的本机诊断与 GUI 验收；状态：已实测确认；适用范围：`JobsIOSSimulatorCreator` 的 Finder 扩展；创建 / 更新：2026-10-20。扩展进程初始化日志证实，`FileManager` 的 `.desktopDirectory` 与 `NSHomeDirectoryForUser(NSUserName())` 均被沙盒重定向至容器 `Data/Desktop`；只监控该别名时，真实桌面菜单没有派发回调。此前把 Foundation 用户 Home API 当成真实 Home 来源的判断同样标为 `superseded`。
- 现行实现：用 [**Darwin**](https://developer.apple.com/documentation/darwin) 的 `getpwuid_r(getuid())` 取得真实 Home，真实 `Home/Desktop` 优先，保留系统解析的桌面别名；监控根目录 `/` 并兼容已知桌面路径，菜单生成与点击仍严格只接受桌面 container。监控根范围不等于开放普通文件夹菜单，全部 items 与普通 folder background 继续隐藏。已知桌面按完整路径做纯词法规范化及白名单匹配，命中不依赖 `stat`、目录存在、包标记或资源元数据可读；可解析符号链接只作为兼容，不把沙盒元数据失败当成隐藏入口的条件。
- 验收：真实桌面菜单截图 `JobsDesktopMenuOpen.png` 中本套扩展只显示“新建 iOS 模拟器”；2026-10-20 22:21:32（Asia/Shanghai）的真实 appex 日志记录 `Menu kind=1 target=/Users/jobs/Desktop candidate=/Users/jobs/Desktop`。根回归现为 3 项 / 49 条 Ruby 断言及 177 条 Swift 断言，原生回归现为 66 断言；覆盖根监控、模拟沙盒 Home 重定向、真实 passwd Home 优先、已知桌面元数据不可用，以及普通 folder / 全部 items 拒绝。最终重建部署后的仓库截图 `work/JobsIOSSimulatorDesktopMenu.png` 再次确认桌面只新增模拟器入口，`work/JobsIOSSimulatorFolderMenu.png` 确认普通文件夹菜单没有模拟器入口且保留旧通用项；实际桌面与普通文件夹菜单均已验收，全部选中项边界仍由隔离回归覆盖。未执行真实创建设备，不把菜单显示等同于 Terminal 自动化授权或创建流程已验收。

## 十四、<span id="flutter-packager">双端 Flutter 打包右键入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 指定 SourceTree 的 Android / iOS 打包脚本并明确要求，随后要求在 `OS@Extension` 增加鸿蒙打包且只在 Flutter 项目文件夹右键出现；状态：产品需求已确认，源码及本功能隔离回归完成；创建 / 更新：2026-10-22。适用目录为 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsFlutterPackager` 和同级 `WindowsOS@Extension/JobsFlutterPackager`。
- 两端菜单均命名为“Flutter打包”，一个独立包 / 安装单元，只在当前层 `pubspec.yaml` 确认 `dependencies.flutter.sdk: flutter` 的真实项目根目录显示；不通过扫描父子目录放宽范围。已接入各自总安装器，并保留本包独立安装 / 卸载入口，不新增子 Git。
- 终端内严格使用 fzf 选择 Android / iOS / HarmonyOS（鸿蒙）；Android 再选 APK、AAB 或两者，鸿蒙再选 HAP、APP 或两者，默认 release。原 Android / iOS 的 mode / flavor 与签名行为保留；鸿蒙只用工程默认 product / target，拒绝非空 flavor，避免适配 SDK 静默回退 default。先检查工具，再 pub get 和构建，失败立即停止；业务自包含，不依赖 SourceTree 路径。
- 鸿蒙需要已有 `ohos/build-profile.json5` / `ohos/oh-package.json5`、匹配的鸿蒙 Flutter SDK、HarmonyOS SDK 与健康 Node.js / npm / ohpm / hvigorw / Java；逐个检查 HAP / APP CLI 能力后才解析依赖。支持 `FLUTTER_OHOS_SDK` 显式选 SDK、`OHOS_BUILD_TARGET=hap|app|all`；macOS 另有 `--flutter-sdk` / `--ohos-target`。优先现有 FVM SDK，鸿蒙固定 SDK 缺失时不自动下载或切换。保留签名、平台和工具版本；Windows 结束后精确恢复进程环境。鸿蒙只作为已有 Flutter打包 的第三个平台，不增加菜单项或安装单元。
- macOS 使用独立宿主、Finder Sync、URL `jobsflutterpackager://package/run` 和私有终端载体；Windows 采用独立 C++ 动态菜单 handler，在插入菜单前过滤项目。Windows 选 iOS 时，在任何依赖解析 / 构建前提示必须使用 macOS + Xcode 并停止，不自动操作远程 Mac。
- 缺 fzf 明确给出安装命令并停止，不退回编号菜单、不自动安装升级工具。Android 按 mode / flavor 验证非空产物并允许 Gradle 合法缓存；iOS 不将旧 IPA 或单独 xcarchive 报成新 IPA。打包是前台终端任务，关闭窗口会影响构建。
- 验证边界：鸿蒙接入后 macOS 业务回归 55 项 / 507 断言、共享项目与菜单边界 58 断言、AppDelegate 单次派发 5 断言通过；Windows PowerShell 7 假工具链业务回归 164 断言通过（含 fzf 中文 UTF-8 临时设置与恢复）。覆盖普通目录 / 父目录 / 平台子目录 / 多选隐藏、SDK 能力拒绝、工具链失败、取消、产物和返回码；可复用已有非空鸿蒙增量产物并提示模式与签名核对。真实 Flutter 构建、Windows PowerShell 5.1 / 批处理、MSVC 编译 / Explorer 加载及安装后菜单仍须目标机器验收；未部署启用扩展、提交或推送。跨功能全量回归与并行新增扩展状态分别记录，不用本功能通过替代全仓通过。

## 十五、<span id="flutter-doctor-codegen">双端 Flutter 项目体检与自动化生产代码</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 要求先审查升级 SourceTree 的 Flutter 项目体检、自动化生产代码两个脚本，再在双端增加同功能右键菜单；状态：需求已确认、源码已实现；创建 / 更新：2026-10-22。适用目录为 `/Users/jobs/Documents/Github/JobsGenesis/SourceTree.command` 及 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension` 下的两平台扩展仓库。
- 两端各有独立 `JobsFlutterDoctor`、`JobsFlutterCodegen` 安装单元并接入总安装面板，仅精确 Flutter 项目根目录显示；macOS 转交 Terminal，Windows 使用原生动态菜单并转交可见终端。不新增内部子 Git。
- macOS 将升级后的 SourceTree 两个完整脚本分别打包为 `InspectFlutterProject.zsh`、`GenerateFlutterCode.zsh`，源码与打包资源均校验字节一致；运行时不读取另一仓库。以后升级原脚本须同步这两个资源并重新构建安装。Windows 使用独立 PowerShell 实现对齐行为。
- 体检默认 `doctor -v`，区分命令结束与诊断通过；生成默认 `pub get` 后执行依赖声明与配置明确启用的生成器，无生成器时仅拉取依赖。默认不清缓存、不额外传强制删除冲突参数，生成器仍可改写自身管理的产物；危险清理 / 删除冲突选项须精确 `YES`。项目已声明 FVM 但 SDK 不可用时停止，不切全局 SDK、不隐式安装。
- SourceTree / macOS 的 `--check` 与 Windows 的 `Scripts/Check.ps1` 检查项目和命令计划，前者另解析 SDK 路径；均不调用 SDK 或执行项目业务。原脚本运行态和备灾态继续双位置同步；新扩展未自动安装启用，Windows 原生编译、Explorer 加载和真实项目业务仍需目标机器验收。

## 十六、<span id="single-file-run-authorization">单文件运行授权右键入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 指定 `JobsCommand@Others/【MacOS】⚙️运行授权.command`，要求写入右键菜单且只在目标为单文件时出现、文件夹不出现；状态：产品要求已确认，源码与隔离验证完成；创建 / 更新：2026-10-22。适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension`。
- 独立普通源码目录 `JobsRunAuthorizer`，菜单“运行授权”，保留独立安装 / 卸载并接入总面板，功能标识 `run-authorize`；无新增子 Git。宿主 / 扩展 ID 为 `com.jobs.JobsRunAuthorizer` / `com.jobs.JobsRunAuthorizer.FinderSyncExtension`，URL scheme 为 `jobsrunauthorizer`。
- 仅选中一个普通本地文件显示，不限制后缀；目录、应用 / 工程包、符号链接、多选及任何空白菜单不显示。菜单点击、宿主派发、终端执行分别复检；终端等待确认期间按设备号与 inode 拒绝替换后的对象。
- 原脚本真实核心只有 `chmod +x`，新增业务保持当前 umask 和该语义，不增加隔离属性清理、不执行目标、不递归、不自动 sudo。Terminal 展示路径后回车继续，任意非空输入取消、EOF 停止；确认后才创建私有会话日志。打包业务自包含，原双击脚本及其 README 保留。
- 验证：业务 15 项 / 192 断言、真实菜单源码 76 条 Swift 断言、URL / 私有载体 38 断言及独立安装回归通过；Debug 两 target 构建、深度签名、打包脚本字节一致通过。Xcode 自动登记的隔离产物按精确临时路径注销，未启用扩展或刷新 Finder；真实菜单与 Terminal 自动化需安装后验收，未提交推送。

## 十七、<span id="git-dynamic-proxy-menu">双端桌面 Git 动态代理配置入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 明确要求将 `JobsCommand@Gits/【MacOS】🌐双击配置Git动态代理.command` 纳入 `OS@Extension` 的系统桌面右键，并写 macOS / Windows 双端；状态：需求与项目约束已确认，源码已实现、验证边界另记；创建 / 更新：2026-10-22。
- 两仓各自新增普通源码目录 `JobsGitProxyConfigurator`，功能标识 `git-proxy-configure`，菜单“配置 Git 动态代理”，接入各自总安装面板并保留裸露的独立安装 / 卸载入口，不新增内部 Git。仅系统桌面空白显示，普通目录背景和选中项隐藏。早先第十三节“桌面只加入 iOS 模拟器”的独占表述已 superseded；后续明确新增的 Android 模拟器和本入口同样允许桌面显示。
- 菜单安装 / 注册只建立入口，不自动配置 Git；点击后在可见终端阅读范围并回车安装，C 只读检查，R 确认后精确恢复。卸载菜单不撤回另行安装的 Git 动态运行态；需要恢复时从配置流程执行，不能把卸载菜单说成已恢复网络环境。
- macOS 完整打包现行独立 `.command` 并逐字节对账，保持私有快照、用户 Shell 与 Sourcetree 受控项。后台宿主仅接受固定 URL，单次去重派发；初始化参数只启用扩展，不打开配置终端。
- Windows 使用系统 PowerShell 5.1 / .NET 编译真实 `git.exe`，动态运行态独立于菜单发布目录。只写用户 PATH 与专用文件，快照保留类型、缺失 / 空值及字节，遇后续修改停止；系统静态代理可达优先、失败再直连，原生 Git 业务最多一次。机器 PATH 可能早于用户 PATH，需用专用终端或在 Sourcetree 等应用选择 shim，不宣称所有终端 / GUI 已接管。
- 支持现有标准系统 HTTP / HTTPS / SOCKS 代理，不绑定 VPN 品牌或固定端口；PAC / 应用私有代理不执行或猜测，TUN 走系统路由。跨端隔离测试、macOS 原生构建与签名不替代真实 Windows Explorer / PowerShell 5.1、GUI 管道、Ctrl+C 和实际远端验收；本轮没有提交、推送或自动安装用户 Git 配置。

## 十八、<span id="android-simulator-creator">双端桌面右键新建 Android 模拟器</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 指定独立 Android 启动脚本并要求与 iOS 同等待遇、明确双端；状态：需求已确认，源码与隔离回归已实现；创建 / 更新：2026-10-22。范围为 `/Users/jobs/Documents/Github/JobsGenesis/OS@Extension/MacOS@Extension/JobsAndroidSimulatorCreator`、同级 `WindowsOS@Extension/JobsAndroidSimulatorCreator`，以及 `JobsCommand@Flutter/运行/【MacOS】🚀双击启动Android模拟器.command/`。
- 两端均独立安装 / 卸载并接总面板，菜单“新建 Android 模拟器”仅系统桌面空白显示，点击直接新建，不要求 Flutter 项目。macOS 固定 `jobsandroidsimulatorcreator://simulator/create` → 私有 Terminal 载体 → 自包含 `--create`；双击脚本无参数可选已有 / 新建，两份完整脚本逐字节相同。第十三节旧“桌面空白仅 iOS”范围由本条补充为 iOS / Android 两项；普通目录与选中项继续不加入模拟器入口。
- SDK / Java / SDK 工具 / emulator 按实际依赖检查；缺失组件须确认后补齐、安装后复检、失败停止。CLT 从 Google 官方 XML 解析稳定归档，校验摘要，在 SDK 同卷私有 stage 暂存并新增独立版本，保留旧工具与全部 AVD；不自动接受许可证、不改代理或 Shell 配置。Mac 支持 Apple Silicon / Intel，fzf 健康优先、编号回退；Windows 使用原生 DesktopBackground handler 与 PowerShell 5.1，x64 模拟器与硬件加速需可用。稳定 minor / ext API 均可解析，不包含代号预览。
- 验证基线：Mac 脚本 36 组 / 246 断言，桌面菜单 241 条 Swift 断言、宿主 / 安装 / 安全传输回归通过；两 target Debug 构建、深度签名、已打包核心字节一致、本机扩展精确路径启用通过。真实 Desktop 目录空白菜单同时显示 iOS / Android 两项。Windows Android 业务 38、修复 36、桌面 C++ 规则 9 断言及架构 / 安装 / Parser 验证通过；Windows MSVC 编译、Explorer 实机加载仍待验。
- 本机只读检查 SDK / Java 21 / emulator / fzf 可用，缺 CLT 与完整 ARM 手机 / 平板映像；用户首次新建可按提示确认安装。此次未下载 SDK 归档或映像、未创建 / 启动真实 AVD；未提交或推送。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
