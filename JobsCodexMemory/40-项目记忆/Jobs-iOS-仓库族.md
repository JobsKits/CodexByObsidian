---
type: project-memory
status: active
scope: jobs-ios-repos
repositories:
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo
  - /Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo
created: 2026-07-15
updated: 2026-09-13
tags:
  - codex-memory
  - project
  - swift
  - objective-c
---

# Jobs iOS 仓库族

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> Swift 与 Objective-C 新旧仓库的固定映射与共享处理边界。

## 一、仓库映射 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Swift 侧：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`。
- OC 新项目：`/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`。
- OC 老项目：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo`。

## 二、项目关系

- OC 新项目由老项目升级而来，把主工程中的部分能力拆分为本地 Pods，大多数能在老项目主工程中找到来源或对应功能。
- 从 OC 新项目平移能力到老项目时，不照搬本地 Pod 形态，不新增 Pod 依赖；应把源码、资源、Demo 入口和工程引用平移到老项目主工程既有目录与 target。

## 三、格式化约束

- 执行范围和验证见 [[30-工作流决策/工作流决策#四、Jobs Swift / Objective-C 仓库族格式清理|仓库族格式清理决策]]。

## 四、Swift 主工程交互边界

- 来源：用户于 2026-07-17 明确确认，且已由 Swift 主工程源码复核。演武堂根页面 `RootListVC` 是半屏抽屉边缘右滑的唯一打开入口；当页面被 push、present 或切换至其它 Tab 时，必须拒绝打开手势，但不影响已打开抽屉的关闭手势。通过 `JobsSideDrawerConfiguration.shouldBeginOpeningGesture` 注入页面判定，避免调用方散落特判。
- 来源：用户于 2026-07-17 提出开屏期间不得穿透触发抽屉，且已由本地 Pod 源码复核。`JobsSwiftSplash` 展示期间必须保存并暂停宿主根视图的既有手势；开屏结束或释放时恢复各手势原有启用状态。交互隔离由开屏组件负责，不让业务层或抽屉组件耦合该规则。

## 五、三端控制器销毁提示

- 来源：用户于 2026-07-19 明确要求，并已在 Swift、OC 新项目和 OC 老项目完成源码复核。三个项目的设置页都要提供控制器销毁提示开关，并保持同一交互文案与默认行为。
- 开关使用持久化键 `com.jobs.debug.showsControllerDeinitTips`，未配置时默认开启；判断必须在实际销毁回调发生时读取，使已经创建的控制器也能立即响应设置变化。
- 关闭开关只隐藏 `deinit` / `dealloc` 的 Toast，包括专用内存释放检查页的“检查者出栈”；通知移除、调试日志、retain count 检查和其它清理逻辑继续执行。

## 六、Swift 传感器 Demo 表达边界

- 来源：用户于 2026-07-19 针对 CoreMotion 陀螺仪页面明确确认。传感器 Demo 不能只展示三轴原始坐标；应把用户的持机、手腕和身体动作翻译成可见、可读或可触的实时反馈，保留原始数据作为辅助信息，让 Demo 体现人的参与感和能力语义。

## 七、OC 开屏退出边界

- 已替代：本节早先关于“隐藏系统返回键”和“按导航栈退出”的记录不符合实际架构，不再作为实现依据。
- 来源：用户于 2026-07-19 结合 Swift 侧实现明确纠正。开屏页是直接覆盖在宿主页面上的子控制器，不创建导航栏或返回键，也不存在“隐藏返回键”的说法。
- 倒计时按钮在运行期间必须保持可点击；用户点击右上角按钮或倒计时自然结束时，都执行同一 `finish` 路径并移除开屏子控制器覆盖层。
- OC 全局导航默认 UI 只能对 `navigationController.viewControllers` 中的真实入栈成员生效；不能仅凭子控制器继承得到的 `navigationController` 属性判定。否则会给开屏覆盖层错误创建 GK 导航栏，产生本不存在的返回键和标题。
- `JobsOCSplashPresenter` 不能直接对 `UINavigationController` 调用 `addChildViewController:`，该容器会把子控制器纳入 `viewControllers`。传入系统容器时必须递归取当前可见内容控制器作为开屏父控制器，同时保留对原容器与内容页手势的暂停和恢复。
- 来源：用户于 2026-07-20 和 2026-07-21 结合 Swift 侧表现及 `UIButtonConfiguration` 管线再次明确确认。OC 新、老工程的右上角跳过 / 倒计时按钮不能先显示矩形再圆角化；按钮创建时先按默认 `36pt` 高度应用 `18pt` 圆角，布局完成后再按真实高度的一半校准。`UIButton` 的背景色与圆角必须调用方言自建封装的按钮专用 API：OC 使用 `jobsResetBtnBgCor` / `jobsResetBtnCornerRadiusValue`，在 iOS 16+ 写入 `UIButtonConfiguration.background`、旧系统回退传统管线；Swift 使用 `UIButton.byConfiguration(...)` 及 `UIBackgroundConfiguration` 的背景 / 圆角 DSL，或等价的更高层 Jobs 统一封装。不能仅使用通用 `UIView.byCornerRadius` / `UIView.byBgColor` 或直接修改 `button.layer`。

## 八、OC AppDoor 页面边界

- 来源：用户于 2026-07-19 结合登录态与注册态截图明确确认。`JobsAppDoorVC_Style2` 是全屏认证页面，不展示系统导航栏或 GK 自定义导航栏，也不保留导航标题和顶部返回按钮。
- AppDoor-2 的 Logo 只服务初始登录卡片；横滑切换到注册或忘记密码卡片时必须隐藏，返回登录态时才恢复。
- 登录态 Logo 使用正方形容器并保持原图等比缩放，禁止横向拉伸；用户名、密码、确认密码、短信验证码和图形验证码的占位文字与真实输入起点统一靠近左侧图标。手机号继续使用独立的国旗 / 区号复合布局，但号码占位文字、光标和真实输入统一使用 `4pt` 内部起点，避免与 `+86` 之间留出过宽空白。
- 注册卡片保持独立卡片横滑结构；提交按钮上移，下面固定放“返回首页”。完整注册表单使用紧凑字号、较小字段间距和按字段数动态计算的容器高度，避免内容被上下边缘挤压。
- 来源：用户于 2026-07-20 结合 AppDoor-1 / AppDoor-2 登录态截图明确确认。AppDoor-1 的“记住我 / 忘记密码”使用与 AppDoor-2 一致的 `12pt` 字号；“去注册 / 返回登录”侧栏统一采用“返回首页”的 `UIFontWeightSemiboldSize(JobsWidth(15))`。iOS 16+ 必须把字体写入 `UIButtonConfiguration`，不能只修改会被配置层覆盖的 `titleLabel.font`。
- 来源：用户于 2026-07-22 结合 AppDoor-1 倒计时截图明确确认。AppDoor-1、AppDoor-2 共用的验证码按钮必须单行完整显示；倒计时阶段使用 `还剩 %ld 秒` 语义的完整本地化格式文案，并在按钮内水平居中，不能只拼接一个本地化的“秒”单位。

## 九、三端 Demo 列表悬浮时间按钮

- 来源：用户于 2026-07-19 明确要求。Swift、OC 新项目和 OC 老项目的 Demo 列表设置页都要提供悬浮时间按钮的显示开关，使长按隐藏后仍可在设置中重新开启。
- 三端共用持久化键 `com.jobs.demoList.showsSuspendTimeButton`，未配置时默认显示；长按确认隐藏后持久化关闭，列表页重新出现时按开关状态刷新。
- 悬浮时间按钮隐藏时同步暂停时间刷新定时器，恢复显示时重启定时器；不影响 Demo 列表其它悬浮按钮。
- 来源：用户于 2026-07-21 结合 OC 新项目截图明确确认。三端长按悬浮时间按钮后的隐藏确认弹窗必须直接展示为普通系统 `UIAlertController`，不得经过页面导航容器或写入页面转场导航元数据，不显示导航栏、标题栏或返回按钮。

## 十、Swift / OC 刷新动画插件边界

- 来源：用户于 2026-07-19 明确要求，并于 2026-07-22 确认 Swift 侧也必须具备同等能力。`JobsOCRefresher` 和 `JobsSwiftRefresher` 只负责刷新状态机、触发距离、视图槽位和状态转译，不得写死单图、多图、GIF、Lottie 或品牌动画的具体渲染逻辑。
- 刷新表现统一由 Swift / OC 两侧的 `JobsFuseAnimation` 承载，并通过语义对齐的动画协议消费下拉进度与刷新阶段；系统菊花、单图、多图定时轮播、GIF、Lottie、今日头条风格和抖音风格均作为同级插件实现。
- 动画既可在配置阶段注入，也必须支持刷新槽位挂载后的运行时原位替换；替换动画不得重建或打断对应的 `JobsOCRefresher` / `JobsSwiftRefresher` 状态机。
- Swift 侧的协议、品牌动画和配置对象收口到 `JobsFuseAnimation`；`JobsSwiftRefresher` 仅保留 `JobsState` 到动画阶段的适配容器及原位替换 API。今日头条和抖音刷新动画必须可在同一已挂载 Header 上运行时互换，不重建刷新状态机。
- 来源：用户于 2026-07-20 用真实录屏纠正。今日头条刷新不是双三角整体旋转或交替呼吸，而是同一条红色闭合轮廓约用 `0.65s` 完成“蝴蝶结 → 左尖三角 → 四边形 → 右尖三角 → 蝴蝶结”的连续形变；后续以录屏轨迹为准，不再按静态截图臆造空间旋转。

## 十一、三端 Label Demo 独立分组

- 来源：用户于 2026-07-20 明确要求。Swift、OC 新项目和 OC 老项目的 Demo 根列表都要为 Label 能力提供独立 `Label` section，不再混入 Timer 或通用 UI section。
- OC 新旧项目统一按 Demo 标题、副标题和控制器类名中的 `Label` 语义归类；Swift 项目在根列表数据源中显式维护 `Label` 分组。后续新增 Label Demo 继续收口到该 section。

## 十二、三端 UI 属性化边界

- 来源：用户于 2026-07-21 以 `optionScrollViewByOptions:` 为例明确确认。创建后进入视图层级、绑定约束 / 事件 / 代理、参与页面生命周期或未来可能重配的 UI / 交互对象，必须保留所属类型可直接取得的引用；Swift 使用类型属性，OC 使用属性 + 懒加载 getter。
- 固定对象使用单一属性，重复动态生成的 UI 使用带元素类型的数组 / 字典属性统一持有。装配方法只编排属性，不把长期 UI 创建为局部变量后丢失引用。
- 该边界同步覆盖 Swift 主工程、OC 新工程和 OC 老工程的 Jobs 自维护代码；排除外援 / 生成代码、系统回调传入的复用对象、Jobs 工厂 / DSL 底层封装临时对象和纯计算临时值。

## 十三、OC 事件 Block DSL 边界

- 来源：用户于 2026-07-21 结合 Swift 侧事件 API 明确要求。OC 按钮默认使用 `onClickBy` / `onClickAppendBy` / `onLongPressGestureBy` / `onLongPressGestureAppendBy`，分别承载点按替换、点按追加、长按替换和长按追加；业务调用保持 Block 化点语法链。
- 非按钮 `UIControl` 事件使用 `onJobsTap` / `onJobsChange` / `onJobsEvent`；生命周期内需要重绑或解绑时使用 `offJobsEvent`，避免重复注册。
- `byAddTarget` 作为 Apple Target-Action 兼容 API 保留，不删除，但不再作为 Jobs 自维护业务代码和 Xcode CodeSnippets 的推荐写法。
- 该规则同步覆盖 OC 新工程、OC 老工程及 `/Users/jobs/Library/Developer/Xcode/UserData/CodeSnippets`；排除手工引入的外部第三方原始码。

## 十四、三端约束布局技术栈

- 来源：用户于 2026-07-21 明确确认。Swift 项目 Jobs 自维护 UI 布局统一使用 SnapKit；OC 新项目和 OC 老项目 Jobs 自维护 UI 布局统一使用 Masonry。
- 覆盖 Swift 主工程、OC 新 / 老项目主工程和三端 Jobs 自建本地 Pods；继续排除 `Pods/`、`JobsByPods/ManualBySwiftPods@Pods/`、`JobsByPods/ManualByOCPods@Pods/`、生成代码和确认的外援第三方源码。
- 项目代码禁止直接创建、激活或管理系统 `NSLayoutConstraint`，也禁止使用 `NSLayoutAnchor` 及 `topAnchor` / `leadingAnchor` / `widthAnchor` 等 Anchor API 生成约束。已有代码在被触碰或按范围整改时，Swift 改为 SnapKit，OC 改为 Masonry，并在同一归属工程反扫同类残留。
- 该约束持续写入并由 `jobs-swift` / `jobs-objective-c-pods` Skills 执行；Jobs DSL 底层也不得把系统约束包装后继续向项目代码提供。

## 十五、三端截屏能力落位边界

- 来源：用户于 2026-07-21 明确确认。截屏提示与敏感区域截屏保护是两个独立 Demo，三端统一由 `JobsScreenCapture` 能力承载。
- Swift 项目与 OC 新项目以本地 Pod 形式接入；OC 老项目不新增 Pod，源码集中放入主工程 `OCBaseConfig/JobsMixFunc/JobsScreenCapture`，Demo、入口和工程引用直接加入既有 target。
- 截屏提示基于系统截屏完成通知，只能在截屏发生后提示；截屏保护用于让指定敏感区域在系统截图中不可见，不表述为禁止物理按键或阻止系统产生截图。截屏保护的最终效果必须在真机上复核。
- 来源：用户于 2026-07-22 进一步确认。截屏提示页和截屏保护页都提供主动截屏触发点；主动截屏渲染当前窗口并按相册 `add-only` 权限保存，拒绝授权或保存失败时必须明确反馈。程序主动截屏不伪造成系统截屏通知，Tips 页把系统截屏与按钮截屏分开计数；保护页用同一触发点对比保护开关前后的相册结果。

## 十六、三端 Excel 与 UILabel 滚动文字边界

- 来源：用户于 2026-07-21 明确确认。Swift 侧通用表格能力命名为 `JobsSwiftExcel`，OC 侧命名为 `JobsOCExcel`；Swift 项目和 OC 新项目以本地 Pod 接入，OC 老项目不新增 Pod，源码集中放入主工程 `OCBaseConfig/JobsMixFunc/JobsOCExcel`，Demo、入口和工程引用直接加入既有 target。
- Excel 的冻结语义与 Office 一致：指定冻结到第 `N` 列时，`0...N` 列共同固定；未指定时不冻结。列宽、表头高和行高保持固定，横向滚动只作用于冻结列右侧的内容区，并允许 Excel 作为 `UITableViewCell` / `UICollectionViewCell` 内的独立组件复用。
- 每个表头格和数据格都支持独立文字策略：缩小字体、单行尾部省略、多行尾部省略、横向滚动；策略由统一的 `JobsLabelTextDisplayMode` 表达，不为四种显示方式派生四套 Cell。
- 滚动文字是 `UILabel` 的附加能力，不再公开 `JobsOCScrollingLabel` / `JobsSwiftScrollingLabel` 子类。源码与 API 统一命名为 `UILabel+Scrolling`：OC 使用 `UILabel (Scrolling)` 分类，Swift 使用 `extension UILabel`；由于 Pod 名不能使用 `+`，对应模块名分别为 `JobsOCUILabelScrolling` 和 `JobsSwiftUILabelScrolling`。
- 来源：用户于 2026-07-22 进一步确认。OC 的 `JobsLabelTextDisplayMode` 统一定义在 `JobsOCDefs` 的系统枚举区域，`JobsOCUILabelScrolling` 只消费该枚举；OC 新项目与 OC 老项目保持同一归属。
- `JobsOCUILabelScrolling` 的关联对象 Key 必须使用 `JobsKey`，读写使用 `Jobs_getAssociatedObject` / `Jobs_setAssociatedRETAIN_NONATOMIC`，不在功能模块内重复手写静态 Key 和 Runtime API。
- OC / Swift 两侧滚动文字实现中的 UILabel 配置都必须走各自 `JobsOCDSL` / `JobsSwiftDSL`。UILabel 文字阴影与 UIView 的 CALayer 阴影语义不同，Swift 侧使用 UILabel 专用 DSL，不借用 UIView 图层阴影接口。

## 十七、三端 `switch` / `case` 分支注释

- 来源：用户于 2026-07-22 明确确认。Swift 主工程、OC 新工程和 OC 老工程中 Jobs 自维护的新增、修改及存量回归代码，只要使用 `switch`，每个 `case` 都必须在使用处写注释，说明对应枚举值、业务语义或处理目的；枚举定义处已有注释不能替代分支注释。
- 用户于 2026-07-22 进一步确认注释形态：分支说明必须独立成行，使用 `///` 放在 `case` 紧邻上方并保持同缩进；禁止 `case ...: // ...` 行尾写法。已有行尾业务说明上移时保留原语义。
- 多个枚举值合并在同一分支时可以使用一条合并语义注释；连续的多个 `case` 标签必须分别写注释，`default` / `@unknown default` 也要说明兜底或未知值处理语义。
- 2026-07-22 存量回填已完成：Swift 侧补 1578 条，涉及 172 个 Jobs 自有文件；OC 新工程补 903 条，涉及 117 个文件；OC 老工程补 616 条，涉及 77 个文件。第三方、他人署名和归属不明文件均未修改。
- 2026-07-22 独立注释形态回归已完成：Swift 侧 1689 个分支 / 185 个文件，OC 新工程 1023 个分支 / 117 个文件，OC 老工程 723 个分支 / 77 个文件，均已收口为紧邻上方的同缩进 `///`；普通行尾分支注释、缺失注释和缩进不一致均为 0。
- 该约束持续写入并由 `jobs-swift` / `jobs-objective-c-pods` Skills 执行。

## 十八、Jobs iOS 三仓 Demo 入口图标映射容错

- 来源：用户于 2026-07-22 先后在 `JobsSwiftExcelDemoVC`、`JobsOCExcelDemoVC` 因缺少入口图标映射触发崩溃后明确确认。新增或重命名 Demo 入口时，必须同步全量对账 Swift `RootFoldTableCell.demoIconSymbolNamesByVCType` 和 OC 新、老工程 `JobsOCRootFoldTableCell.demoIconSymbolNamesByClassName`，保持所有入口显式配置语义贴合且互不重复的图标。
- 图标缺项、重复或系统图标名无效属于展示配置问题，不得使用 `precondition` / `preconditionFailure` / `NSAssert` 中断 App。缺项或无效时使用明确兜底图标并输出一次诊断，重复时输出一次诊断；同时通过入口类型、映射类型和图标值的全量校验提前发现问题。
- 2026-07-22 OC 新、老工程已完成全量对账：两边各有 87 个根入口，入口集合一致；图标表各 88 项（含非根入口 `JobsOCCountryCodeCtrl`），入口缺项、重复图标和当前系统无效图标均为 0。

## 十九、Swift 相机与照片滤镜入口

- 来源：用户于 2026-07-22 明确确认。视觉滤镜是相机 / 相册或录制场景的用户功能，不能只藏在“打马赛克”的 Core Image 实现中；Demo 根列表必须能通过“滤镜”搜索到真实可操作入口。
- 当前实现归入 `PhotoAlbumDemoVC`：相机拍照完成后直接进入照片滤镜工作台，相册图片可点击进入；工作台提供原图、黑白、铬黄、怀旧、鲜艳、漫画、强度调节、结果预览和相册保存。后续若增加实时视频滤镜，继续放在相机 / 录像链路，不另建脱离媒体输入的孤立占位页。

## 二十、OC 主 App 安装显示名

- 来源：用户于 2026-07-22 明确要求。OC 新项目与 OC 老项目安装到设备后的主 App 显示名统一为 `OCDemo`。
- 显示名通过 `APP_DISPLAY_NAME`、`INFOPLIST_KEY_CFBundleDisplayName` 与现有 `InfoPlist.strings` 本地化链路保持一致；不连带修改 `PRODUCT_NAME`、Bundle ID、测试 target 或 Widget 名称。

## 二十一、OC JobsAppDoor Pod 目录边界

- 已被“二十二、Swift / OC JobsAppDoor 产物对齐边界”替代。旧结论只覆盖目录改名和资源归位，遗漏了公共件真实归属与 Swift 侧生成树同步要求，不再作为完整执行依据。

## 二十二、Swift / OC JobsAppDoor 产物对齐边界

- 来源：用户于 2026-07-22 检查实际产物后明确纠正，Swift 与 OC 侧不能只做到目录名称相似，必须对账 Xcode `Development Pods` 的真实生成树。
- 两侧 Pod 根层统一按 `Core / Pod / Resource / Support Files` 展开；OC 额外保留语言所需的 `JobsAppDoor.h`，Swift 可保留本地化 `JobsAppDoor.strings`，这类语言差异不改变公共骨架。
- `Core` 下固定为 `登录注册模块公共件`、`JobsAppDoorStyle1`、`JobsAppDoorStyle2`。`JobsAppDoorResource`、`BaseContentView`、`JobsAppDoorForgotCodeContentView` 被两套 Style 同时使用，必须归入 `Core/登录注册模块公共件`，不得因历史上位于 `Core/JobsAppDoor` 就整体塞进 Style1。
- `Resource` 与 `Core` 平级，统一收纳 `AppDoor.xcassets`、`Images`、`Videos` 和按需存在的本地化目录；输入框预览图片归入 `Resource/Images/登录注册模块公共件`。Swift / OC 资源包统一命名为 `JobsAppDoorResources.bundle`。
- Podspec 调整后必须同时在两边执行 `pod install` 并打印 `Development Pods > JobsAppDoor` 真实树；验收标准是源码不再散落根层、图片和视频不再摊平或重复显示，不能只看磁盘目录或 podspec 文本判断已对齐。

## 二十三、三端开屏内容设置边界

- 来源：用户于 2026-07-22 明确要求。Swift 项目、OC 新项目和 OC 老项目的设置页必须完整展示开屏框架支持的五种内容类型：本地图片、本地 GIF、远程图片、本地视频、远程视频；不能只提供图片 / 视频二选一，也不能继续依赖启动入口里的注释切换。
- 三端内容类型使用持久化键 `com.jobs.splash.contentTypeForNextLaunch`，未配置或值无效时默认本地图片；“下次是否展示开屏”与“下次展示哪种内容”是两个独立设置，互不覆盖。
- 启动入口读取内容类型后再构造带实际资源名或 URL 的 `JobsSplashConfiguration` / `JobsOCSplashConfiguration`。OC 新旧项目复用现有 `1242x2688.png`、`GIF大图.gif` 和 `welcome_video.mp4`；Swift 复用“米老鼠 / 唐老鸭 / 迪斯尼”图片在临时目录生成本地 GIF，并复用 `welcome_video.mp4`，不新增无意义占位素材。

## 二十四、三端远程开屏视频预加载边界

- 来源：用户于 2026-07-23 明确要求。Swift 项目、OC 新项目和 OC 老项目选用远程视频开屏时，只能播放已经完整落盘的远程文件；远程视频尚未缓存或下载失败时，本次开屏立即播放配置的本地视频兜底，不能等待远程请求阻塞开屏展示。
- 远程视频预加载仅允许非蜂窝网络，并在未缓存期间于倒计时按钮左侧显示本地化提示“仅在 Wi-Fi 环境下下载视频”。提示归开屏组件内部布局，Swift 使用 SnapKit，OC 新旧实现使用 Masonry。
- 预加载任务归缓存单例所有，不归 `JobsSplashVC` / `JobsOCSplashVC` 所有。倒计时结束、用户手动跳过、开屏覆盖层移除或控制器释放时，均不得取消远程视频预加载；页面持有的可取消任务只保留给远程图片。
- 下载失败后保留待办 URL 并使用退避间隔持续重试，下载完成前跨启动恢复；即使下次启动关闭开屏展示，也要先唤醒未完成的预加载。只有完整非空文件成功落入缓存后才清除待办，下一次开屏直接播放该缓存。
- 三端配置都要显式传入现有 `welcome_video.mp4` 作为本地兜底。Swift 能力归 `JobsSwiftSplash` 本地 Pod，OC 新项目归 `JobsOCSplash` 本地 Pod，OC 老项目同步维护主工程 `OCBaseConfig/JobsMixFunc/JobsOCSplash` 对应实现。

## 二十五、三端 Demo 子页全局主题入口

- 来源：用户于 2026-07-24 明确要求。Swift 项目、OC 新项目和 OC 老项目从 Demo 根列表进入的每个导航 / 模态子页面，以及按约定命名的独立 Demo 页面，导航栏最右侧必须提供统一的全局主题切换按钮；按钮切换全部已连接 Scene 的 Window，不得只修改当前控制器或单个 Window。
- Swift 由 `JobsByUIKit` 的 `jobsSetupGKNav(...)` / `jobsEnsureNavigationDefaults()` 统一注入，识别 `RootListVC` 导航流及运行时类名以 `DemoVC` 结尾的页面；OC 新项目由 `JobsBaseUI` 公共分类注入，OC 老项目同步维护主工程对应分类，识别 `ViewController_1` 导航流及类名包含 `Demo` 的页面。三端都复用各自主列表已有的持久化主题状态，并保留页面已有右侧业务按钮。
- 专门演示系统导航栏的 `JobsNavigationDemoVC` 仍使用系统导航栏，但主题入口必须写入 `navigationItem`；其余 Demo 子页使用 Jobs/GK 导航栏。
- 各 Demo 不再重复声明月亮 / 太阳主题按钮或局部 `overrideUserInterfaceStyle` 切换。页面原有右侧业务动作继续保留，但图标必须与刷新、打乱、增删、翻页、播放等真实语义对应，避免和主题入口混淆。
- 三端项目 README、OC 本地 Pod README 与导航栏 [**Xcode**](https://developer.apple.com/xcode) CodeSnippets 必须传播自动注入规则，不再复制“取第一个 Window 并局部改主题”的旧示例。

## 二十六、三端双端功能对齐 Demo 颗粒度

- 来源：用户于 2026-07-23 明确要求。Swift 项目、OC 新项目和 OC 老项目中的双端差异功能不能集中到单个 Workbench / 聚合 DemoVC；每项独立功能必须拥有一个独立 DemoVC 页面，并作为独立条目直接接入 Demo 根列表。
- 可以复用只负责公共布局、标题、状态提示和单一主操作装配的页面基座，但基座不得承载二级功能菜单、多个功能按钮、`switch` 分发或跨功能状态机；复用基座不改变“一功能一页面”的入口颗粒度。
- 新增、拆分或重命名对齐 Demo 时，必须同步维护 Swift 根列表与图标映射、OC 新旧工程的 `Demos.h`、根列表和图标映射；非文件系统同步工程还要同步 Xcode 文件引用及 target membership。

## 二十七、OC 双工程 README 与 CodeSnippets 同步工作流

- 来源：用户于 2026-07-24 明确要求。OC 新、老工程是同一组能力的两种管理形态：新工程将相关功能拆为本地 Pod 管理，老工程将相关功能直接集成于主工程管理。
- 每次调整任一 OC 工程中的 Jobs 自维护能力，都必须同步检查并更新两份根 `README.md` 与 `/Users/jobs/Library/Developer/Xcode/UserData/CodeSnippets` 中的相关代码块；覆盖新增、删除、重命名、公开 API、固定写法、Demo、资源、依赖和行为变化。
- 两份根 README 的特色说明、能力矩阵、Demo 代码和使用边界保持一致，唯一固定差异是各自的工程形态说明。每份 README 只描述当前工程自身，不提及或比较另一份工程。
- 同步验收时，以源码、公开头和可运行 Demo 为 API 权威源；工程形态说明归一化后，两份 README 的对应章节必须一致，相关 `.codesnippet` 必须通过 `plutil -lint`。

## 二十八、三端录音与录像快门视觉

- 来源：用户于 2026-07-24 结合 Swift 现状与微信录制界面截图明确要求。Swift、OC 新项目和 OC 老项目的录音、录像 Demo 快门统一采用白色实心内圆、透明间隔和白色外圈，不再使用蓝色或红色实心按钮主体。
- 录制进行中保持内圆和基础外圈为白色；若展示录制时长进度，只允许进度描边使用红色，不把整个快门主体切换为红色。短录音、长录音和视频录制入口遵循同一视觉语义。

## 二十九、三端同质 Demo 表现形式入口

- 来源：用户于 2026-07-24 明确确认。“一项独立功能一个根入口”约束只用于不同业务能力；同一核心能力仅因 `UITableViewCell` / `UICollectionViewCell` 等容器或表现形式不同，不得重复占用多个 Demo 根入口。
- 同质表现形式使用一个语义明确的根入口，并在二级列表中分别进入各自的独立 DemoVC。二级列表只能分发同一能力的表现分支，不能借此恢复跨功能 Workbench 或把多项独立功能重新聚合。
- 当前三端“按钮完全覆盖在 Cell 上”统一由 `JobsButtonCoverCellDemoListVC` 承接根入口，再分别进入 Table / Collection 具体 Demo；新增、重命名或平移同类入口时同步维护三端根列表、图标映射及 OC `Demos.h`。

## 三十、OC 老工程 CocoaPods 项目格式恢复

- 来源：2026-07-24 已在 OC 老工程实测。出现 `Unable to find compatibility version string for object version '76'` 时，失败点在 [**CocoaPods**](https://cocoapods.org/) 生成 Pods 工程阶段，不是依赖解析或下载。
- 工程包含 `PBXFileSystemSynchronizedRootGroup` 时不能盲目降到旧格式；当前 `xcodeproj 1.28.1` 支持 `77` 而不支持 `76`，因此把 `objectVersion` 与 `preferredProjectObjectVersion` 同步为 `77`，保留同步组结构。
- 修复后执行 `pod install --no-repo-update`，并验证主工程与 `Pods.xcodeproj` 根对象均为 `PBXProject`、`xcodebuild -workspace ... -list` 能列出 App 与 Widget Scheme；不能只依据 CocoaPods 最后一行判断成功。

## 三十一、Swift 相册照片与桌面 AppIcon 边界

- 来源：用户于 2026-07-24 明确要求使用相册照片，并已按工程资源结构验证。iOS 公开 API 只能切换安装包内预置并声明的 AppIcon，运行时从相册读取的任意照片不能直接成为桌面图标。
- 相册照片复制功能只负责裁剪、预览和管理 App 内副本；真正的桌面图标必须准备无透明通道的 `1024×1024` 图片，替换 `Resources/AppIcons/*.icon/Assets/Front.png`，保持备用图标名与 `CFBundleAlternateIcons` 一致，再重新编译安装。
- 验证不能停在 `setAlternateIconName` 成功或中间资源产物；要确认备用图标已进入最终 `Assets.car`，并以重新安装后的设备表现为准。

## 三十二、Jobs 导航栏主副标题语义

- 来源：用户于 2026-07-24 明确确认。导航标题包含 `@` 时，`@` 前为主标题、后为副标题；按第一个 `@` 拆分并上下展示，后续 `@` 保留在副标题中。没有 `@` 时继续使用单行标题。
- Swift 侧通过 `jobsSetupGKNav(title:)` 完成基础导航配置，再写入自定义 `gk_navTitleView`；OC 侧复用 `GKCustomNavigationBarExtra gk_navTitleViewBy:` 与 `textModel` / `subTextModel`，不修改第三方 `GKNavigationBar` 源码。
- 双行标题继续复用公共导航层自动注入的主题按钮，保留页面已有业务按钮；页面不得为标题修复重复创建局部主题入口。

## 三十三、Swift / OC Demo 完整对齐与中性分组

- 来源：用户于 2026-07-24 明确纠正。把 OC 能力平移到 Swift 时，不能只做极简单按钮壳；OC 页面的可见结构、交互入口、状态变化和完整能力在 Swift 侧也要达到同等表现，反向对齐同理。
- Demo 根列表按能力语义分组，不保留“OC 对齐”“Swift 来源”等来源语言分组或 Cell 标题；公开类名、标题和副标题使用中性业务命名。
- 本节补充“二十六、三端双端功能对齐 Demo 颗粒度”：前者约束页面完整度与命名，后者约束一功能一入口；两者同时满足，不能用完整聚合页替代独立 Demo，也不能用独立空壳冒充完整对齐。

## 三十四、OC 老工程文件同步组编译清单

- 来源：2026-07-27 已在 OC 老工程完成源码、workspace 构建和模拟器运行复核。当前 `PBXFileSystemSynchronizedRootGroup` 下新增或平移 Jobs 主工程 `.m` 时，只把文件落盘并让公开头可见不足以保证实现进入 App target。
- 在本工程当前项目格式下，必须同步把 `.m` 相对路径加入 `PBXFileSystemSynchronizedBuildFileExceptionSet.membershipExceptions` 的实际编译清单，并重新构建、运行验证；否则调用方可以通过头文件完成编译，但分类实现不会链接，最终以 `unrecognized selector` 崩溃。

## 三十五、Swift / OC 应用层点语法“一镜到底”

- 来源：用户于 2026-07-27 先确认 OC“一链到底”，并于 2026-08-03 结合 Swift `UITableViewCell` 写法明确扩展为 Swift / OC 共用的“一镜到底”。规则覆盖三仓所有支持 Jobs DSL 的 View、Control、Layer、Cell、Model、配置对象、请求对象与业务基础对象；同一配置闭包或连续配置语义中，主接收者只作为链起点出现一次。
- Swift 子对象使用宿主级 `byXxx` / 配置闭包，OC 子对象使用返回主对象的 `byXxxBlock`。`UITableViewCell` 调用端从 Cell 级标题、副标题、图片、`contentView` 和选择状态 API 继续点出，不重新起 `cell.textLabel` / `cell.detailTextLabel` / `cell.imageView` / `cell.contentView`；缺少入口时先修真实归属层并保持返回 `Self`。
- 链序按具体类型到通用类型排列；值类型 mutating、同名异类型 DSL、返回父类和多个 `void` 终止动作必须按真实类型语义处理。查询、控制流、SnapKit / Masonry 构建器和第三方回调保留独立表达。全量审计只进入 Jobs 自维护源码，并以对应 workspace 真实构建验证，不能用强转、重复起链或裸系统 API 掩盖类型错误。

## 三十六、三端设置二级展开与 Demo 列表文字策略

- 来源：用户于 2026-07-27 明确要求。Swift、OC 新项目和 OC 老项目设置页中的“开屏内容”“应用语言”“列表主/副标题”不能平铺全部选项；一级 Cell 展示当前值和展开 / 收起入口，点击后在同一表格中伸缩显示缩进的二级选项，再通过勾选完成设置。
- Demo 根列表二级 Cell 的主标题和副标题统一受同一持久化策略控制，键为 `com.jobs.demoList.cellTextDisplayStrategy`。策略顺序固定为一般裁切、单行省略号、缩小字体、连续跑马灯、左右来回滚动；未设置或值无效时默认连续跑马灯。
- 两级标题使用同一策略但保留各自既有字体与语义颜色。一般模式只裁切、不缩放和不补省略号；两种滚动模式只在文字真实溢出时启动，短文本继续走 UILabel 原生绘制。离屏、折叠和复用时暂停或停止滚动，重新可见时恢复。
- CoreText 滚动绘制前必须按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色；无论是否溢出、使用哪种策略或处于深浅色主题，长文本颜色都要与同层普通短文本 UILabel 一致。

## 三十七、三端 SceneDelegate 多场景边界

- 来源：用户于 2026-07-30 明确要求。Swift、OC 新项目和 OC 老项目都要提供可发现、可操作的独立 SceneDelegate Demo，覆盖新建、激活、关闭 Scene，会话快照、独立状态、状态恢复和 Scene 生命周期日志；不能只写静态说明。
- `AppDelegate` 继续负责进程级能力，`SceneDelegate` 与 `UIWindow` 按窗口会话独立存在。状态以 `UISceneSession.persistentIdentifier` 隔离，恢复与新 Scene 路由使用 `NSUserActivity`；禁止缓存全局 `SceneDelegate`，也禁止通过 `connectedScenes.first` 猜测当前窗口。
- 三端 `Info.plist` 必须声明 `UIApplicationSupportsMultipleScenes = YES`，运行时仍以 `UIApplication.supportsMultipleScenes` 判断环境能力；完整多窗口交互优先在 iPad 环境验证。
- Demo 中暂不支持、当前环境不可用或没有目标 Scene 的动作仍保持可点击，并通过 Toast 解释原因；真正调用系统能力后执行失败才使用 Alert。Swift 反馈必须绑定当前页面的 `view.window`，避免多 Scene 下把提示投递到错误窗口。
- OC 新工程保留主工程 Demo + 现有本地 Pods 基座；OC 老工程继续直接集成主工程，不新增 Pod，并把新增 `.m` 纳入文件同步组的 target 编译清单。

## 三十八、三端 Demo 架构智慧可发现性

- 来源：用户于 2026-07-30 结合时时彩多 Timer Demo 明确要求。Demo 除了真实可见、可操作和能辅助未来开发，还必须让关键架构判断可发现；复杂 Demo 应提供明确入口，以列表或等价结构展示其对象关系、所有权、状态真值、复用保护、竞态防护和生命周期治理，不能只让使用者从实现代码中自行猜测。
- 导航栏右上角继续遵守“有且只有一个入口”。页面存在业务动作时，由三端公共导航层把全局主题切换与页面业务动作统一收进该入口的操作列表，不得并排增加第二个右侧按钮。
- 时时彩 Demo 的统一解释是：一个 Cell 一次绑定一个 Model，每个 Model 以稳定 identifier 对应一个逻辑 Timer；Timer 由 TimerMgr 物理托管，VC 只持有整组 Timer 的 Scope，而不是只持有一个 Timer。`endAt` 是时间真值，`expectedTimer` 负责精准取消，Scope 负责页面级 pause、resume 和释放清理。

## 三十九、OC 朋友圈 Demo 交互边界

- 来源：用户于 2026-08-01 明确要求，并已在 OC 新、老工程同步验证。朋友圈媒体区必须使用可见的真实本地图片和等比填充缩略图，点击图片可进入预览；不能只保留空白容器或用文字代替图片内容。
- 点赞与评论入口统一为图标加文字。点赞后图标切换为红色，长按显示点赞气泡；评论入口进入三种评论模式，默认模式一，评论模式与主题等页面动作统一收进导航栏右上角唯一操作列表，不并排增加多个入口。
- 页面背景、导航栏、主副标题、Cell、正文、次要文字和操作区都使用语义主题色，深浅色切换后可见内容必须整体同步刷新。

## 四十、三端计时器机制与选型文档

- 来源：用户于 2026-08-01 明确要求，并已同步写入 `JobsOCTimer`、`JobsOCTimerMgr`、`JobsSwiftTimer`、`JobsSwiftTimerMgr` README 及 OC / Swift 工程经验文档。三端计时能力按四种系统内核说明和选型：`Timer` / `NSTimer`、`DispatchSourceTimer`、`CADisplayLink`、`CFRunLoopTimer`，不能把管理器或便捷 API 误写成新的计时内核。
- 选型先看调度语义、RunLoop 依赖、刷新节奏、生命周期和后台边界；一次性延迟另行评估 `asyncAfter`、`Task.sleep` / `Clock` 等语义。倒计时仍以目标时间作为时间真值，不能把回调次数当成真实经过时间。
- TimerMgr 的职责是用稳定标识完成去重、查询、精准取消、Scope 生命周期与复用保护；它只治理计时器，不改变底层内核的精度和系统限制。新增计时能力时，源码、四份 README、两侧工程经验文档和相关 CodeSnippets 按底层 API 传播规则一起核对。

## 四十一、OC 公共主题刷新边界

- 来源：用户于 2026-08-01 连续完成 OC 新、老工程主题回归与崩溃修复。主题适配必须覆盖公共导航层的返回图标、返回文字、背景、主副标题，以及侧滑抽屉、左上角功能菜单、当前可见 Cell 和控件；不能只切换根 Window 或页面背景。功能菜单图标按普通、选中、高亮及组合状态使用语义主题色生成。
- 业务页面优先消费公共语义色和公共导航主题管线，不修改第三方导航库源码；页面已有动作与主题入口继续遵守右上角唯一列表入口。
- 主题中心广播绑定时，不能直接枚举可能被回调反向解绑的弱引用 `NSMapTable`。先快照有效键，再逐个执行刷新回调，避免回调期间集合变更触发 `Collection was mutated while being enumerated`；可见页面、抽屉和控件随后按当前主题即时刷新。

## 四十二、OC 0 / 1 入参功能方法 Block 化

- 来源：用户于 2026-08-02 明确要求。范围覆盖 OC 新工程的全部 Jobs 自建 Pod、应用层和 Demo，并覆盖 OC 老工程直接集成在主工程中的对应功能。继续排除 `Pods/`、`ManualByOCPods@Pods/`、`PodsManual/`、生成代码、第三方和所有权不明源码；不能因为目录名含 `+3rd` 就排除 Jobs 自写适配层。批处理需检查前 100 行作者 / 版权，`.m` / `.mm` 存在同名头时联查头文件，冲突或不明即排除。
- Jobs 自定义的 0 / 1 入参普通功能方法统一改为无参 getter 返回 `JobsBlock` typedef，调用形态为 `object.action()` / `object.action(value)`。该迁移只改 API 表达：原方法体、入参 / 返回类型、默认值、提前返回、副作用顺序和异常边界均保持不变。
- 系统生命周期、协议 / delegate / dataSource、属性访问器、Target-Action、通知 selector、KVC / KVO、Runtime / swizzle 和其它固定 ABI 保留原 selector 薄 trampoline，内核收入不冲突的 `jobsXxx` Block 门面。`sharedManager` / `destroySingleton` 固定保留传统入口，Jobs 调用走 `jobsSharedManager()` / `jobsDestroySingleton()`；`AppToolsProtocol` 的 `getViewModel` / `getButtonModel` 因存在不可修改实现而固定保留原 getter，Jobs 自有实现另设 `jobsGetViewModel()` / `jobsGetButtonModel()`，通用协议接收者仍走原 getter；已以 `jobs` 开头但与旧分类冲突的 selector 使用 `...Block` 后缀门面。`dealloc`、`+load`、`+initialize` 与 `init` / `new` / `alloc` / `copy` 方法族不为形式统一而搬入捕获 `self` 的 Block。
- 实例 Block 统一使用 `@jobs_weakify(self)` / `@jobs_strongify(self)`，并以 `__has_include` 双通道导入 `JobsDefines.h`；`JobsBlock` 为避免对 `JobsOCDefs` 形成循环依赖，是保留显式 `__weak` / `__strong` 的唯一底层例外。验收必须包含 API 全量审计、Block typedef 覆盖、旧调用 / 弱引用反扫及 OC 新老 workspace 真实构建。
- 属性 getter、协议 getter、系统 / 跨模块固定 getter 必须保留原 selector 和返回类型，Block 形态收到独立 `jobsXxx` 门面；声明与实现的 ABI 必须一致。固定入口 trampoline 通过定义类解析 IMP，避免继承重写或 `NSObject` / `NSProxy` 分派形成递归。
- Block getter 发送给 nil 对象后继续直接执行 `()` 会触发空 Block 崩溃；对可空 receiver 要先做存在性保护，以保留 OC 原来的 nil-message 语义。`dealloc` 不得调用内部使用 weakify 的 Block 门面，析构路径保留不创建 weak 引用的传统清理方法。
- 最终验收不能停在编译成功：OC 新、老工程都要安装到模拟器并冷启动，检查进程存活和新增 `.ips` 崩溃报告，确认运行时 ABI、Block 调用及生命周期路径均正常。

## 四十三、OC 应用层 Pod 聚合头引入边界

- 来源：用户于 2026-08-06 明确要求。OC 新、老工程应用层和 Demo 只要使用 Pod，不区分 Jobs 自建 Pod 或外源 Pod，都必须在调用文件的同名 `*.h` 中使用 `__has_include` 双通道保护性引入；`*.m` / `*.mm` 不得裸写 Pod 聚合头或内部子头。
- 调用方只引入 Pod 对外承诺的聚合 / 模块入口头，不因当前只用到某个分类、协议或类就直接引入内部子头。例如 `JobsBaseUI/UIViewController+BaseNavigationBar.h` 上提并收成 `JobsBaseUI/JobsBaseUI.h`，`JobsViewPush/JobsViewPush.h` 整体上提到同名头。
- 批量整理顺序固定为“新老应用层全量迁移 → 静态反扫清零 → 两边统一编译 → 集中修复问题 → 复验”；不每修一处就编译一次。继续排除 `Pods/`、`JobsByPods/`、手工第三方、生成代码和非 Jobs 源码。

## 四十四、三端系统类创建与实例 DSL 边界

- 来源：用户于 2026-08-07 以 `NSUserActivity` / `NSDateFormatter` 为例明确确认为重要代码习惯。范围覆盖 Swift 主工程、OC 新工程 Jobs 自建 Pods 与应用层、OC 老工程 Jobs 自维护主工程和全部 Demo；继续排除外部 `Pods/`、`ManualBy*Pods@Pods/`、生成代码、第三方和所有权不明源码。
- 无入参系统类构造必须走“创建对象 + 配置 Block / closure”的 Jobs 创建 DSL，不在调用方保留 `Type.new`、`[Type new]`、`Type.alloc.init`、`[[Type alloc] init...]` 或 Swift 裸 `Type()`。带参构造由真实系统类型提供类级初始化 DSL：OC 使用 `Type.initByXxx(arguments)` Block 点语法，Swift 使用同类型 `Type.make(arguments, configure:)` 工厂；系统初始化器只允许留在对应底层实现。
- 实例创建后，当前类型自己的属性、0 入参实例方法和 1 入参实例方法全部进入 `JobsOCDSL` / `JobsSwiftDSL`，分别以 `byProperty(value)`、`byAction()`、`byAction(value)` 表达。除查询和明确终止动作外必须返回当前具体类型继续一镜到底；缺入口时先补真实所有者 DSL，再改调用方。
- `[super init...]` / `[self init...]`、Swift `super.init(...)` / `self.init(...)`、初始化方法实现本身、系统固定生命周期、系统回调已交付实例及 Jobs 工厂底层属于明确边界。全量整改先做所有权过滤和构造 / 实例审计，再补公共入口、应用调用、README / 工程文档和 CodeSnippets，并以三端真实构建验证。

## 四十五、OC 新项目 `*.m` 双引号 import 排版

- 来源：用户于 2026-08-12 明确要求。OC 新项目 Jobs 自己维护的 `*.m` 文件中，每条 `#import "xxx.h"` 必须独占一行；行尾说明移到独立注释行，不与 import 共行。
- 相邻的双引号 `#import` 之间不得保留空行，必须紧挨排列。文件头注释与第一条 import 之间、最后一条 import 与正文之间仍各保留一个空行。
- 全量整理必须复用 `jobs_oc_ownership.rb` 过滤所有权，继续排除 `Pods/`、`ManualByOCPods@Pods/`、生成目录、第三方和所有权不明源码；使用 `normalize_oc_m_quoted_import_layout.rb` 先干跑、再 `--apply`，应用后二次干跑必须为零变更。

## 四十六、OC 新旧工程唯一差异与默认双向同步

- 来源：用户于 2026-08-12 明确确认。OC 新工程与 OC 老工程的唯一架构差异是能力承载形态：新工程把 Jobs 自维护功能下沉到本地 Pod 集中管理，老工程把同一功能直接集成在主工程；两边不是不同产品，也不允许形成不同功能标准。
- 用户只点名任一 OC 工程时，同一任务默认必须定位并同步另一工程的对应实现，即使用户忘记补充另一工程。同步范围包括 Jobs 自维护源码、公开 API、Demo、资源、行为、入口、README、工程文档和必要的工程引用。
- 允许差异仅限集成形态：新工程使用 `JobsByPods/Pod名@Pods`、podspec、Podfile 和 Development Pods 装配；老工程使用主工程源码 / 资源目录、Xcode 文件引用、Build Phases 与 target membership。没有形态差异的对应文件应逐字一致；有形态差异的内容在归一化路径、模块化 import、聚合入口和工程引用后必须语义一致。
- 不把新工程 Pod 目录或 podspec 原样复制进老工程。一侧确实不适用时，只有第三方所有权、生成代码或语言边界等明确理由可以判定“无需修改”，并必须在交付中说明，不能静默漏掉另一侧。

## 四十七、自建 Pod 的中文架构说明

- 来源：用户于 2026-08-31 明确确认并要求执行；状态：confirmed；创建与更新：2026-08-31。
- 适用范围：OC 新项目 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods/JobsByPods` 与 Swift 项目 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods` 中的自建 Pod README。
- 每个库独立增加“架构脉络与关键设计”章节，用中文说明职责分层、主要运行关系、值得关注的实现细节与边界、阅读和重建顺序。目标同时服务人类快速理解和不同能力 AI 按框架重建，不追求逐行复刻或反复试生成打磨文档。
- 保留已有 README 的正文、章节顺序、示例与使用说明；已有流程图移入新章节，原位置保留跳转，避免重复放图。复杂关系按需补图，简单扩展保持精简。
- 说明以当前自维护源码为依据，明确区分已实现能力、兼容桥接、占位与第三方边界，不能仅凭库名或旧功能清单推断实现。文档单独携带时应能读懂框架，源码路径仅作为定位线索。
- 这类说明不保证与原实现完全等价，也不代替接收环境的数据与软件准入规则。当前文档任务只覆盖用户点名的两个 JobsByPods，不扩展修改 OC 老工程或源码。

## 四十八、Markdown 构建脚本的 UTF-8 路径边界

- 来源：2026-09-13 已在 Swift 与 OC 新工程的 Xcode 非交互构建环境中复现并验证；状态：confirmed。
- `JobsSwiftMarkdown` 与 `JobsOCMarkdown` 的 `JobsMarkdownPackager.rb` 不能依赖终端 `LANG` / `LC_ALL`。Xcode Build Phase 可能以 `US-ASCII` / `ASCII-8BIT` 标记中文文件系统路径，最终在清单 JSON 生成时触发 `incompatible character encodings: ASCII-8BIT and UTF-8`，外层仅表现为 `Command PhaseScriptExecution failed with a nonzero exit code`。
- 打包器必须在项目根路径、构建输出路径、扫描结果、相对路径和项目名进入业务逻辑前主动规范为有效 UTF-8，并用 UTF-8 模式写入 `manifest.json`；无效字节要明确报错，不能静默吞掉。
- 回归至少包含 `env -i PATH='/usr/bin:/bin:/usr/sbin:/sbin'` 下的打包器测试，以及对应 workspace 的模拟器构建；涉及真机失败时继续执行真实设备构建，不能只在带 UTF-8 locale 的终端环境验证。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
