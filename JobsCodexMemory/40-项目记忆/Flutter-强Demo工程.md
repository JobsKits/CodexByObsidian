---
type: project-memory
status: active
scope: flutter-demo-hub
repository: /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo
source: 用户于 2026-11-14、2026-11-15、2026-11-16 明确提出的工程长期建设及首页骨架要求
created: 2026-11-14
updated: 2026-11-17
tags:
  - codex-memory
  - project
  - flutter
---

# Flutter 强 Demo 工程

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 用户希望 Flutter 工程长期平行于 OC／Swift 原生强 Demo；需求 confirmed；功能实现与编译／交互验证见下方当前基线，真实硬件验收单独记录。

## 一、确认的工程要求 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- <span id="standalone-terminal-and-menu-20261117">每Demo独立启动与两种简化入口</span>：来源为用户2026-11-17明确要求，状态 confirmed，适用本Flutter工程及其终端／右键启动工具。每个Demo实际源码必须独立可运行；新终端输入命令进入等待状态，再手动输入／拖入`.dart`，或右键该文件从终端运行。终端入口归`JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs`，系统右键归`JobsGenesis/OS@Extension`；命令采用`frun`，含main实际源码为目标，向上定位所属工程pubspec并使用工程SDK／依赖／平台宿主，不复制到临时工程、不改写主入口。辅助文件／part／生成文件不补无意义main。本聊天2026-11-17追加确认：只有一个可执行项的右键组展开为父级‘从终端运行 Flutter Demo’，设备选择每行仅名称，内部标识隐藏且重名精确回映；工具行为及平台门禁的当前事实查[[MacOS-Finder-扩展体系#flutter-unified-device-menu-20261115|双端运行器记录]]。两端菜单源码、隔离测试、已安装菜单与实际运行分别记录于工程`项目相关报告/Demo源码目录整理.md#file-launchers`，不把静态入口全覆盖当成所有Demo设备业务实测。

- <span id="flat-demo-source-20261116">Demo源码目录扁平化</span>：来源：用户2026-11-16本轮明确要求，状态 confirmed，范围本工程lib/demos。删除全部入口.dart，独立main直接放真实实现；原“源码”目录内容上移一层并删除中间目录，维护import／export／part、登记、测试和文档，生成内容保字节、稳定ID及偏好不变。此前保留lib/demos内纯转发入口的做法在本范围superseded；lib/JobsDemoTools历史兼容层继续指向实际源码，不由本条扩大删除。当前实现及本批验证查项目相关报告/Demo源码目录整理.md。

- App 进入先开屏，结束移除开屏，再进入首页。首页是按功能分组的列表，每个 cell 对应实际可观摩功能，支持搜索。
- 首页左向右滑出菜单，半开／全开可设置；其它能力以 OC 新旧／Swift 工程实际功能为蓝本，保留所有 Flutter 既有功能再补缺项。
- 2026-11-15 用户明确追加：首页不常驻搜索框，右上圆圈省略号下拉菜单进入独占搜索页；搜索期间临时抑制首页浮控／抽屉，取消还原。侧栏须可选择覆盖与跟随平移，平移时菜单右缘和首页左缘连接。组支持折叠／展开／拖动，置顶进入独立顶部区；用户要求提供记忆／重启还原选项（原生现状只有持久化，不应误写成既有开关）。补齐时间、左下“按”、右下旋转计时与长按隐藏／摇动恢复Bug入口；全局设置增加控件样式分组，区分Flutter效果和Jobs封装效果。状态 confirmed，具体实现／验证以根目录资产盘点当前条目为准，不由本条需求推断已完成。
- 本轮对齐流程改为先核查 OC 新旧／Swift 与 Flutter 的 App 骨架资产，排除具体 Demo 子页面；报告归 `项目相关报告/`。每次改 App 必须在同一任务更新资产表，规则主归 [[30-工作流决策/工作流决策#app-asset-inventory-sync|App资产盘点同步]]。OC 新旧需求完全同源，装配／代码写法差异不构成需求差异。
- <span id="home-menu-and-recent-scope">首页菜单视觉与最近使用范围</span>：来源为用户2026-11-15同轮确认，状态 confirmed；创建／更新2026-11-15，范围为本工程及对应原生骨架。用户满意 Flutter 右上下拉菜单的立体层次，并以其作为 OC 新旧／Swift UIKit 的UI参考；本轮采纳“收藏可去掉”的建议，保留置顶与最近使用。最近使用进一步明确辐射 OC 新旧／Swift UIKit／SwiftUI，原生限定实现与验证见 [[40-项目记忆/Jobs-iOS-仓库族#native-home-menu-and-recents|原生首页菜单与四工程最近使用]]。收藏移除限于本轮首页侧栏和行菜单收藏动作，不自动删除遗留 `hub.favorites` 数据，也不继续读写或发送收藏偏好；不外推为清理所有Demo子页的收藏功能。
- <span id="home-pull-follow-20261116">首页分组操作与跟手刷新</span>：来源为用户2026-11-16的两张截图及明确纠正，状态 confirmed；创建／更新2026-11-16，范围为本工程首页和普通刷新适配。移除分组头“三点→上移／下移”菜单，保留组折叠、数量及右侧拖动柄；条目行源码／运行命令菜单与右上全局菜单不在该移除范围。下拉刷新时列表必须像iOS一样随手势移动，配合阻尼、有界拉距及松手回弹；此前为限制过拉而将目录固定不动的Clamping方案已 superseded，不应以消除全部内容位移替代防止无限下拉。新行为的实现和验证以当批资产表为准，不能沿用下方旧31项回归当作新验收。
- <span id="refresh-interaction-20261116">Jobs刷新与加载合同</span>：来源为用户2026-11-16明确追加，状态 confirmed；创建／更新2026-11-16，范围为本工程公共Jobs刷新与分页包。参考OC的MJRefresh体验及Swift JobsByPods四边封装，横纵两端均可刷新／加载，按实际AxisDirection处理reverse／RTL并允许两端角色互换；达阈值松手请求、执行互斥、列表有界跟手、运行留区和完成回弹。上次刷新与上次加载分别显示，仅成功完成后推进，失败保留旧值、首次明确无记录，稳定业务键隔离且可跨启动恢复。有效用户触发带声音和触觉，各有默认开启的全局持久开关，自动首屏／静默预取不反复反馈，覆盖／后台／销毁停止。实际实现、音频资源与通道验证查当前资产表；模拟器与单元测试不代表真机听感／触感。
- <span id="demo-theme-entry-20261116">Demo公共动作与首页视觉</span>：来源为用户2026-11-16确认，状态 confirmed；创建／更新2026-11-16。每个Flutter Demo右上有唯一动作入口，纯主题页切白天／黑夜，已有业务动作汇入同一菜单且保留回调／禁用／返回；全局设置仍支持跟随系统，独立源码main与首页进入共用。先同步需求和资产再改代码；不通过第二导航栏或修改外源页面实现。首页Section／Cell与OC新旧、SwiftUI共同向Swift UIKit卡片的层级、留白和文字靠齐，保留稳定ID、折叠／拖排／置顶／最近。浮钟不得遮开屏，按当前路由、前台及真正完成的转场恢复，长按全屏拖动范围不缩减；原生同一约束见[[40-项目记忆/Jobs-iOS-仓库族#native-home-behavior-20261116|首页行为合同]]。
- 公共能力按用途拆到 `JobsByPubs`，类似 iOS 的 JobsByPods；不要把业务 Demo 全堆进公共包。
- 每个功能统一放中文命名文件夹，不论一个还是多个 Dart 文件；尽量单文件，同时优先解耦。页面提供独立 main 入口，便于 VS Code 直接运行并观察效果，主 App 复用同一 Widget；入口与名称的具体合同见下条。
- <span id="source-head-entry-20261116">功能语义与源码头部入口</span>：用户2026-11-16进一步明确，范围为本工程Demo目录、首页与源定位，状态 confirmed。移除目录“旧例·”前缀、首页“原有功能”来源桶和“原有完整示例”副标题／标签，按实际功能语义统一，不靠运行时来源标签区分入口。真实实现源码应在导入／part指令之后直接提供main，头注给出对应 `flutter run -t` 命令，源码定位直接到该实现，避免 `入口.dart` 与主体源码割裂。执行时先盘点、再按显式稳定ID归组，保持既有功能和偏好标识，迁移后重新验证；实现与验收另记，不能只用入口数量推断功能完成。
- <span id="world-clock-skeleton-20261116">世界时钟与首页统一标识</span>：用户2026-11-16确认，范围为Flutter与OC两工程／Swift UIKit／SwiftUI五端骨架；SwiftUI缺首页浮钟时须补齐。浮钟按实际文字／语言／字号／设备安全区自适应留白，短按push世界时钟、长按拖动吸边，原长按隐藏语义 superseded，设置显隐保留。世界页当前时区独立置顶、全球有效UTC偏移各选知名代表（巴黎／纽约优先、含30／45分钟），显示当地日期、星期、时分秒及偏移，按IANA／系统规则计算夏令时；前台可见才每秒刷新、恢复立即校时。世界页用“12小时制”开关切换24／12小时，默认关，立即刷新全部行、记住选择，明确AM／PM（午夜12 AM／正午12 PM），首页原24小时不变。五端首页主标题“功能实验室”、副标题项目来源（Flutter补JobsFlutterBaseConfigDemo）；世界时钟归骨架，不注册Demo、不增加Demo功能项或Demo最近记录。资产表先登记后实现，每次变更同任务同步；测试／构建／实际UI以当批报告分别记账。
- Flutter 使用最新官方稳定 SDK；每次修改核对版本和真实编译结果，避免升级后 API 漂移。编译、静态分析、交互、硬件验收分别记录，不把某一项代替其余。
- <span id="dynamic-stable-fvm">FVM 动态稳定频道绑定</span>：用户于 2026-11-15 明确要求本项目用 FVM 绑定当前最新 Flutter SDK，并优先动态跟进，避免写死版本；状态 confirmed。`.fvmrc` 使用 `stable` 别名，编辑器通过 `.fvm/flutter_sdk` 定位；初始化与 CI 根据频道解析当时最新稳定发布。刷新频道 SDK 应在 SDK 自身目录执行，防止 `flutter upgrade` 顺带升级项目业务依赖；普通运行复用已准备的缓存，不承诺每次运行都会联网更新。此前数字版本绑定策略在本项目已 superseded，历史编译结果仍仅对应当时实际版本。
- 动态绑定限定验收（2026-11-15，scoped-verified）：真实 stable 缓存已从 3.41.6 升级到官方清单对应的 Flutter 3.50.0／Dart3.14.0，所需平台组件获取完成；FVM use、实际版本 JSON、SDK链接及 VS Code 入口对齐。依赖按原缓存执行离线 `pub get --enforce-lockfile`，业务 `pubspec.yaml`／`pubspec.lock` 未变；生成配置随当前SDK重新解析。CI 假命令 14 项／73 断言及初始化隔离片段通过，未跑真实远端CI或重新构建业务App；旧数字缓存保留。原项目声明3.50.0而链接指向3.47.7的日志不一致已修正，运行前体检已有频道支持，无需改OS菜单源码。

## 二、实现定位与边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 主入口 `lib/main.dart`，目录框架 `lib/demo_hub`，中文功能入口 `lib/demos`，公共基础包 `JobsByPubs/JobsDemoFoundationByPub`；旧 `lib/JobsDemoTools` 保留兼容转发，实际 Demo 与专属依赖集中在中文目录。
- <span id="ios-native-build-cache-20261116">iOS直编的缓存与产物边界</span>：2026-11-16本机实际验证，状态 scoped-verified。优先沿用当前SDK官方Flutter构建流程；需要直接xcodebuild限制jobs时，先读当前工具的`fetchDependenciesAndGenerateXcodebuildArgs`，保留其Swift Package缓存参数。本次SDK使用`-clonedSourcePackagesDirPath <项目>/build/ios/SourcePackages`；漏传会在已有checkout情况下重新等待远程SPM解析，不能将等待冒称实际编译。直接Xcode构建的最新App可能在`build/ios/Debug-iphonesimulator/Runner.app`，而`build/ios/iphonesimulator/Runner.app`仍是旧Flutter副本；冻结／安装前核对实际Kernel、责任源码SHA及资源，不能只依路径名称认定最新。上述为当前SDK事实，频道升级后重查，不把本机绝对路径写入分发依赖。
- 原 `main.dart` 异形按钮已完整保留到 `lib/demos/异形按钮/异形按钮.dart`，回归测试引用功能文件而不是假定它仍是默认入口。
- 原生实际入口清单为 `docs/native_feature_inventory.json`，对照见 `docs/原生功能对照.md`；385 个跨工程注册条目含大量重复及条件编译，不等于385种独立能力。ARKit、BLE、直播、Widget、Runtime、播放器及Unity有实际原生实现，平台条件、编译通过与实体设备验收分开记录，不用说明页替代设备功能。
- 2026-11-14 已验基线 Flutter 3.50.0／Dart3.14.0；当时数字版本配置与 CI 对齐的记录由上面的动态 stable 策略替代，不据历史记录恢复固定绑定。Material／Cupertino新独立包与历史GetX类型体系需成组迁移，不能局部替换造成Theme或Navigator类型分裂。

## 三、当前实现与验证基线 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 创建／更新：2026-11-14；来源为本任务用户要求继续完成及实际本机验证，状态 implemented-and-scoped-verified。仓库 `/Users/jobs/Documents/GitHub/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo`。
- 首页281个功能入口：189个旧能力／配置、14个平行交互、7个算法基础、16个数据／微应用、7个补充实验、34个UI、13个平台、1个真实iOS双引擎往返。原生385条注册记录对应245个独立类型，完整映射保存在工程JSON与对照文档。
- 175个旧main及85个专属依赖已归并；119个旧例目录使用具体中文功能名。旧路径保留兼容导出；操作控件十语与主题响应、局部路由、取消和生命周期有回归覆盖。
- 公共包：`JobsDemoFoundationByPub` 承接主题／十语／菜单／空态／输入／双向刷新／文字／队列／缓存／球形点选／冻结表格；`JobsLabRuntimeByPub` 承接隔离存储、白名单、编码加密、数据记录、计时；`JobsPlatformLabByPub` 承接原生硬件、媒体、Runtime／IMP回滚及引擎桥接。
- Flutter3.50.0／Dart3.14.0基线；主工程545测试与公共菜单5测试（共550）通过。全仓分析无error／warning，保留SDK弃用info；旧路径3个孤立生成part副本仅只读排除，中文目录活动生成库仍检查。Web release JavaScript、Android debug APK、iOS Simulator debug和iOS真机arm64无签名构建通过；模拟器安装启动到281项首页、原生宿主打开第二引擎、插件读写、回传与销毁均已实测（2个isolate恢复为1个）。
- 长按录制3–60秒与iOS滤镜真正写入带声成片、原生宿主打开第二FlutterEngine传参／回传、方法IMP替换与回滚、蓝牙／AR／传感器／录音／RTMP／PDF／PiP／Widget／动态图标／多窗口为实际实现。Unity只对iphoneos嵌入原生arm64 Framework和匹配Data。真实BLE外设、AR真机与推流服务的设备条件不以单测或编译冒充跑通；Web为JavaScript，不宣称旧依赖支持Wasm。
- 用户明确要求完成全量工作后再交付，不能把中间阶段完成当作本任务终点；若需要报告限制，区分实现缺口与实体设备／签名／服务条件。

- 2026-11-15此前App骨架批次基线：三原生工程各 `项目相关报告/App骨架功能盘点.md`（统一25项SKEL资产），Flutter同目录有本仓资产表、统一对照及帧错误排查；原生125处源码链接/行号、两OC同需求矩阵、6份根文档迁移正文/119入链复核通过。该批搜索/菜单/侧栏/分组置顶记忆/悬浮/刷新已接入，556＋15共571测试、静态无error/warning、iOS主入口debug及Androiddebug构建通过；模拟器限定实测入口与侧栏/设置已验，长组跨屏拖动/真机摇动声音触觉仍待验。帧时间clamping未稳定复现、未修复；候选调度实验未启用。其它骨架缺口及两OC6份巡检生成清单写入例外，以当前资产表和验收记录为准，不将本条扩写为完整四端等价。
- <span id="recent-scroll-validation-20261115">2026-11-15最近使用／收藏移除／下拉边界增量（历史批次）</span>：当批源码已移除侧栏收藏入口与行菜单收藏项，保留置顶；最近使用按稳定ID前插去重、最多30项，读取过滤未知ID。最近为独立始终展开列表，不受首页分组折叠／置顶排序影响，不手工拖排。首页与普通刷新适配当时采用 `AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics())`，保留Material和Jobs两种提示；该固定目录的滚动方案于2026-11-16被标为 superseded，当前要求见 [[#home-pull-follow-20261116|首页分组操作与跟手刷新]]。限定首页10项＋边缘组合6项＋公共15项共31项回归、iOS Simulator debug构建（276.6秒）通过，不等于重跑全仓或真机验收。新版重装启动后真实AX已确认侧栏无收藏、最近空态与重新加载，行菜单只有源码位置／复制运行命令。真实长拉未验，当时仅Widget持有1200px下固定目录的断言通过；一次drag返回成功仍无法确认事件落到手机内容，像素／逻辑坐标与 `noWindowsAvailable` 问题未排除，不能记为实际长拉或释放后的界面验收。该批状态 source-implemented／build-verified／scoped-ui-verified（仅前述AX）；实际结果由当次资产表和证据维护，旧批次验收不自动覆盖后续源码。
- 2026-11-16跟手刷新与组头简化阶段（source-implemented／scoped-tested／build-verified）：公共 `JobsRefreshScrollPhysics` 基于Bouncing阻尼与弹簧、默认最大越界120逻辑像素，在拖动与惯性阶段限幅；首页与普通Material／Jobs刷新适配均接入。组头三点移除、拖动柄及原布局记忆保留，不新增偏好键。首页10项＋边缘组合6项、公共组件19项，共35项通过；4文件分析0 error／0 warning、8 info，iOS Simulator debug阶段构建87.1秒通过。该结果早于功能语义与源码头部入口的追加迁移，不作为迁移最终验收；真实触控仍待验，后续当前结果以资产表为准。
- 2026-11-16功能语义与源码入口迁移（历史批次；本条保留175份兼容入口的目录形态已由flat-demo-source-20261116替代；source-implemented／scoped-target-ui-verified，整包待验）：119目录已去来源前缀，68项按稳定ID并入现有六组，189个相关ID序列不变；布局恢复只过滤废组键，不清空其它布局或最近。300个主／独立运行文件为175实现源码＋46带实现入口＋79独立或转发文件，main放到指令区之后并有带引号的头注命令；另175个纯兼容入口仅export＋main委托，88个helper不造main，三份生成part保留原字节。175个factory在实际源码，sourcePath／entryPath同源，独立运行仍依赖工程pubspec／资源／辅助库。胶囊源码 `lib/demos/胶囊按钮切页/源码/JobsSegmentTabs.dart` 的iOS构建49.0秒通过，实际启动后点击“7日内”使内容由1到3；仅该目标已实测，全仓测试／分析与最终首页包由当批验收记录回填。

## 四、<span id="four-repository-curation">四库功能与 UI 蒸馏</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 创建／更新：2026-11-16；来源为用户2026-11-15要求认真分析 `gsy_flutter_demo`、`gsy_github_app_flutter`、`Flutter`、`FlutterDemo` 并将有价值能力蒸馏到本工程。需求状态 confirmed；不能只交付建议或分析报告，也不能因来源私库缺失／SDK过旧就整份照搬旧依赖或用空壳冒充恢复。
- 当前源码已加入18个独立main入口（几何6、聊天／滚动／麦位／礼物5、工作流4、Shader／翻页／画廊3），目录从281增至299；已有播放器增量增强，不重复新增入口。公共数学与控件进入 `JobsByPubs/JobsInteractiveGeometryByPub`，业务fixture留在功能内；均为Jobs独立重写，没有来源运行时路径、品牌素材、OAuth材料、商业后台或丢失私库依赖。该蒸馏批次保留原有分组默认顺序、新分组追加；随后功能语义统一及实现源码头部入口遵循 [[#source-head-entry-20261116|现行源码入口合同]]，不继续沿用来源桶。
- 报告主入口为项目 `项目相关报告/四库功能与UI蒸馏盘点.md`，另三份来源盘点保留完整来源、已覆盖／实际采用／候选取舍、默认值、持久化、生命周期和验证。保留 FVM 动态stable策略；本轮实际 Flutter3.50.0／Dart3.14.0，依赖只增加本仓几何包，不批量升级旧业务依赖。
- 真正可观测的播放器就绪／进度／显式缓冲与首帧／掉帧须分开；按源隔离检查点、独立viewId和有限超时回退已实现。麦位与礼物为可操作UI／状态演示，不代表真实RTC／IM接入；真实解码、设备、服务与浏览器交互不能由Widget替身或构建成功推断。当前专项与最终全量结果以本轮资产盘点为准，旧281入口的历史多平台结果不自动覆盖新源码。
- 本批限定验证：主工程＋基础公共包＋新几何包完整673项通过，1项显式截图测试默认跳过（另已显式生成并查看真实字体图）；全工程analyze为0 error／0 warning、保留835条兼容与风格info。真实截图检出并修正霓虹主滑轨零宽，已补窄宽实际拖动回归；最终Web JavaScript release（217.0秒，含该修正与旧分组顺序保留）及随后iOS Simulator debug无签名构建（Xcode50.1秒）通过，未安装／启动；Web未开启Wasm。浏览器自动化两次超时，未记真实浏览器操作；原生视频解码、其它平台当前源码和真机结果不能从上述构建推断。

<a id="🔚" href="#前言">返回首页</a>
