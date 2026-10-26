---
type: project-memory
status: active
scope: jobs-ios-repos
repositories:
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftUIBaseConfigDemo
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo
  - /Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods
  - /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo
  - /Users/jobs/Desktop/JobsLanguageLearning
  - /Users/jobs/Desktop/JobsMosaicLab
created: 2026-07-15
updated: 2026-10-26
tags:
  - codex-memory
  - project
  - swift
  - objective-c
---

# Jobs iOS 仓库族

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、仓库映射](#jobs-toc-heading-2)
- [二、项目关系](#jobs-toc-heading-3)
- [三、格式化约束](#jobs-toc-heading-4)
- [四、Swift 主工程交互边界](#jobs-toc-heading-5)
- [五、三端控制器销毁提示](#jobs-toc-heading-6)
- [六、Swift 传感器 Demo 表达边界](#jobs-toc-heading-7)
- [七、OC 开屏退出边界](#jobs-toc-heading-8)
- [八、OC AppDoor 页面边界](#jobs-toc-heading-9)
- [九、三端 Demo 列表悬浮时间按钮](#jobs-toc-heading-10)
- [十、Swift / OC 刷新动画插件边界](#jobs-toc-heading-11)
- [十一、三端 Label Demo 独立分组](#jobs-toc-heading-12)
- [十二、三端 UI 属性化边界](#jobs-toc-heading-13)
- [十三、OC 事件 Block DSL 边界](#jobs-toc-heading-14)
- [十四、三端约束布局技术栈](#jobs-toc-heading-15)
- [十五、三端截屏能力落位边界](#jobs-toc-heading-16)
- [十六、三端 Excel 与 UILabel 滚动文字边界](#jobs-toc-heading-17)
- [十七、三端 switch / case 分支注释](#jobs-toc-heading-18)
- [十八、Jobs iOS 三仓 Demo 入口图标映射容错](#jobs-toc-heading-19)
- [十九、Swift 相机与照片滤镜入口](#jobs-toc-heading-20)
- [二十、OC 主 App 安装显示名](#jobs-toc-heading-21)
- [二十一、OC JobsAppDoor Pod 目录边界](#jobs-toc-heading-22)
- [二十二、Swift / OC JobsAppDoor 产物对齐边界](#jobs-toc-heading-23)
- [二十三、三端开屏内容设置边界](#jobs-toc-heading-24)
- [二十四、三端远程开屏视频预加载边界](#jobs-toc-heading-25)
- [二十五、三端 Demo 子页全局主题入口](#jobs-toc-heading-26)
- [二十六、三端双端功能对齐 Demo 颗粒度](#jobs-toc-heading-27)
- [二十七、OC 双工程 README 与 CodeSnippets 同步工作流](#jobs-toc-heading-28)
- [二十八、三端录音与录像快门视觉](#jobs-toc-heading-29)
- [二十九、三端同质 Demo 表现形式入口](#jobs-toc-heading-30)
- [三十、OC 老工程 CocoaPods 项目格式恢复](#jobs-toc-heading-31)
- [三十一、Swift 相册照片与桌面 AppIcon 边界](#jobs-toc-heading-32)
- [三十二、Jobs 导航栏主副标题语义](#jobs-toc-heading-33)
- [三十三、Swift / OC Demo 完整对齐与中性分组](#jobs-toc-heading-34)
- [三十四、OC 老工程文件同步组编译清单](#jobs-toc-heading-35)
- [三十五、Swift / OC 应用层点语法“一镜到底”](#jobs-toc-heading-36)
- [三十六、三端设置二级展开与 Demo 列表文字策略](#jobs-toc-heading-37)
- [三十七、三端 SceneDelegate 多场景边界](#jobs-toc-heading-38)
- [三十八、三端 Demo 架构智慧可发现性](#jobs-toc-heading-39)
- [三十九、OC 朋友圈 Demo 交互边界](#jobs-toc-heading-40)
- [四十、三端计时器机制与选型文档](#jobs-toc-heading-41)
- [四十一、OC 公共主题刷新边界](#jobs-toc-heading-42)
- [四十二、OC 0 / 1 入参功能方法 Block 化](#jobs-toc-heading-43)
- [四十三、OC 应用层 Pod 聚合头引入边界](#jobs-toc-heading-44)
- [四十四、三端系统类创建与实例 DSL 边界](#jobs-toc-heading-45)
- [四十五、OC 新项目 \*.m 双引号 import 排版](#jobs-toc-heading-46)
- [四十六、OC 新旧工程唯一差异与默认双向同步](#jobs-toc-heading-47)
- [四十七、自建 Pod 的中文架构说明](#jobs-toc-heading-48)
- [四十八、Markdown 构建脚本的 UTF-8 路径边界](#jobs-toc-heading-49)
- [四十九、五端 iOS 一次性构建产物](#jobs-toc-heading-50)
- [五十、语言学习 Demo 分类与迁移顺序](#jobs-toc-heading-51)
- [五十一、安装与构建挂载脚本的 README 归属](#jobs-toc-heading-52)
- [五十二、OC 新旧工程的 Git 仓库关系](#jobs-toc-heading-53)
- [五十三、四端 Debug 调试面板](#jobs-toc-heading-54)
- [五十四、OC / Swift 自建 Pods 所有权与演进目标](#jobs-toc-heading-55)
- [五十五、ScriptsByDevTools 的 command 包结构](#jobs-toc-heading-56)
- [五十六、OC 新工程的 GitHub 完整历史与 Gitee 零点快照](#jobs-toc-heading-57)
- [五十七、马赛克实验室 App 与后续双语言 Pod 规划](#jobs-toc-heading-58)
- [五十八、Pod Install 的 FVM 安装来源回退](#jobs-toc-heading-59)
- [五十九、Swift 与 OC 空壳清理](#jobs-toc-heading-60)
- [六十、CocoaPods 公共源网络测试模块](#jobs-toc-heading-61)
- [六十一、GitHub Actions 模拟器验收边界](#jobs-toc-heading-62)
- [六十二、三工程微应用教学 Demo](#microapp-learning-demos)
- [六十三、四工程挂载脚本的交互完整性](#jobs-toc-heading-64)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> Swift 与 Objective-C 新旧仓库的固定映射与共享处理边界。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、仓库映射 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- Swift 侧：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`。
- OC 新项目：`/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`。
- OC 老项目：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo`。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、项目关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- OC 新项目由老项目升级而来，把主工程中的部分能力拆分为本地 Pods，大多数能在老项目主工程中找到来源或对应功能。
- 从 OC 新项目平移能力到老项目时，不照搬本地 Pod 形态，不新增 Pod 依赖；应把源码、资源、Demo 入口和工程引用平移到老项目主工程既有目录与 target。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、格式化约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 执行范围和验证见 [[30-工作流决策/工作流决策#四、Jobs Swift / Objective-C 仓库族格式清理|仓库族格式清理决策]]。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、Swift 主工程交互边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-17 明确确认，且已由 Swift 主工程源码复核。演武堂根页面 `RootListVC` 是半屏抽屉边缘右滑的唯一打开入口；当页面被 push、present 或切换至其它 Tab 时，必须拒绝打开手势，但不影响已打开抽屉的关闭手势。通过 `JobsSideDrawerConfiguration.shouldBeginOpeningGesture` 注入页面判定，避免调用方散落特判。
- 来源：用户于 2026-07-17 提出开屏期间不得穿透触发抽屉，且已由本地 Pod 源码复核。`JobsSwiftSplash` 展示期间必须保存并暂停宿主根视图的既有手势；开屏结束或释放时恢复各手势原有启用状态。交互隔离由开屏组件负责，不让业务层或抽屉组件耦合该规则。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、三端控制器销毁提示 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-19 明确要求，并已在 Swift、OC 新项目和 OC 老项目完成源码复核。三个项目的设置页都要提供控制器销毁提示开关，并保持同一交互文案与默认行为。
- 开关使用持久化键 `com.jobs.debug.showsControllerDeinitTips`，未配置时默认开启；判断必须在实际销毁回调发生时读取，使已经创建的控制器也能立即响应设置变化。
- 关闭开关只隐藏 `deinit` / `dealloc` 的 Toast，包括专用内存释放检查页的“检查者出栈”；通知移除、调试日志、retain count 检查和其它清理逻辑继续执行。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、Swift 传感器 Demo 表达边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-19 针对 CoreMotion 陀螺仪页面明确确认。传感器 Demo 不能只展示三轴原始坐标；应把用户的持机、手腕和身体动作翻译成可见、可读或可触的实时反馈，保留原始数据作为辅助信息，让 Demo 体现人的参与感和能力语义。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、OC 开屏退出边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 已替代：本节早先关于“隐藏系统返回键”和“按导航栈退出”的记录不符合实际架构，不再作为实现依据。
- 来源：用户于 2026-07-19 结合 Swift 侧实现明确纠正。开屏页是直接覆盖在宿主页面上的子控制器，不创建导航栏或返回键，也不存在“隐藏返回键”的说法。
- 倒计时按钮在运行期间必须保持可点击；用户点击右上角按钮或倒计时自然结束时，都执行同一 `finish` 路径并移除开屏子控制器覆盖层。
- OC 全局导航默认 UI 只能对 `navigationController.viewControllers` 中的真实入栈成员生效；不能仅凭子控制器继承得到的 `navigationController` 属性判定。否则会给开屏覆盖层错误创建 GK 导航栏，产生本不存在的返回键和标题。
- `JobsOCSplashPresenter` 不能直接对 `UINavigationController` 调用 `addChildViewController:`，该容器会把子控制器纳入 `viewControllers`。传入系统容器时必须递归取当前可见内容控制器作为开屏父控制器，同时保留对原容器与内容页手势的暂停和恢复。
- 来源：用户于 2026-07-20 和 2026-07-21 结合 Swift 侧表现及 `UIButtonConfiguration` 管线再次明确确认。OC 新、老工程的右上角跳过 / 倒计时按钮不能先显示矩形再圆角化；按钮创建时先按默认 `36pt` 高度应用 `18pt` 圆角，布局完成后再按真实高度的一半校准。`UIButton` 的背景色与圆角必须调用方言自建封装的按钮专用 API：OC 使用 `jobsResetBtnBgCor` / `jobsResetBtnCornerRadiusValue`，在 iOS 16+ 写入 `UIButtonConfiguration.background`、旧系统回退传统管线；Swift 使用 `UIButton.byConfiguration(...)` 及 `UIBackgroundConfiguration` 的背景 / 圆角 DSL，或等价的更高层 Jobs 统一封装。不能仅使用通用 `UIView.byCornerRadius` / `UIView.byBgColor` 或直接修改 `button.layer`。

## <span id="jobs-toc-heading-9" data-jobs-toc="v2">八、OC AppDoor 页面边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-19 结合登录态与注册态截图明确确认。`JobsAppDoorVC_Style2` 是全屏认证页面，不展示系统导航栏或 GK 自定义导航栏，也不保留导航标题和顶部返回按钮。
- AppDoor-2 的 Logo 只服务初始登录卡片；横滑切换到注册或忘记密码卡片时必须隐藏，返回登录态时才恢复。
- 登录态 Logo 使用正方形容器并保持原图等比缩放，禁止横向拉伸；用户名、密码、确认密码、短信验证码和图形验证码的占位文字与真实输入起点统一靠近左侧图标。手机号继续使用独立的国旗 / 区号复合布局，但号码占位文字、光标和真实输入统一使用 `4pt` 内部起点，避免与 `+86` 之间留出过宽空白。
- 注册卡片保持独立卡片横滑结构；提交按钮上移，下面固定放“返回首页”。完整注册表单使用紧凑字号、较小字段间距和按字段数动态计算的容器高度，避免内容被上下边缘挤压。
- 来源：用户于 2026-07-20 结合 AppDoor-1 / AppDoor-2 登录态截图明确确认。AppDoor-1 的“记住我 / 忘记密码”使用与 AppDoor-2 一致的 `12pt` 字号；“去注册 / 返回登录”侧栏统一采用“返回首页”的 `UIFontWeightSemiboldSize(JobsWidth(15))`。iOS 16+ 必须把字体写入 `UIButtonConfiguration`，不能只修改会被配置层覆盖的 `titleLabel.font`。
- 来源：用户于 2026-07-22 结合 AppDoor-1 倒计时截图明确确认。AppDoor-1、AppDoor-2 共用的验证码按钮必须单行完整显示；倒计时阶段使用 `还剩 %ld 秒` 语义的完整本地化格式文案，并在按钮内水平居中，不能只拼接一个本地化的“秒”单位。

## <span id="jobs-toc-heading-10" data-jobs-toc="v2">九、三端 Demo 列表悬浮时间按钮 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-19 明确要求。Swift、OC 新项目和 OC 老项目的 Demo 列表设置页都要提供悬浮时间按钮的显示开关，使长按隐藏后仍可在设置中重新开启。
- 三端共用持久化键 `com.jobs.demoList.showsSuspendTimeButton`，未配置时默认显示；长按确认隐藏后持久化关闭，列表页重新出现时按开关状态刷新。
- 悬浮时间按钮隐藏时同步暂停时间刷新定时器，恢复显示时重启定时器；不影响 Demo 列表其它悬浮按钮。
- 来源：用户于 2026-07-21 结合 OC 新项目截图明确确认。三端长按悬浮时间按钮后的隐藏确认弹窗必须直接展示为普通系统 `UIAlertController`，不得经过页面导航容器或写入页面转场导航元数据，不显示导航栏、标题栏或返回按钮。

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">十、Swift / OC 刷新动画插件边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-19 明确要求，并于 2026-07-22 确认 Swift 侧也必须具备同等能力。`JobsOCRefresher` 和 `JobsSwiftRefresher` 只负责刷新状态机、触发距离、视图槽位和状态转译，不得写死单图、多图、GIF、Lottie 或品牌动画的具体渲染逻辑。
- 刷新表现统一由 Swift / OC 两侧的 `JobsFuseAnimation` 承载，并通过语义对齐的动画协议消费下拉进度与刷新阶段；系统菊花、单图、多图定时轮播、GIF、Lottie、今日头条风格和抖音风格均作为同级插件实现。
- 动画既可在配置阶段注入，也必须支持刷新槽位挂载后的运行时原位替换；替换动画不得重建或打断对应的 `JobsOCRefresher` / `JobsSwiftRefresher` 状态机。
- Swift 侧的协议、品牌动画和配置对象收口到 `JobsFuseAnimation`；`JobsSwiftRefresher` 仅保留 `JobsState` 到动画阶段的适配容器及原位替换 API。今日头条和抖音刷新动画必须可在同一已挂载 Header 上运行时互换，不重建刷新状态机。
- 来源：用户于 2026-07-20 用真实录屏纠正。今日头条刷新不是双三角整体旋转或交替呼吸，而是同一条红色闭合轮廓约用 `0.65s` 完成“蝴蝶结 → 左尖三角 → 四边形 → 右尖三角 → 蝴蝶结”的连续形变；后续以录屏轨迹为准，不再按静态截图臆造空间旋转。

## <span id="jobs-toc-heading-12" data-jobs-toc="v2">十一、三端 Label Demo 独立分组 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-20 明确要求。Swift、OC 新项目和 OC 老项目的 Demo 根列表都要为 Label 能力提供独立 `Label` section，不再混入 Timer 或通用 UI section。
- OC 新旧项目统一按 Demo 标题、副标题和控制器类名中的 `Label` 语义归类；Swift 项目在根列表数据源中显式维护 `Label` 分组。后续新增 Label Demo 继续收口到该 section。

## <span id="jobs-toc-heading-13" data-jobs-toc="v2">十二、三端 UI 属性化边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-21 以 `optionScrollViewByOptions:` 为例明确确认。创建后进入视图层级、绑定约束 / 事件 / 代理、参与页面生命周期或未来可能重配的 UI / 交互对象，必须保留所属类型可直接取得的引用；Swift 使用类型属性，OC 使用属性 + 懒加载 getter。
- 固定对象使用单一属性，重复动态生成的 UI 使用带元素类型的数组 / 字典属性统一持有。装配方法只编排属性，不把长期 UI 创建为局部变量后丢失引用。
- 该边界同步覆盖 Swift 主工程、OC 新工程和 OC 老工程的 Jobs 自维护代码；排除外援 / 生成代码、系统回调传入的复用对象、Jobs 工厂 / DSL 底层封装临时对象和纯计算临时值。

## <span id="jobs-toc-heading-14" data-jobs-toc="v2">十三、OC 事件 Block DSL 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-21 结合 Swift 侧事件 API 明确要求。OC 按钮默认使用 `onClickBy` / `onClickAppendBy` / `onLongPressGestureBy` / `onLongPressGestureAppendBy`，分别承载点按替换、点按追加、长按替换和长按追加；业务调用保持 Block 化点语法链。
- 非按钮 `UIControl` 事件使用 `onJobsTap` / `onJobsChange` / `onJobsEvent`；生命周期内需要重绑或解绑时使用 `offJobsEvent`，避免重复注册。
- `byAddTarget` 作为 Apple Target-Action 兼容 API 保留，不删除，但不再作为 Jobs 自维护业务代码和 Xcode CodeSnippets 的推荐写法。
- 该规则同步覆盖 OC 新工程、OC 老工程及 `/Users/jobs/Library/Developer/Xcode/UserData/CodeSnippets`；排除手工引入的外部第三方原始码。

## <span id="jobs-toc-heading-15" data-jobs-toc="v2">十四、三端约束布局技术栈 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-21 明确确认。Swift 项目 Jobs 自维护 UI 布局统一使用 SnapKit；OC 新项目和 OC 老项目 Jobs 自维护 UI 布局统一使用 Masonry。
- 覆盖 Swift 主工程、OC 新 / 老项目主工程和三端 Jobs 自建本地 Pods；继续排除 `Pods/`、`JobsByPods/ManualBySwiftPods@Pods/`、`JobsByPods/ManualByOCPods@Pods/`、生成代码和确认的外援第三方源码。
- 项目代码禁止直接创建、激活或管理系统 `NSLayoutConstraint`，也禁止使用 `NSLayoutAnchor` 及 `topAnchor` / `leadingAnchor` / `widthAnchor` 等 Anchor API 生成约束。已有代码在被触碰或按范围整改时，Swift 改为 SnapKit，OC 改为 Masonry，并在同一归属工程反扫同类残留。
- 该约束持续写入并由 `jobs-swift` / `jobs-objective-c-pods` Skills 执行；Jobs DSL 底层也不得把系统约束包装后继续向项目代码提供。

## <span id="jobs-toc-heading-16" data-jobs-toc="v2">十五、三端截屏能力落位边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-21 明确确认。截屏提示与敏感区域截屏保护是两个独立 Demo，三端统一由 `JobsScreenCapture` 能力承载。
- Swift 项目与 OC 新项目以本地 Pod 形式接入；OC 老项目不新增 Pod，源码集中放入主工程 `OCBaseConfig/JobsMixFunc/JobsScreenCapture`，Demo、入口和工程引用直接加入既有 target。
- 截屏提示基于系统截屏完成通知，只能在截屏发生后提示；截屏保护用于让指定敏感区域在系统截图中不可见，不表述为禁止物理按键或阻止系统产生截图。截屏保护的最终效果必须在真机上复核。
- 来源：用户于 2026-07-22 进一步确认。截屏提示页和截屏保护页都提供主动截屏触发点；主动截屏渲染当前窗口并按相册 `add-only` 权限保存，拒绝授权或保存失败时必须明确反馈。程序主动截屏不伪造成系统截屏通知，Tips 页把系统截屏与按钮截屏分开计数；保护页用同一触发点对比保护开关前后的相册结果。

## <span id="jobs-toc-heading-17" data-jobs-toc="v2">十六、三端 Excel 与 UILabel 滚动文字边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-21 明确确认。Swift 侧通用表格能力命名为 `JobsSwiftExcel`，OC 侧命名为 `JobsOCExcel`；Swift 项目和 OC 新项目以本地 Pod 接入，OC 老项目不新增 Pod，源码集中放入主工程 `OCBaseConfig/JobsMixFunc/JobsOCExcel`，Demo、入口和工程引用直接加入既有 target。
- Excel 的冻结语义与 Office 一致：指定冻结到第 `N` 列时，`0...N` 列共同固定；未指定时不冻结。列宽、表头高和行高保持固定，横向滚动只作用于冻结列右侧的内容区，并允许 Excel 作为 `UITableViewCell` / `UICollectionViewCell` 内的独立组件复用。
- 每个表头格和数据格都支持独立文字策略：缩小字体、单行尾部省略、多行尾部省略、横向滚动；策略由统一的 `JobsLabelTextDisplayMode` 表达，不为四种显示方式派生四套 Cell。
- 滚动文字是 `UILabel` 的附加能力，不再公开 `JobsOCScrollingLabel` / `JobsSwiftScrollingLabel` 子类。源码与 API 统一命名为 `UILabel+Scrolling`：OC 使用 `UILabel (Scrolling)` 分类，Swift 使用 `extension UILabel`；由于 Pod 名不能使用 `+`，对应模块名分别为 `JobsOCUILabelScrolling` 和 `JobsSwiftUILabelScrolling`。
- 来源：用户于 2026-07-22 进一步确认。OC 的 `JobsLabelTextDisplayMode` 统一定义在 `JobsOCDefs` 的系统枚举区域，`JobsOCUILabelScrolling` 只消费该枚举；OC 新项目与 OC 老项目保持同一归属。
- `JobsOCUILabelScrolling` 的关联对象 Key 必须使用 `JobsKey`，读写使用 `Jobs_getAssociatedObject` / `Jobs_setAssociatedRETAIN_NONATOMIC`，不在功能模块内重复手写静态 Key 和 Runtime API。
- OC / Swift 两侧滚动文字实现中的 UILabel 配置都必须走各自 `JobsOCDSL` / `JobsSwiftDSL`。UILabel 文字阴影与 UIView 的 CALayer 阴影语义不同，Swift 侧使用 UILabel 专用 DSL，不借用 UIView 图层阴影接口。

## <span id="jobs-toc-heading-18" data-jobs-toc="v2">十七、三端 `switch` / `case` 分支注释 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 明确确认。Swift 主工程、OC 新工程和 OC 老工程中 Jobs 自维护的新增、修改及存量回归代码，只要使用 `switch`，每个 `case` 都必须在使用处写注释，说明对应枚举值、业务语义或处理目的；枚举定义处已有注释不能替代分支注释。
- 用户于 2026-07-22 进一步确认注释形态：分支说明必须独立成行，使用 `///` 放在 `case` 紧邻上方并保持同缩进；禁止 `case ...: // ...` 行尾写法。已有行尾业务说明上移时保留原语义。
- 多个枚举值合并在同一分支时可以使用一条合并语义注释；连续的多个 `case` 标签必须分别写注释，`default` / `@unknown default` 也要说明兜底或未知值处理语义。
- 2026-07-22 存量回填已完成：Swift 侧补 1578 条，涉及 172 个 Jobs 自有文件；OC 新工程补 903 条，涉及 117 个文件；OC 老工程补 616 条，涉及 77 个文件。第三方、他人署名和归属不明文件均未修改。
- 2026-07-22 独立注释形态回归已完成：Swift 侧 1689 个分支 / 185 个文件，OC 新工程 1023 个分支 / 117 个文件，OC 老工程 723 个分支 / 77 个文件，均已收口为紧邻上方的同缩进 `///`；普通行尾分支注释、缺失注释和缩进不一致均为 0。
- 该约束持续写入并由 `jobs-swift` / `jobs-objective-c-pods` Skills 执行。

## <span id="jobs-toc-heading-19" data-jobs-toc="v2">十八、Jobs iOS 三仓 Demo 入口图标映射容错 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 先后在 `JobsSwiftExcelDemoVC`、`JobsOCExcelDemoVC` 因缺少入口图标映射触发崩溃后明确确认。新增或重命名 Demo 入口时，必须同步全量对账 Swift `RootFoldTableCell.demoIconSymbolNamesByVCType` 和 OC 新、老工程 `JobsOCRootFoldTableCell.demoIconSymbolNamesByClassName`，保持所有入口显式配置语义贴合且互不重复的图标。
- 图标缺项、重复或系统图标名无效属于展示配置问题，不得使用 `precondition` / `preconditionFailure` / `NSAssert` 中断 App。缺项或无效时使用明确兜底图标并输出一次诊断，重复时输出一次诊断；同时通过入口类型、映射类型和图标值的全量校验提前发现问题。
- 2026-07-22 OC 新、老工程已完成全量对账：两边各有 87 个根入口，入口集合一致；图标表各 88 项（含非根入口 `JobsOCCountryCodeCtrl`），入口缺项、重复图标和当前系统无效图标均为 0。

## <span id="jobs-toc-heading-20" data-jobs-toc="v2">十九、Swift 相机与照片滤镜入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 明确确认。视觉滤镜是相机 / 相册或录制场景的用户功能，不能只藏在“打马赛克”的 Core Image 实现中；Demo 根列表必须能通过“滤镜”搜索到真实可操作入口。
- 当前实现归入 `PhotoAlbumDemoVC`：相机拍照完成后直接进入照片滤镜工作台，相册图片可点击进入；工作台提供原图、黑白、铬黄、怀旧、鲜艳、漫画、强度调节、结果预览和相册保存。后续若增加实时视频滤镜，继续放在相机 / 录像链路，不另建脱离媒体输入的孤立占位页。

## <span id="jobs-toc-heading-21" data-jobs-toc="v2">二十、OC 主 App 安装显示名 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 明确要求。OC 新项目与 OC 老项目安装到设备后的主 App 显示名统一为 `OCDemo`。
- 显示名通过 `APP_DISPLAY_NAME`、`INFOPLIST_KEY_CFBundleDisplayName` 与现有 `InfoPlist.strings` 本地化链路保持一致；不连带修改 `PRODUCT_NAME`、Bundle ID、测试 target 或 Widget 名称。

## <span id="jobs-toc-heading-22" data-jobs-toc="v2">二十一、OC JobsAppDoor Pod 目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 已被“二十二、Swift / OC JobsAppDoor 产物对齐边界”替代。旧结论只覆盖目录改名和资源归位，遗漏了公共件真实归属与 Swift 侧生成树同步要求，不再作为完整执行依据。

## <span id="jobs-toc-heading-23" data-jobs-toc="v2">二十二、Swift / OC JobsAppDoor 产物对齐边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 检查实际产物后明确纠正，Swift 与 OC 侧不能只做到目录名称相似，必须对账 Xcode `Development Pods` 的真实生成树。
- 两侧 Pod 根层统一按 `Core / Pod / Resource / Support Files` 展开；OC 额外保留语言所需的 `JobsAppDoor.h`，Swift 可保留本地化 `JobsAppDoor.strings`，这类语言差异不改变公共骨架。
- `Core` 下固定为 `登录注册模块公共件`、`JobsAppDoorStyle1`、`JobsAppDoorStyle2`。`JobsAppDoorResource`、`BaseContentView`、`JobsAppDoorForgotCodeContentView` 被两套 Style 同时使用，必须归入 `Core/登录注册模块公共件`，不得因历史上位于 `Core/JobsAppDoor` 就整体塞进 Style1。
- `Resource` 与 `Core` 平级，统一收纳 `AppDoor.xcassets`、`Images`、`Videos` 和按需存在的本地化目录；输入框预览图片归入 `Resource/Images/登录注册模块公共件`。Swift / OC 资源包统一命名为 `JobsAppDoorResources.bundle`。
- Podspec 调整后必须同时在两边执行 `pod install` 并打印 `Development Pods > JobsAppDoor` 真实树；验收标准是源码不再散落根层、图片和视频不再摊平或重复显示，不能只看磁盘目录或 podspec 文本判断已对齐。

## <span id="jobs-toc-heading-24" data-jobs-toc="v2">二十三、三端开屏内容设置边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-22 明确要求。Swift 项目、OC 新项目和 OC 老项目的设置页必须完整展示开屏框架支持的五种内容类型：本地图片、本地 GIF、远程图片、本地视频、远程视频；不能只提供图片 / 视频二选一，也不能继续依赖启动入口里的注释切换。
- 三端内容类型使用持久化键 `com.jobs.splash.contentTypeForNextLaunch`，未配置或值无效时默认本地图片；“下次是否展示开屏”与“下次展示哪种内容”是两个独立设置，互不覆盖。
- 启动入口读取内容类型后再构造带实际资源名或 URL 的 `JobsSplashConfiguration` / `JobsOCSplashConfiguration`。OC 新旧项目复用现有 `1242x2688.png`、`GIF大图.gif` 和 `welcome_video.mp4`；Swift 复用“米老鼠 / 唐老鸭 / 迪斯尼”图片在临时目录生成本地 GIF，并复用 `welcome_video.mp4`，不新增无意义占位素材。

## <span id="jobs-toc-heading-25" data-jobs-toc="v2">二十四、三端远程开屏视频预加载边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-23 明确要求。Swift 项目、OC 新项目和 OC 老项目选用远程视频开屏时，只能播放已经完整落盘的远程文件；远程视频尚未缓存或下载失败时，本次开屏立即播放配置的本地视频兜底，不能等待远程请求阻塞开屏展示。
- 远程视频预加载仅允许非蜂窝网络，并在未缓存期间于倒计时按钮左侧显示本地化提示“仅在 Wi-Fi 环境下下载视频”。提示归开屏组件内部布局，Swift 使用 SnapKit，OC 新旧实现使用 Masonry。
- 预加载任务归缓存单例所有，不归 `JobsSplashVC` / `JobsOCSplashVC` 所有。倒计时结束、用户手动跳过、开屏覆盖层移除或控制器释放时，均不得取消远程视频预加载；页面持有的可取消任务只保留给远程图片。
- 下载失败后保留待办 URL 并使用退避间隔持续重试，下载完成前跨启动恢复；即使下次启动关闭开屏展示，也要先唤醒未完成的预加载。只有完整非空文件成功落入缓存后才清除待办，下一次开屏直接播放该缓存。
- 三端配置都要显式传入现有 `welcome_video.mp4` 作为本地兜底。Swift 能力归 `JobsSwiftSplash` 本地 Pod，OC 新项目归 `JobsOCSplash` 本地 Pod，OC 老项目同步维护主工程 `OCBaseConfig/JobsMixFunc/JobsOCSplash` 对应实现。

## <span id="jobs-toc-heading-26" data-jobs-toc="v2">二十五、三端 Demo 子页全局主题入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确要求。Swift 项目、OC 新项目和 OC 老项目从 Demo 根列表进入的每个导航 / 模态子页面，以及按约定命名的独立 Demo 页面，导航栏最右侧必须提供统一的全局主题切换按钮；按钮切换全部已连接 Scene 的 Window，不得只修改当前控制器或单个 Window。
- Swift 由 `JobsByUIKit` 的 `jobsSetupGKNav(...)` / `jobsEnsureNavigationDefaults()` 统一注入，识别 `RootListVC` 导航流及运行时类名以 `DemoVC` 结尾的页面；OC 新项目由 `JobsBaseUI` 公共分类注入，OC 老项目同步维护主工程对应分类，识别 `ViewController_1` 导航流及类名包含 `Demo` 的页面。三端都复用各自主列表已有的持久化主题状态，并保留页面已有右侧业务按钮。
- 专门演示系统导航栏的 `JobsNavigationDemoVC` 仍使用系统导航栏，但主题入口必须写入 `navigationItem`；其余 Demo 子页使用 Jobs/GK 导航栏。
- 各 Demo 不再重复声明月亮 / 太阳主题按钮或局部 `overrideUserInterfaceStyle` 切换。页面原有右侧业务动作继续保留，但图标必须与刷新、打乱、增删、翻页、播放等真实语义对应，避免和主题入口混淆。
- 三端项目 README、OC 本地 Pod README 与导航栏 [**Xcode**](https://developer.apple.com/xcode) CodeSnippets 必须传播自动注入规则，不再复制“取第一个 Window 并局部改主题”的旧示例。

## <span id="jobs-toc-heading-27" data-jobs-toc="v2">二十六、三端双端功能对齐 Demo 颗粒度 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-23 明确要求。Swift 项目、OC 新项目和 OC 老项目中的双端差异功能不能集中到单个 Workbench / 聚合 DemoVC；每项独立功能必须拥有一个独立 DemoVC 页面，并作为独立条目直接接入 Demo 根列表。
- 可以复用只负责公共布局、标题、状态提示和单一主操作装配的页面基座，但基座不得承载二级功能菜单、多个功能按钮、`switch` 分发或跨功能状态机；复用基座不改变“一功能一页面”的入口颗粒度。
- 新增、拆分或重命名对齐 Demo 时，必须同步维护 Swift 根列表与图标映射、OC 新旧工程的 `Demos.h`、根列表和图标映射；非文件系统同步工程还要同步 Xcode 文件引用及 target membership。

## <span id="jobs-toc-heading-28" data-jobs-toc="v2">二十七、OC 双工程 README 与 CodeSnippets 同步工作流 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确要求。OC 新、老工程是同一组能力的两种管理形态：新工程将相关功能拆为本地 Pod 管理，老工程将相关功能直接集成于主工程管理。
- 每次调整任一 OC 工程中的 Jobs 自维护能力，都必须同步检查并更新两份根 `README.md` 与 `/Users/jobs/Library/Developer/Xcode/UserData/CodeSnippets` 中的相关代码块；覆盖新增、删除、重命名、公开 API、固定写法、Demo、资源、依赖和行为变化。
- 2026-10-08 新确认：OC 新旧工程根 `README.md` 直接共用一份逐字相同的文档，数据库选型与高频 I/O 对比单元必须同步；README 不再保留“仅工程形态说明不同”的双版本差异。新工程使用本地 Pods、旧工程直接集成主工程的形态差异，统一写在同一份兼容双形态说明中。
- 同步验收时，以源码、公开头和可运行 Demo 为 API 权威源；工程形态说明归一化后，两份 README 的对应章节必须一致，相关 `.codesnippet` 必须通过 `plutil -lint`。

## <span id="jobs-toc-heading-29" data-jobs-toc="v2">二十八、三端录音与录像快门视觉 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 结合 Swift 现状与微信录制界面截图明确要求。Swift、OC 新项目和 OC 老项目的录音、录像 Demo 快门统一采用白色实心内圆、透明间隔和白色外圈，不再使用蓝色或红色实心按钮主体。
- 录制进行中保持内圆和基础外圈为白色；若展示录制时长进度，只允许进度描边使用红色，不把整个快门主体切换为红色。短录音、长录音和视频录制入口遵循同一视觉语义。

## <span id="jobs-toc-heading-30" data-jobs-toc="v2">二十九、三端同质 Demo 表现形式入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确确认。“一项独立功能一个根入口”约束只用于不同业务能力；同一核心能力仅因 `UITableViewCell` / `UICollectionViewCell` 等容器或表现形式不同，不得重复占用多个 Demo 根入口。
- 同质表现形式使用一个语义明确的根入口，并在二级列表中分别进入各自的独立 DemoVC。二级列表只能分发同一能力的表现分支，不能借此恢复跨功能 Workbench 或把多项独立功能重新聚合。
- 当前三端“按钮完全覆盖在 Cell 上”统一由 `JobsButtonCoverCellDemoListVC` 承接根入口，再分别进入 Table / Collection 具体 Demo；新增、重命名或平移同类入口时同步维护三端根列表、图标映射及 OC `Demos.h`。

## <span id="jobs-toc-heading-31" data-jobs-toc="v2">三十、OC 老工程 CocoaPods 项目格式恢复 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：2026-07-24 已在 OC 老工程实测。出现 `Unable to find compatibility version string for object version '76'` 时，失败点在 [**CocoaPods**](https://cocoapods.org/) 生成 Pods 工程阶段，不是依赖解析或下载。
- 工程包含 `PBXFileSystemSynchronizedRootGroup` 时不能盲目降到旧格式；当前 `xcodeproj 1.28.1` 支持 `77` 而不支持 `76`，因此把 `objectVersion` 与 `preferredProjectObjectVersion` 同步为 `77`，保留同步组结构。
- 修复后执行 `pod install --no-repo-update`，并验证主工程与 `Pods.xcodeproj` 根对象均为 `PBXProject`、`xcodebuild -workspace ... -list` 能列出 App 与 Widget Scheme；不能只依据 CocoaPods 最后一行判断成功。

## <span id="jobs-toc-heading-32" data-jobs-toc="v2">三十一、Swift 相册照片与桌面 AppIcon 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确要求使用相册照片，并已按工程资源结构验证。iOS 公开 API 只能切换安装包内预置并声明的 AppIcon，运行时从相册读取的任意照片不能直接成为桌面图标。
- 相册照片复制功能只负责裁剪、预览和管理 App 内副本；真正的桌面图标必须准备无透明通道的 `1024×1024` 图片，替换 `Resources/AppIcons/*.icon/Assets/Front.png`，保持备用图标名与 `CFBundleAlternateIcons` 一致，再重新编译安装。
- 验证不能停在 `setAlternateIconName` 成功或中间资源产物；要确认备用图标已进入最终 `Assets.car`，并以重新安装后的设备表现为准。

## <span id="jobs-toc-heading-33" data-jobs-toc="v2">三十二、Jobs 导航栏主副标题语义 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确确认。导航标题包含 `@` 时，`@` 前为主标题、后为副标题；按第一个 `@` 拆分并上下展示，后续 `@` 保留在副标题中。没有 `@` 时继续使用单行标题。
- Swift 侧通过 `jobsSetupGKNav(title:)` 完成基础导航配置，再写入自定义 `gk_navTitleView`；OC 侧复用 `GKCustomNavigationBarExtra gk_navTitleViewBy:` 与 `textModel` / `subTextModel`，不修改第三方 `GKNavigationBar` 源码。
- 双行标题继续复用公共导航层自动注入的主题按钮，保留页面已有业务按钮；页面不得为标题修复重复创建局部主题入口。

## <span id="jobs-toc-heading-34" data-jobs-toc="v2">三十三、Swift / OC Demo 完整对齐与中性分组 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-24 明确纠正。把 OC 能力平移到 Swift 时，不能只做极简单按钮壳；OC 页面的可见结构、交互入口、状态变化和完整能力在 Swift 侧也要达到同等表现，反向对齐同理。
- Demo 根列表按能力语义分组，不保留“OC 对齐”“Swift 来源”等来源语言分组或 Cell 标题；公开类名、标题和副标题使用中性业务命名。
- 本节补充“二十六、三端双端功能对齐 Demo 颗粒度”：前者约束页面完整度与命名，后者约束一功能一入口；两者同时满足，不能用完整聚合页替代独立 Demo，也不能用独立空壳冒充完整对齐。

## <span id="jobs-toc-heading-35" data-jobs-toc="v2">三十四、OC 老工程文件同步组编译清单 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：2026-07-27 已在 OC 老工程完成源码、workspace 构建和模拟器运行复核。当前 `PBXFileSystemSynchronizedRootGroup` 下新增或平移 Jobs 主工程 `.m` 时，只把文件落盘并让公开头可见不足以保证实现进入 App target。
- 在本工程当前项目格式下，必须同步把 `.m` 相对路径加入 `PBXFileSystemSynchronizedBuildFileExceptionSet.membershipExceptions` 的实际编译清单，并重新构建、运行验证；否则调用方可以通过头文件完成编译，但分类实现不会链接，最终以 `unrecognized selector` 崩溃。

## <span id="jobs-toc-heading-36" data-jobs-toc="v2">三十五、Swift / OC 应用层点语法“一镜到底” <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-27 先确认 OC“一链到底”，并于 2026-08-03 结合 Swift `UITableViewCell` 写法明确扩展为 Swift / OC 共用的“一镜到底”。规则覆盖三仓所有支持 Jobs DSL 的 View、Control、Layer、Cell、Model、配置对象、请求对象与业务基础对象；同一配置闭包或连续配置语义中，主接收者只作为链起点出现一次。
- Swift 子对象使用宿主级 `byXxx` / 配置闭包，OC 子对象使用返回主对象的 `byXxxBlock`。`UITableViewCell` 调用端从 Cell 级标题、副标题、图片、`contentView` 和选择状态 API 继续点出，不重新起 `cell.textLabel` / `cell.detailTextLabel` / `cell.imageView` / `cell.contentView`；缺少入口时先修真实归属层并保持返回 `Self`。
- 链序按具体类型到通用类型排列；值类型 mutating、同名异类型 DSL、返回父类和多个 `void` 终止动作必须按真实类型语义处理。查询、控制流、SnapKit / Masonry 构建器和第三方回调保留独立表达。全量审计只进入 Jobs 自维护源码，并以对应 workspace 真实构建验证，不能用强转、重复起链或裸系统 API 掩盖类型错误。

## <span id="jobs-toc-heading-37" data-jobs-toc="v2">三十六、三端设置二级展开与 Demo 列表文字策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-27 明确要求。Swift、OC 新项目和 OC 老项目设置页中的“开屏内容”“应用语言”“列表主/副标题”不能平铺全部选项；一级 Cell 展示当前值和展开 / 收起入口，点击后在同一表格中伸缩显示缩进的二级选项，再通过勾选完成设置。
- Demo 根列表二级 Cell 的主标题和副标题统一受同一持久化策略控制，键为 `com.jobs.demoList.cellTextDisplayStrategy`。策略顺序固定为一般裁切、单行省略号、缩小字体、连续跑马灯、左右来回滚动；未设置或值无效时默认连续跑马灯。
- 两级标题使用同一策略但保留各自既有字体与语义颜色。一般模式只裁切、不缩放和不补省略号；两种滚动模式只在文字真实溢出时启动，短文本继续走 UILabel 原生绘制。离屏、折叠和复用时暂停或停止滚动，重新可见时恢复。
- CoreText 滚动绘制前必须按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色；无论是否溢出、使用哪种策略或处于深浅色主题，长文本颜色都要与同层普通短文本 UILabel 一致。

## <span id="jobs-toc-heading-38" data-jobs-toc="v2">三十七、三端 SceneDelegate 多场景边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-30 明确要求。Swift、OC 新项目和 OC 老项目都要提供可发现、可操作的独立 SceneDelegate Demo，覆盖新建、激活、关闭 Scene，会话快照、独立状态、状态恢复和 Scene 生命周期日志；不能只写静态说明。
- `AppDelegate` 继续负责进程级能力，`SceneDelegate` 与 `UIWindow` 按窗口会话独立存在。状态以 `UISceneSession.persistentIdentifier` 隔离，恢复与新 Scene 路由使用 `NSUserActivity`；禁止缓存全局 `SceneDelegate`，也禁止通过 `connectedScenes.first` 猜测当前窗口。
- 三端 `Info.plist` 必须声明 `UIApplicationSupportsMultipleScenes = YES`，运行时仍以 `UIApplication.supportsMultipleScenes` 判断环境能力；完整多窗口交互优先在 iPad 环境验证。
- Demo 中暂不支持、当前环境不可用或没有目标 Scene 的动作仍保持可点击，并通过 Toast 解释原因；真正调用系统能力后执行失败才使用 Alert。Swift 反馈必须绑定当前页面的 `view.window`，避免多 Scene 下把提示投递到错误窗口。
- OC 新工程保留主工程 Demo + 现有本地 Pods 基座；OC 老工程继续直接集成主工程，不新增 Pod，并把新增 `.m` 纳入文件同步组的 target 编译清单。
- 2026-10-15 用户明确要求：OC 新旧工程与 Swift UIKit 工程统一适配 Xcode 27 / iOS 27 SDK 的 Scene 生命周期要求，持续保留已有多窗口能力；`AppDelegate` 只做进程初始化，业务窗口、独立根控制器及开屏由所属 Scene 连接流程创建，不能仅保留 SceneDelegate 文件却继续复用全局窗口或根控制器。状态：confirmed；适用范围为本笔记三仓映射；创建 / 更新：2026-10-15。
- 同日确认文档交付：在 `JobsDocs/iOS相关的文档和资料.md/` 下维护 `UIScene生命周期迁移与Xcode27启动适配.md/UIScene生命周期迁移与Xcode27启动适配.md`，用可编辑 Mermaid 时序图详细对照旧 AppDelegate 启动、新 Scene 冷启动，以及进程存活时的新建 / 重连 / 激活窗口；区分进程启动一次与每次窗口连接的执行边界。验证记录只写实际执行结果，不把配置或语法检查当运行验收。

## <span id="jobs-toc-heading-39" data-jobs-toc="v2">三十八、三端 Demo 架构智慧可发现性 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-07-30 结合时时彩多 Timer Demo 明确要求。Demo 除了真实可见、可操作和能辅助未来开发，还必须让关键架构判断可发现；复杂 Demo 应提供明确入口，以列表或等价结构展示其对象关系、所有权、状态真值、复用保护、竞态防护和生命周期治理，不能只让使用者从实现代码中自行猜测。
- 导航栏右上角继续遵守“有且只有一个入口”。页面存在业务动作时，由三端公共导航层把全局主题切换与页面业务动作统一收进该入口的操作列表，不得并排增加第二个右侧按钮。
- 时时彩 Demo 的统一解释是：一个 Cell 一次绑定一个 Model，每个 Model 以稳定 identifier 对应一个逻辑 Timer；Timer 由 TimerMgr 物理托管，VC 只持有整组 Timer 的 Scope，而不是只持有一个 Timer。`endAt` 是时间真值，`expectedTimer` 负责精准取消，Scope 负责页面级 pause、resume 和释放清理。

## <span id="jobs-toc-heading-40" data-jobs-toc="v2">三十九、OC 朋友圈 Demo 交互边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-01 明确要求，并已在 OC 新、老工程同步验证。朋友圈媒体区必须使用可见的真实本地图片和等比填充缩略图，点击图片可进入预览；不能只保留空白容器或用文字代替图片内容。
- 点赞与评论入口统一为图标加文字。点赞后图标切换为红色，长按显示点赞气泡；评论入口进入三种评论模式，默认模式一，评论模式与主题等页面动作统一收进导航栏右上角唯一操作列表，不并排增加多个入口。
- 页面背景、导航栏、主副标题、Cell、正文、次要文字和操作区都使用语义主题色，深浅色切换后可见内容必须整体同步刷新。

## <span id="jobs-toc-heading-41" data-jobs-toc="v2">四十、三端计时器机制与选型文档 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-01 明确要求，并已同步写入 `JobsOCTimer`、`JobsOCTimerMgr`、`JobsSwiftTimer`、`JobsSwiftTimerMgr` README 及 OC / Swift 工程经验文档。三端计时能力按四种系统内核说明和选型：`Timer` / `NSTimer`、`DispatchSourceTimer`、`CADisplayLink`、`CFRunLoopTimer`，不能把管理器或便捷 API 误写成新的计时内核。
- 选型先看调度语义、RunLoop 依赖、刷新节奏、生命周期和后台边界；一次性延迟另行评估 `asyncAfter`、`Task.sleep` / `Clock` 等语义。倒计时仍以目标时间作为时间真值，不能把回调次数当成真实经过时间。
- TimerMgr 的职责是用稳定标识完成去重、查询、精准取消、Scope 生命周期与复用保护；它只治理计时器，不改变底层内核的精度和系统限制。新增计时能力时，源码、四份 README、两侧工程经验文档和相关 CodeSnippets 按底层 API 传播规则一起核对。

## <span id="jobs-toc-heading-42" data-jobs-toc="v2">四十一、OC 公共主题刷新边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-01 连续完成 OC 新、老工程主题回归与崩溃修复。主题适配必须覆盖公共导航层的返回图标、返回文字、背景、主副标题，以及侧滑抽屉、左上角功能菜单、当前可见 Cell 和控件；不能只切换根 Window 或页面背景。功能菜单图标按普通、选中、高亮及组合状态使用语义主题色生成。
- 业务页面优先消费公共语义色和公共导航主题管线，不修改第三方导航库源码；页面已有动作与主题入口继续遵守右上角唯一列表入口。
- 主题中心广播绑定时，不能直接枚举可能被回调反向解绑的弱引用 `NSMapTable`。先快照有效键，再逐个执行刷新回调，避免回调期间集合变更触发 `Collection was mutated while being enumerated`；可见页面、抽屉和控件随后按当前主题即时刷新。

## <span id="jobs-toc-heading-43" data-jobs-toc="v2">四十二、OC 0 / 1 入参功能方法 Block 化 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-02 明确要求。范围覆盖 OC 新工程的全部 Jobs 自建 Pod、应用层和 Demo，并覆盖 OC 老工程直接集成在主工程中的对应功能。继续排除 `Pods/`、`ManualByOCPods@Pods/`、`PodsManual/`、生成代码、第三方和所有权不明源码；不能因为目录名含 `+3rd` 就排除 Jobs 自写适配层。批处理需检查前 100 行作者 / 版权，`.m` / `.mm` 存在同名头时联查头文件，冲突或不明即排除。
- Jobs 自定义的 0 / 1 入参普通功能方法统一改为无参 getter 返回 `JobsBlock` typedef，调用形态为 `object.action()` / `object.action(value)`。该迁移只改 API 表达：原方法体、入参 / 返回类型、默认值、提前返回、副作用顺序和异常边界均保持不变。
- 系统生命周期、协议 / delegate / dataSource、属性访问器、Target-Action、通知 selector、KVC / KVO、Runtime / swizzle 和其它固定 ABI 保留原 selector 薄 trampoline，内核收入不冲突的 `jobsXxx` Block 门面。`sharedManager` / `destroySingleton` 固定保留传统入口，Jobs 调用走 `jobsSharedManager()` / `jobsDestroySingleton()`；`AppToolsProtocol` 的 `getViewModel` / `getButtonModel` 因存在不可修改实现而固定保留原 getter，Jobs 自有实现另设 `jobsGetViewModel()` / `jobsGetButtonModel()`，通用协议接收者仍走原 getter；已以 `jobs` 开头但与旧分类冲突的 selector 使用 `...Block` 后缀门面。`dealloc`、`+load`、`+initialize` 与 `init` / `new` / `alloc` / `copy` 方法族不为形式统一而搬入捕获 `self` 的 Block。
- 实例 Block 统一使用 `@jobs_weakify(self)` / `@jobs_strongify(self)`，并以 `__has_include` 双通道导入 `JobsDefines.h`；`JobsBlock` 为避免对 `JobsOCDefs` 形成循环依赖，是保留显式 `__weak` / `__strong` 的唯一底层例外。验收必须包含 API 全量审计、Block typedef 覆盖、旧调用 / 弱引用反扫及 OC 新老 workspace 真实构建。
- 属性 getter、协议 getter、系统 / 跨模块固定 getter 必须保留原 selector 和返回类型，Block 形态收到独立 `jobsXxx` 门面；声明与实现的 ABI 必须一致。固定入口 trampoline 通过定义类解析 IMP，避免继承重写或 `NSObject` / `NSProxy` 分派形成递归。
- Block getter 发送给 nil 对象后继续直接执行 `()` 会触发空 Block 崩溃；对可空 receiver 要先做存在性保护，以保留 OC 原来的 nil-message 语义。`dealloc` 不得调用内部使用 weakify 的 Block 门面，析构路径保留不创建 weak 引用的传统清理方法。
- 最终验收不能停在编译成功：OC 新、老工程都要安装到模拟器并冷启动，检查进程存活和新增 `.ips` 崩溃报告，确认运行时 ABI、Block 调用及生命周期路径均正常。

## <span id="jobs-toc-heading-44" data-jobs-toc="v2">四十三、OC 应用层 Pod 聚合头引入边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-06 明确要求。OC 新、老工程应用层和 Demo 只要使用 Pod，不区分 Jobs 自建 Pod 或外源 Pod，都必须在调用文件的同名 `*.h` 中使用 `__has_include` 双通道保护性引入；`*.m` / `*.mm` 不得裸写 Pod 聚合头或内部子头。
- 调用方只引入 Pod 对外承诺的聚合 / 模块入口头，不因当前只用到某个分类、协议或类就直接引入内部子头。例如 `JobsBaseUI/UIViewController+BaseNavigationBar.h` 上提并收成 `JobsBaseUI/JobsBaseUI.h`，`JobsViewPush/JobsViewPush.h` 整体上提到同名头。
- 批量整理顺序固定为“新老应用层全量迁移 → 静态反扫清零 → 两边统一编译 → 集中修复问题 → 复验”；不每修一处就编译一次。继续排除 `Pods/`、`JobsByPods/`、手工第三方、生成代码和非 Jobs 源码。

## <span id="jobs-toc-heading-45" data-jobs-toc="v2">四十四、三端系统类创建与实例 DSL 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-07 以 `NSUserActivity` / `NSDateFormatter` 为例明确确认为重要代码习惯。范围覆盖 Swift 主工程、OC 新工程 Jobs 自建 Pods 与应用层、OC 老工程 Jobs 自维护主工程和全部 Demo；继续排除外部 `Pods/`、`ManualBy*Pods@Pods/`、生成代码、第三方和所有权不明源码。
- 无入参系统类构造必须走“创建对象 + 配置 Block / closure”的 Jobs 创建 DSL，不在调用方保留 `Type.new`、`[Type new]`、`Type.alloc.init`、`[[Type alloc] init...]` 或 Swift 裸 `Type()`。带参构造由真实系统类型提供类级初始化 DSL：OC 使用 `Type.initByXxx(arguments)` Block 点语法，Swift 使用同类型 `Type.make(arguments, configure:)` 工厂；系统初始化器只允许留在对应底层实现。
- 实例创建后，当前类型自己的属性、0 入参实例方法和 1 入参实例方法全部进入 `JobsOCDSL` / `JobsSwiftDSL`，分别以 `byProperty(value)`、`byAction()`、`byAction(value)` 表达。除查询和明确终止动作外必须返回当前具体类型继续一镜到底；缺入口时先补真实所有者 DSL，再改调用方。
- `[super init...]` / `[self init...]`、Swift `super.init(...)` / `self.init(...)`、初始化方法实现本身、系统固定生命周期、系统回调已交付实例及 Jobs 工厂底层属于明确边界。全量整改先做所有权过滤和构造 / 实例审计，再补公共入口、应用调用、README / 工程文档和 CodeSnippets，并以三端真实构建验证。

## <span id="jobs-toc-heading-46" data-jobs-toc="v2">四十五、OC 新项目 `*.m` 双引号 import 排版 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-12 明确要求。OC 新项目 Jobs 自己维护的 `*.m` 文件中，每条 `#import "xxx.h"` 必须独占一行；行尾说明移到独立注释行，不与 import 共行。
- 相邻的双引号 `#import` 之间不得保留空行，必须紧挨排列。文件头注释与第一条 import 之间、最后一条 import 与正文之间仍各保留一个空行。
- 全量整理必须复用 `jobs_oc_ownership.rb` 过滤所有权，继续排除 `Pods/`、`ManualByOCPods@Pods/`、生成目录、第三方和所有权不明源码；使用 `normalize_oc_m_quoted_import_layout.rb` 先干跑、再 `--apply`，应用后二次干跑必须为零变更。

## <span id="jobs-toc-heading-47" data-jobs-toc="v2">四十六、OC 新旧工程唯一差异与默认双向同步 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-12 明确确认。OC 新工程与 OC 老工程的唯一架构差异是能力承载形态：新工程把 Jobs 自维护功能下沉到本地 Pod 集中管理，老工程把同一功能直接集成在主工程；两边不是不同产品，也不允许形成不同功能标准。
- 用户只点名任一 OC 工程时，同一任务默认必须定位并同步另一工程的对应实现，即使用户忘记补充另一工程。同步范围包括 Jobs 自维护源码、公开 API、Demo、资源、行为、入口、README、工程文档和必要的工程引用。
- 允许差异仅限集成形态：新工程使用 `JobsByPods/Pod名@Pods`、podspec、Podfile 和 Development Pods 装配；老工程使用主工程源码 / 资源目录、Xcode 文件引用、Build Phases 与 target membership。没有形态差异的对应文件应逐字一致；有形态差异的内容在归一化路径、模块化 import、聚合入口和工程引用后必须语义一致。
- 2026-10-08 规则覆盖本节旧的 README 差异表述：两份 OC 根 README 必须字节级一致；同步验收使用 `cmp` 或 SHA-256 校验，任何仅出现在一侧的 README 改动都视为未完成。
- 不把新工程 Pod 目录或 podspec 原样复制进老工程。一侧确实不适用时，只有第三方所有权、生成代码或语言边界等明确理由可以判定“无需修改”，并必须在交付中说明，不能静默漏掉另一侧。

## <span id="jobs-toc-heading-48" data-jobs-toc="v2">四十七、自建 Pod 的中文架构说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-08-31 明确确认并要求执行；状态：confirmed；创建与更新：2026-08-31。
- 适用范围：OC 新项目 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods/JobsByPods` 与 Swift 项目 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo/JobsByPods` 中的自建 Pod README。
- 每个库独立增加“架构脉络与关键设计”章节，用中文说明职责分层、主要运行关系、值得关注的实现细节与边界、阅读和重建顺序。目标同时服务人类快速理解和不同能力 AI 按框架重建，不追求逐行复刻或反复试生成打磨文档。
- 保留已有 README 的正文、章节顺序、示例与使用说明；已有流程图移入新章节，原位置保留跳转，避免重复放图。复杂关系按需补图，简单扩展保持精简。
- 说明以当前自维护源码为依据，明确区分已实现能力、兼容桥接、占位与第三方边界，不能仅凭库名或旧功能清单推断实现。文档单独携带时应能读懂框架，源码路径仅作为定位线索。
- 这类说明不保证与原实现完全等价，也不代替接收环境的数据与软件准入规则。当前文档任务只覆盖用户点名的两个 JobsByPods，不扩展修改 OC 老工程或源码。

## <span id="jobs-toc-heading-49" data-jobs-toc="v2">四十八、Markdown 构建脚本的 UTF-8 路径边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：2026-09-13 已在 Swift 与 OC 新工程的 Xcode 非交互构建环境中复现并验证；状态：confirmed。
- `JobsSwiftMarkdown` 与 `JobsOCMarkdown` 的 `JobsMarkdownPackager.rb` 不能依赖终端 `LANG` / `LC_ALL`。Xcode Build Phase 可能以 `US-ASCII` / `ASCII-8BIT` 标记中文文件系统路径，最终在清单 JSON 生成时触发 `incompatible character encodings: ASCII-8BIT and UTF-8`，外层仅表现为 `Command PhaseScriptExecution failed with a nonzero exit code`。
- 打包器必须在项目根路径、构建输出路径、扫描结果、相对路径和项目名进入业务逻辑前主动规范为有效 UTF-8，并用 UTF-8 模式写入 `manifest.json`；无效字节要明确报错，不能静默吞掉。
- 回归至少包含 `env -i PATH='/usr/bin:/bin:/usr/sbin:/sbin'` 下的打包器测试，以及对应 workspace 的模拟器构建；涉及真机失败时继续执行真实设备构建，不能只在带 UTF-8 locale 的终端环境验证。
- 补充来源：2026-10-06 OC 自建 Pod 升级的生产实现与实测；状态：verified；补充创建 / 更新：2026-10-06。适用工程：OC 新项目 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods` 与 OC 老项目 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo`；本次生成树隔离补充只覆盖这两侧。
- 两侧 `JobsMarkdownPackager.rb` 永久排除路径组件 `Products`、`Intermediates`、固定输出 `JobsMarkdownDocuments.bundle`，以及项目根相对生成前缀 `work/JobsPodsStability/full`，防止重新扫描既有构建产物或文档 bundle 而递归打包。文档扫描与引用资源拷贝共用同一 canonical 过滤规则；不能用一次性环境变量代替生产过滤。
- 仅排除上述明确生成树，不按 `work/` 名称泛排整个目录；其它位置的真实文档、JSON 证明资源、中文路径与本地图片继续保留。回归同时验证生成目录拒入与真实源留存、连续两次打包清单及资源字节稳定。
- 验证基线：44 项实际 Ruby 断言全部通过，OC 新旧主工程 Debug / Release 构建实际成功；新工程 D0 两配置文档重建均通过源文档字节一致性检查。

## <span id="jobs-toc-heading-50" data-jobs-toc="v2">四十九、五端 iOS 一次性构建产物 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 已替代（`superseded`，2026-10-01）：2026-09-25 的“四端仅筛选真机、以 App 产品名命名并同名覆盖、跳过模拟器”策略，由下述五端工作流替代。
- 当前决策：来源为用户于 2026-10-01 明确要求及同轮命名修正；状态：confirmed；适用范围为 Swift 工程 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`、SwiftUI 工程 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftUIBaseConfigDemo`、OC 新工程 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`、OC 老工程 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo` 和 `/Users/jobs/Desktop/JobsLanguageLearning`；创建：2026-09-25，更新：2026-10-01。
- 各自主 App 最后一个 `Save Build IPA` 阶段调用 IPA 留存脚本（2026-10-05 迁移范围与现行路径见 [[#五十五、ScriptsByDevTools 的 command 包结构|ScriptsByDevTools 包结构]]），保留标准 `Payload/<App>.app` 结构；真机固定输出 `build/真机.ipa`，模拟器固定输出 `build/模拟器.ipa`。不带项目名、`@` 或历史时间戳。
- 在 build 外的临时目录完成快照与压缩，成功后清空 build 全部内容（含隐藏文件、子目录和另一平台的包），再写入本次唯一产物；签名或压缩失败不提前清理旧产物。模拟器允许 `CODE_SIGNING_ALLOWED=NO`，其 IPA 仅是模拟器 App 快照，不能安装到真机或用于正式分发。
- build 仅保存一次性产物；DerivedData、源 App 和构建中间目录必须在 build 外。脚本拒绝清理软链接 build 或含当前构建工作路径的 build。主 App 阶段输入只声明脚本，输出声明 build 目录，避免整个 App 输入造成签名 / 扩展 / 测试依赖循环；clean、Tests 和 Widget 不独立输出，测试重建主 App 时仍更新主 App 产物。
- 五个工程根 README 必须同步完整工作流、命名、清理范围、签名、模拟器使用边界及日志；没有说明的工程补齐。语言学习工程的初始工程生成器也保留该 Build Phase，README 的 DerivedData 示例放到根 `DerivedData/`，并由 `.gitignore` 排除。
- 留存脚本必须校验 Xcode 提供的签名身份，并对临时 IPA 快照执行签名和 `codesign --verify --deep --strict` 校验；不能只把未经签名校验的 `.app` 复制到 `build/`。
- 如果 Xcode 产出的 `.app` 已通过完整签名校验，脚本必须原样保留其 `application-identifier`、Team ID、`get-task-allow` 等签名元数据，禁止无条件使用 `codesign --deep --entitlements` 重签导致安装校验失败；只有未签名快照才允许走保留元数据的补签分支。

- `Save Build IPA` 的整个 App 输入禁令沿用 2026-09-26 Swift 构建图排查结论，并于 2026-10-01 同步五端。验证：五份脚本一致、Shell / 工程语法通过，隔离夹具完成双平台切换、实际 Payload 压缩解包、隐藏项与子目录清理、失败保留及临时快照清理；真机分支使用 ad-hoc 夹具核验原签名保留，不代表开发者证书 / 真机安装验收；未执行五工程全量构建。

## <span id="jobs-toc-heading-51" data-jobs-toc="v2">五十、语言学习 Demo 分类与迁移顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 历史决策：用户于 2026-09-25 确认在 Swift Demo 中先做俄语点读，之后再考虑 OC 新旧工程迁移。
- 当前状态（2026-10-03）：用户要求完全删除 Swift BaseConfig Demo 中的语言学习功能模块。已移除根列表入口、俄语课程与页面、语音播放器及专属图标资源；本节原有 Swift Demo 开发规划已被取代。
- 独立 JobsLanguageLearning 应用属于另一仓库，继续按 [[40-项目记忆/JobsLanguageLearning-独立语言学习App|JobsLanguageLearning 独立应用]] 维护；本次移除不涉及该仓库。

## <span id="jobs-toc-heading-52" data-jobs-toc="v2">五十一、安装与构建挂载脚本的 README 归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-26 明确要求；状态：confirmed；适用范围：本笔记仓库映射中的 OC 新工程、OC 老工程和 Swift 工程；创建 / 更新时间：2026-09-26。
- 各项目根 README 记录实际挂载的安装与构建脚本：Swift 放在“项目配置支持”，OC 新旧工程放在“特色一览”。用户进一步明确：以后凡新增或修改 `pod install` 外援脚本、Xcode 编译后挂载脚本及其调用配置，都必须在同一任务更新对应 README；移除挂载时同步修正说明，不能只更新脚本目录 README。
- 规则主归属为现行 JobsSkills 的 `jobs-podspec/SKILL.md` 1.6.2 节，`jobs-swift` 和 `jobs-objective-c-pods` 保留强制同步入口；交付前对账脚本行为、挂载配置、文档与相对链接。
- 按真实入口区分安装前置任务、安装完成后的钩子、Build Phases 与 Scheme 构建后动作，并记录行为、产物、日志和失败边界；各仓挂载差异据实说明，不把目录内未挂载的脚本写成自动执行能力。
- 2026-10-05 用户明确将 [[啄木鸟维修平台#六、Xcode 手动依赖安装入口|啄木鸟手动安装入口]] 扩展到本笔记映射中的 OC 新旧工程、Swift 工程和 `/Users/jobs/Documents/Github/语言学习/原生iOS版本`，并要求相应根 README 写入合适章节；状态：confirmed。每个工程使用独立 `ScriptsByPods/【MacOS@Xcode】🫘打开终端运行Pod Install.command/` 包和工程文件引用，保留系统打开终端、回车确认、相对项目定位、现有 `pod` 检查、完整日志及真实退出码，不增加自动构建动作。
- 当前用户 Xcode Behaviors 分别为 `🫘OC 新工程 · Pod Install`、`🫘OC 老工程 · Pod Install`、`🫘Swift 基础工程 · Pod Install`、`🫘语言学习 iOS · Pod Install`；每项固定绑定对应工程脚本，与当前窗口无关。用户设置不随工程迁移，换电脑或移动路径后须重新选择脚本；四个入口日志名分别为 `jobs-oc-new-pod-install.log`、`jobs-oc-old-pod-install.log`、`jobs-swift-base-config-pod-install.log`、`language-learning-pod-install.log`，均在系统临时目录。
- 本轮验证：现有工程对象和构建阶段保留、语法与相对链接有效、四工程隔离假 `pod` 接入验证通过，四个 Behaviors 已在实际 Xcode 菜单核验；未执行真实 `pod install` 或构建。OC 根 README 位于“特色一览”2.7，Swift 位于“项目配置支持”第 10 节，原生语言学习位于“运行方式”2.1；语言学习初始工程生成器同时保留这些展示引用。

## <span id="jobs-toc-heading-53" data-jobs-toc="v2">五十二、OC 新旧工程的 Git 仓库关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-02 明确确认，2026-10-16 再次确认现行路径与分支职责，并经只读 Git 核验；状态：已确认；更新：2026-10-16。
- `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo` 使用 `main`，功能集成主工程；`/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods` 使用 `byPods`，功能下沉本地 Pod。两处是独立 Git 元数据的本地仓库，在 GitHub / Gitee 各平台内共用同一远端仓库地址，以 `main` / `byPods` 区分形态，不拆成两个远端仓库；旧 `/Github/1/` 路径已替代（`superseded`）。职责映射不表示两平台当前提交已一致，不能据此自动推送或重建远端分支。
- Xcode 运行态 `/Users/jobs/Library/Developer/Xcode/UserData/CodeSnippets` 也在码云同步范围内；与配置子仓 `JobsCodeSnippets` 按仓库身份去重，保持两处本地副本可同步同一远程。

## <span id="jobs-toc-heading-54" data-jobs-toc="v2">五十三、四端 Debug 调试面板 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-05 明确要求并追加 SwiftUI 工程；状态：confirmed；创建 / 更新时间：2026-10-05；适用范围：本笔记仓库映射中的 OC 新工程、OC 老工程、Swift 工程和 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftUIBaseConfigDemo`。
- `JobsDebugPanel` 在 OC 新工程与 Swift 工程下沉为本地 Pod；OC 老工程将同一源码、资源和 Demo 直接集成于主工程，保持同一功能标准。
- 面板仅在 Debug 出现。最前方入口为圆形 UIButton，只用背景图；点击进入表格工具页，长按仅关闭本次运行的入口，重启 App 自动恢复。
- AppDelegate 配置默认环境功能，环境模型承载 URL 和备注，一级工具页进入二级环境选择页；切换必须连接到实际网络请求配置。
- 自定义功能用专用模型封装 Cell 标题、可选图片和点击行为，通过点语法链式 DSL 注册，按配置先后展示；四个 Demo 都要实现并完成编译验证。
- SwiftUI 工程使用独立的 SwiftUI 本地 Pod，界面和导航用 SwiftUI 实现，不能直接复用 UIKit 面板替代。
- 用户于 2026-10-05 追加确认：调试面板的主题与入口拖动问题必须同步修复 OC 新旧、Swift UIKit、SwiftUI 及啄木鸟 iOS 的五处副本。菜单、环境页和已打开页面都跟随宿主的有效主题；UIKit 宿主的 App 外观与系统外观可能不同，必须覆盖两者错配。入口可拖动且保持点击打开、长按仅本次隐藏和重启恢复，拖动不能误触这两种动作；不能为框架另造与宿主脱节的主题状态。
- 用户于 2026-10-05 再次确认：圆形 bug 入口点击打开调试面板，再次点击应退出本次调试导航并返回打开前的宿主页面；菜单、环境二级页及自定义工具详情统一遵循此行为。独立 Demo 也纳入宿主主题适配，检查原生 Cell 背景、文字、选中态和附件，不能仅适配框架菜单。发现一处同类缺陷时统一核查上述五处集成，并先从保留对话和本节核对范围；不把尚未集成框架的工程列为已修复。
- 2026-10-05 验证基线：四端 Debug / 原生 Release 模拟器编译成功，环境选择、冷启动持久化、真实 GET、功能顺序和长按恢复实测通过。Swift UIKit 既有 Flutter 模块在模拟器 Release 验证中使用 `FLUTTER_BUILD_MODE=debug`，不等同于完整 Flutter Release 或签名真机包；本轮未验证真机 Release。成品 Swift Pod 已另用于 [[啄木鸟维修平台#四、前端环境切换|啄木鸟 iOS 调试入口替换]]。

## <span id="jobs-toc-heading-55" data-jobs-toc="v2">五十四、OC / Swift 自建 Pods 所有权与演进目标 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-05 分别在 OC、Swift 自建 Pods 审阅任务中明确确认；状态：confirmed；创建 / 更新时间：2026-10-05。
- 适用工程：OC 新工程 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods` 的 `JobsByPods/` 下除 `ManualByOCPods@Pods/` 外，以及 Swift 工程 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo` 的 `JobsByPods/` 下除 `ManualBySwiftPods@Pods/` 外的一级 Pod，均为 Jobs 自建维护；目录中的第三方依赖本体、供应商和生成代码仍按全局边界排除。
- 长期演进目标：程序向更强健、更稳定的方向发展；评估升级空间时以当前自维护实现与可验证行为为依据，区分必要修复、值得安排的加固和按需扩展，不因既往 AI 打磨记录推断实现已无缺陷。
- 初始两次任务均授权为审阅，并在各工程根目录与 README.md 平行交付报告。用户于 2026-10-05 随后分别在 OC、Swift 两轮任务中明确授权全部自建 Pod 升级，要求同步每个 Pod README，按每个 Pod 小工程先编译，再编译完整大工程；只有大工程编译成功才算成功。该授权适用于这两轮已明确要求的升级，不外推为任意未来审阅均获批量修改授权；审阅推断、一次性问题清单和未完成验证不写成永久通过结论。

## <span id="jobs-toc-heading-56" data-jobs-toc="v2">五十五、ScriptsByDevTools 的 command 包结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-05 明确要求将 OC 新旧、Swift 基础工程、啄木鸟原生 iOS 与语言学习原生 iOS 的 `ScriptsByDevTools` 下 `.sh` 整理为 `.command + README.md`，并放入与完整 `.command` 文件名一致的目录；状态：confirmed；创建 / 更新：2026-10-05。
- 适用工程：`/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`、`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo`、`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`、`/Users/jobs/Documents/Github/啄木鸟维修平台/iOS`、`/Users/jobs/Documents/Github/语言学习/原生iOS版本`。
- 五工程现行 IPA 入口均为 `ScriptsByDevTools/save_device_ipa_after_build.command/save_device_ipa_after_build.command`，同目录配套 `README.md`；主工程输入 / 调用、各根 README 和语言学习初始工程生成器同步此路径。该规则限定用户点名的 `ScriptsByDevTools`，不扩张迁移 `ScriptsByPods`、供应商或生成脚本。
- 保留主 App 最后构建阶段和原 IPA 留存业务：明确识别 `XCODE_VERSION_ACTUAL` 与 `TARGET_BUILD_DIR` 后自动执行；终端入口先展示自述，回车后输入 `YES` 授权清理，取消或无法读取确认时直接退出，确认前不初始化日志。脚本共享同一内容，语法、引用、结构与临时夹具验证通过；未为目录迁移执行真实工程构建、安装或真机签名验收。

## <span id="jobs-toc-heading-57" data-jobs-toc="v2">五十六、OC 新工程的 GitHub 完整历史与 Gitee 零点快照 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-07 明确要求同一工程文件夹中 GitHub 全跟踪，Gitee 以当前状态为零点；远端旧记录清理由用户处理，真实提交与推送由用户执行。状态：confirmed；创建 / 更新：2026-10-07；适用范围仅为 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`。
- 2026-10-16 用户要求只读提炼原因并写入 Git Skill，不改当前代码；状态：confirmed。现有快照 README 记载旧历史与容量问题、Gitee 服务端 `Repo size ... exceeds quota` 拒绝，因此保留 GitHub 完整历史、Gitee 使用独立零点。未确认旧对象精确体积或当前平台配额，不作量化归因。
- GitHub `origin` 继续使用 `byPods` 并保留全部原历史；Gitee `gitee` 使用本地 `Gitee@snapshot` 推到远端 `byPods`。首次快照无父提交，后续只延续快照父链，不合并 GitHub 与 Gitee 的提交历史；保留现有跟踪文件和忽略范围，包括当前依赖报告与 PNG。
- 同日分支显示与命名调整（2026-10-07，confirmed）：用户要求去掉 Sourcetree 中的 `codex` 文件夹层，随后自行改名为 `Gitee@snapshot` 并明确要求维持该名，大小写和 `@` 必须保留，与 `byPods` 同级显示。旧名称 `codex/gitee-snapshot`、`gitee-snapshot` 均已取代（`superseded`）；改名保留已有快照提交，安装配置、推送映射与文档同步使用用户当前名称，远端目标仍为 `gitee/byPods`。
- 快照分支名称属于可调整配置：通过随 `git branch -m` 移动的本地分支标记识别现有名称，旧版本用唯一快照根标记识别；自动同步不得因旧配置而重建已改名分支。改名后重新安装会沿用用户当前名、保留快照链并更新默认推送映射。Sourcetree 显式推送须选择 `Gitee@snapshot → byPods` 并关闭标签推送，不能用窗口自动填入的同名远端目标。
- 工程入口为 `ScriptsByDevTools/gitee_snapshot.command/`，tracked hook 源位于 `.githooks/`；安装将入口复制到 Git 元数据目录并备份本地配置。源分支提交、合并、改写后自动同步已提交文件树，推送前拦截原历史、标签和过期快照；不切换工作区、不改暂存区、不自动推送。新克隆或迁移电脑须重新安装本地配置。
- 同日使用流程补充（2026-10-07，confirmed）：开发、提交与拉取 GitHub 都保持检出 `byPods`；Sourcetree 推 Gitee 只在窗口选择快照源分支，无须检出快照。仅删除本地 remote-tracking 记录不等于服务器删除成功。
- 同日删除权限纠正（2026-10-07，confirmed）：用户明确要求“只要是远端，我都要允许删除”。本工程本地 hook 放行所有远端引用的原生删除，包含分支、标签与多引用删除；纯删除不依赖工作区快照脚本，切换旧分支后也可执行。普通推送继续检查快照与目标。先前只允许删除 `byPods` 的本地限制已取代（`superseded`），不再按远端名、分支名或快照启用状态限制用户删除。远端实际操作仍由用户执行，Codex 不自动清理 `main` 或其它远端记录。
- 本工程不使用“逐层空白提交并Push”通用动作去整合全部远端；使用 Sourcetree 原生推送窗口或明确 ref 映射。双远端推同一最终提交的旧要求在本工程内已被取代（`superseded`），其它仓库继续遵循 [[SourceTree-脚本体系#七、逐层空白提交推送的递归范围|SourceTree 通用双线路策略]]。
- 2026-10-16 严格分支管理确认：旧工程工作分支 `main`，新工程工作分支 `byPods`；仅新工程允许现有发布分支 `Gitee@snapshot` 例外，不是额外开发分支。它复用已提交文件树、保留独立快照父链，远端目标仍是 `byPods`；不得套用通用 Gitee 目标 `gitee` 命名，也不新建同名远端分支或其它辅助本地分支。既有其它分支只读核验并报告，不擅自删除、改名或重写。规则归 `/Users/jobs/.agents/skills/jobs-git-repository/SKILL.md` 的“OC 双工作目录与 Gitee 独立快照例外”专节。
- 清空前同一 Gitee 远端还承载 OC 老工程的 `main`，不得由 Codex 默认列入清理范围。同日用户明确选择网页清空整个 Gitee 代码库并自行执行（2026-10-07，confirmed），该范围包含旧 `main`；重建时只推独立快照到 `byPods`，不自动把 GitHub 的 `main` 回推 Gitee。只读核对已确认 GitHub 的 `main` 与清空前 Gitee 的 `main` 提交相同，GitHub 原历史继续保留。操作已执行不等于服务端已成功恢复为空库，仍须核验实际结果。零点只切断以前历史，后续图像版本仍会累积容量。

## <span id="jobs-toc-heading-58" data-jobs-toc="v2">五十七、马赛克实验室 App 与后续双语言 Pod 规划 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-12 技术讨论、问答与实现请求明确确认；状态：confirmed（需求与范围）；创建 / 更新时间：2026-10-12。当前工程路径：`/Users/jobs/Desktop/JobsMosaicLab`，入口 `JobsMosaicLab.xcworkspace`。
- 早先“必须恢复真实原始内容”的保证口径已被同日甲方新需求更新（superseded）：只有单张已打码静态图，尽力重建、质量不保证、免费且不调用云端 AI 接口；用户明确允许本地开源模型，并确认不要求推理引擎开源，允许本地 Core ML。“无限逼近完美”保留为优化愿望，不写成已验收恢复率。
- 早先“当前只讨论、立即双语言 Pod”的阶段口径已更新（superseded）：先实现桌面独立 Swift App，OC 以后再做；图像能力暂留 App 内、不下沉业务 Pod。未来要求 OC 与 Swift 各自语言实现，不以桥接包装冒充双版本。
- App 第一组只有一个手动打码入口：相册选任意可解码静态图、画笔或矩形选区、生成打码图并新增保存相册；第二组演示多条传统 / AI 重建路线。用户看过蓝色选区后明确要求参考原 Swift 打码交互，功能一改为手势中显示真实像素化预览、块强度可调，不能让透明蒙层冒充打码结果。
- UI 复用指定 Swift 基础工程 JobsByPods 的最小原样源码闭包，使用真实工厂与链式 DSL、SnapKit；Podfile 与 Podfile.deps 解耦，Xcode 左侧 Ruby 红钻展示已实检。原基础工程只读。
- 已实现结构事实：两条传统方法（网格插值、保边平滑），一个真实 Real-ESRGAN compact 模型的完整 / 55%保守合成两策略；模型离线随包，不保留原图给重建入口回贴。输入长边最多2048 px，PNG新增保存不沿用源EXIF；这些是实验实现边界。
- 实现基线由本地构建与测试确认：Debug模拟器、Release模拟器、Release iPhoneOS无签名编译及模拟器相册往返 / 四方法流程通过。真机签名运行、机型功耗 / 峰值内存与实际业务图片效果仍待验收，不能把模拟器和数值验证写成真实原图恢复保证。
- 技术讨论文档继续保留三条条件不同的路线：原始资料精确恢复、单张 AI 重建、参考图或视频多帧辅助恢复；当前 App 只用单图，另两条仍是条件性方案。
- 2026-10-13 根据用户主题与字号截图修正桌面 App：先配置 `MosaicTheme.json`，以窗口有效外观同步已有 JobsThemeCenter；导航用原生 BarButtonItem，列表高亮背景与前景成对更新。UIButton 颜色 transformer 必须保留 Jobs 字体 transformer，不能覆盖后退回系统大字号；操作标题13 pt、单行、紧凑内边距及等宽主按钮。分段禁用标题使用同层文字避开系统淡化；小屏画布按可用视口预留工具空间，底部取消完整可见的坐标断言通过。原始基础工程与73份复用源码均未修改。
- 该整改已通过明暗 / 跟随系统真实入口切换、既有页面反复切换、iPhone 13 mini 最大系统字体下六个操作标题单行断言，以及完整相册往返 / 四方法回归。实际截图对比证据在桌面工程 `Tests/Validation/ThemeRuntimeContrast.json`；修复后的实体设备需重新Run验收，不将模拟器结果表述成真机验证。来源：同一用户任务，状态：verified（本地构建与模拟器验证）。

## <span id="jobs-toc-heading-59" data-jobs-toc="v2">五十八、Pod Install 的 FVM 安装来源回退 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-16 明确要求；状态：confirmed；适用范围：本笔记映射中的 OC 新旧、Swift 基础工程；创建 / 更新时间：2026-10-16。挂载到 `pod install` 的 [**fvm**](https://fvm.app) 安装逻辑须在 Homebrew 不可用或安装失败时自动回退官方安装方式，不能因 Homebrew 单一来源失败而放弃配置。
- 当前挂载事实：Swift 基础工程的 `ScriptsByPods/配置Flutter环境.sh/配置Flutter环境.sh` 负责安装，`拉取Flutter侧三方资源.sh` 负责后续工具发现；OC 新旧工程的 Podfile、ScriptsByPods、构建阶段与共享 Scheme 均无 Flutter/FVM 安装调用，不为统一文案额外添加挂载。
- Swift 实现复用健康 FVM；需要安装时尝试已有健康 Homebrew 的 `brew install fvm`，退出失败或 FVM 健康复检失败后运行官方 `https://fvm.app/install.sh`。不再拉取旧 `leoafarias/fvm` tap，也不为此强制安装 Homebrew。官方安装后精确验证安装目录的二进制，并让当前进程与后续独立脚本均能发现；`FVM_INSTALL_DIR` 与 Flutter SDK 缓存目录独立，保留 Podfile 辅助任务失败仅告警的边界。根 README 和两份脚本 README 同步维护。
- 2026-10-17 已修 Swift 换电脑生成配置检查：`Podfile` 与 `拉取Flutter侧三方资源.sh` 同时核验 module / SDK helper、Generated 与 export 的 SDK / module 真实路径，不能仅凭 `podhelper.rb` 存在而跳过。首次 `pub get` 成功仍不健康时，备份移出两份过期配置后再交给 Flutter 官方 `pub get` 生成；失败或中断恢复原配置并保留备份。不手改生成源码、不手动删除 `.ios` / Pods / 锁文件、不通过可能嵌套 Pods 安装的 `build ios --config-only` 修路径。脚本 34 项与 Podfile 检查 10 项隔离回归通过；本机健康入口实跑跳过，未执行真实依赖安装。换机排查先核对实际运行的 Podfile 是否包含 `JobsCocoaPodsSource.apply!`，迁移时同步 Podfile 与完整相关脚本包。

## <span id="jobs-toc-heading-60" data-jobs-toc="v2">五十九、Swift 与 OC 空壳清理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-16 确认清理 Swift 工程中未使用的 JobsOCDSL，并要求排查 OC 新工程与 Swift 的其它空壳；状态：confirmed（清理范围）、verified（源码与集成检查）；创建 / 更新时间：2026-10-16。
- Swift 基础工程 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo` 的 `JobsByPods/JobsOCDSL@Pods` 是没有分类实现且未接入宿主的兼容入口，已删除；独立消费者验证特判、当前 README / SwiftDoc 和依赖报告同步清理。Swift 链式能力继续来自 JobsSwiftDSL，不能因 OC 同名模块存在而把空兼容层重新当作已交付能力。
- OC 新工程 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods` 的 JobsOCDSL 有完整真实实现，保持不变；同名不代表相同交付形态。初轮“其它候选只报告”的执行边界已被同日用户后续明确要求“删除你查找/整理出来的空壳”取代（superseded）。
- 后续清理撤销 Swift 伪 setter、未实现至今选项、倒计时 Date no-op、旧 Timer 子规格及空文件/目录；OC 新工程撤销未完成 VPN，OC 新旧自维护侧同步撤销空动画附件与虚假发布链路。JobsPostVC 保留为图文草稿编辑，不把发布按钮无反应当成已交付网络能力。旧工程手工第三方 VPN 源码仍按维护边界保留，自维护公开头不再导出。
- 当前清理清单与验证边界记录在 Swift 工程根 `OC新工程与Swift空壳排查报告.md`；历史验收 JSON 保留，不替代本轮验证。该删除确认只针对已排查清单，不扩张为任意模块或手工第三方源码的删除授权。

## <span id="jobs-toc-heading-61" data-jobs-toc="v2">六十、CocoaPods 公共源网络测试模块 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-16 明确要求；状态：confirmed；适用范围：所有 Jobs 自维护、使用 CocoaPods 的工程与安装 / 更新入口（2026-10-17 扩大范围）；创建：2026-10-16，更新：2026-10-18。公共 Specs 源必须根据当前网络测试结果选择，不能只固定优先级或仅测试无关网站。该能力独立封装，和其它安装脚本统一放在各工程 `ScriptsByPods/`，不散落至业务目录；三处实现与说明同步维护。
- 独立包为 `ScriptsByPods/【MacOS】🌐CocoaPods源自动选择.command/`，同包保存 zsh 主脚本、Ruby 适配器、README 与隔离验证。Podfile 在声明 `source` 前同步调用；不是 `pre_install` / `post_install`，也不混入异步强制离线的报告与索引任务。每次真实 `pod install` / `pod update` 测试两源的同一锁定 podspec，Git 额外测试仓库协议，再根据有效响应与耗时选择；查询命令不联网。
- 公共源关联只在当前 CocoaPods 锁对象中适配，保留版本、校验与私源；磁盘锁文件由正常安装成功后写出，严格部署校验不绕过。网络探测不代表完整克隆或依赖下载已经成功；双源失败明确回用可用缓存源或 CDN 默认值，不自动删锁、删 Pods、升级依赖或递归重试安装。
- 2026-10-17 用户明确要求将 Swift 的真实网络选源能力移植到 `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs/scripts/update.command/update.command`；状态：confirmed（迁移范围）、verified（实现与隔离验证）。工具本体按活跃 `pod` 归属选择 Homebrew / 当前 Gem，公共 Specs 另行实测选源并只刷新选中的官方本地别名；双源失败保留缓存并报告未刷新，自动模式无 Git 缓存且 CDN 可用时选 CDN，不冷克隆巨大 Specs。46 项隔离回归通过，本机命令副本已备份同步，未真实升级。换机日志中的 AMPopTip GitHub 源码连接失败与 Specs 选源属于不同下载层，不能通过换索引、删锁或升级 CocoaPods 声称已修复源码链路；当时远端受限网络实际安装尚待验，2026-10-18 的单次换机验收见本节末条。
- 同日用户明确第二项还须升级 Swift 安装实现，不能只停留在网络诊断；状态：confirmed（Swift 修复范围）、verified（本地实现与隔离验证）。Swift 独立新增 `ScriptsByPods/【MacOS】🌐CocoaPods网络适配.command/`，Podfile 在 Specs 选择前实测当前链路与已启用系统代理，代理只作用于本次进程并退出恢复；源码层只对白名单 AMPopTip 4.12.0 已审发布请求在 Git 网络失败后回退官方 codeload 精确 commit，保留原 spec/source/锁参数，不泛化到未知仓库或版本。CocoaPods 1.17.0 / downloader 2.1 实际 API 挂载、72 项隔离验证及本机只读 Git 链路通过；当时新电脑代理配置尚待用户回传只读诊断，未在该设备完成真实安装；该待验状态已由本节 2026-10-18 的用户确认更新。初轮仅 Swift 挂载的范围已被同日后续“凡使用 CocoaPods 均具备网络选择”的明确要求取代（superseded）；当前范围与验证见下述全工程条目。

- 2026-10-17 用户授权先在本机修复再写入日常 `update -t`，并明确原生扩展问题本机验证通过即可，不扩展其它电脑测试；状态：confirmed（范围与维护方式）、verified（本机实际重建）。本机 CocoaPods 绑定 Homebrew Ruby 4.0.7，当前平台为 arm64-darwin-27；25 个已安装 Gem 版本只有旧 darwin-25 扩展。已用当前 Ruby 逐版重编译并在新进程精确激活、实际加载，`pod --version` 的 Ignoring 从 75 条降到 0 条，Ruby 与 Gem 版本不变，144 个旧平台文件和 gemspec 指纹未变，第二次缺失为 0。该告警发生在 Podfile 加载前，不能归因于网络适配脚本，也不能以改名平台目录或复制完成标记修复。独立入口为环境仓库 `scripts/repair_gem_extensions.command/`；同一实现原样内嵌 update，Ruby / RubyGems 更新前后与 CocoaPods 本体升级后按当前运行时检测，仅对缺失项完整备份后重建，构建或加载失败恢复本目标，健康项跳过；失败必须报告，不能隐藏告警冒充修复。

- 2026-10-17 用户再次明确“但凡用到了 CocoaPods 的地方都要有网络选择”，并点名 `/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftUIBaseConfigDemo`；状态：confirmed（当前及后续自维护工程约束）、verified（实现与隔离验证）。新建、迁移或维护任何 Jobs CocoaPods 工程 / 模板时，必须同时携带网络适配与公共源选择两包，在 Podfile 依赖解析前按“网络 / 已有代理实测 → 已审归档适配注册 → 公共 Specs 选源”顺序执行，使后续 HTTP / Git 下载继承同次进程环境；不能只做 Specs 选源、只复制模块而漏挂 Podfile，或让生成器恢复旧模板。第三方、手工供应商、Pods、Flutter .ios 等生成物及所有权未确认工程继续排除。已覆盖 13 处主工程 Podfile：Swift UIKit / SwiftUI、OC 新旧，Flutter 主仓与 JobsFlutterBaseConfigDemo 的 iOS / macOS，语言学习原生 iOS 与 Flutter iOS / macOS，啄木鸟新旧 iOS。各项目自包含、按相对路径加载，不依赖另一仓的绝对路径；纯本地 Pod 工程也保留入口，不因此新增 AMPopTip 等依赖。
- 同轮闭环：JobsPodBinaryBuilder 为 PackagingHost / ConsumerDemo 两类临时工程复制运行包并生成同一前置顺序，App 资源随 `.command` 生成器打包；既有 Build App 未重建，下次运行生成器后生效。JobsCommand@iOS / @Flutter 的六个安装、更新、仓库刷新包装器取消缓存镜像对全局 trunk 的自动重建，仓库刷新为同一次 `pod install --repo-update`，保留 workspace / Pods / Podfile.lock；未接入目标只提示边界，不接管其源码。SourceTree 两类安装入口直接进入目标 Podfile，无需额外加载。环境仓 update 的独立 repo 命令不读取工程 Podfile，因此完整内嵌网络模块，通过 0600 NUL 受控键值载荷把验证后的配置交给同一 Specs / repo 子 Shell，父环境与 NO_PROXY / 原 Git 配置保留；禁止 eval 或将代理凭据写日志。更新副本已备份同步本机命令。
- 2026-10-17 验证边界：新增九处 Podfile 的 27 组隔离回归、核心实现副本对账、锁文件与原依赖 / hook 保留检查通过；SwiftUI 完整 Podfile 只读解析、OC 两侧、二进制生成器、六个通用包装器与 update 代理继承 / 原选源 / 原生扩展集成回归通过，该轮未执行真实安装、构建或全量 update。已有代理 / 探测成功不等于完整安装成功；官方归档回退继续只覆盖已核验 AMPopTip 4.12.0 请求，不泛化到任意仓库或版本。
- 2026-10-18 Swift 换机验收：来源为用户回传的 `report.txt`、`report 2.txt` 及随后明确确认；状态：verified（报告中的完整下载）、confirmed（用户确认完整安装）；适用目录：另一台 Mac 的 `/Users/wx996768/Documents/Gitee/JobsSwiftBaseConfigDemo`；创建 / 更新时间：2026-10-18。原终端没有代理环境变量，Git 未连接系统已启用的 `127.0.0.1:7990` 显式代理；原链路 Raw 握手被重置，两种 HTTP 协议的 Git 克隆均触及脚本 60 秒限时，其后的断包错误不能当作远端重置证据。显式使用 `http://127.0.0.1:7990` 后，Raw podspec 的 JSON / 身份校验通过，官方 codeload 归档 `8,701,761` 字节在约 `2.72` 秒完成且 tar 校验通过，同一 [**ESPullToRefresh**](https://github.com/eggswift/pull-to-refresh) `2.9.3` 浅克隆完整接收 `8.28 MiB` 并成功。用户随后确认，以一次性 `env` 代理环境执行完整 `pod install` 成功；该次原终端链路未使用 7990 显式代理的问题已验收。结论仅适用于这台电脑此次环境，不代表所有下载失败同因，也不代表全工程、全环境或后续构建均已验收；未变更全局 Git、未删除 Pods / 锁文件。

## <span id="jobs-toc-heading-62" data-jobs-toc="v2">六十一、GitHub Actions 模拟器验收边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 2026-10-26 Swift CI 的 Flutter 准备须在独立步骤直接调用现有环境配置与资源准备脚本，显式设置 `JOBS_FLUTTER_AUTO_SETUP=1`；Podfile 无 TTY 时仍跳过辅助写任务，不能依赖该标记绕过外层交互保护。资源准备只允许“无 TTY + 精确 1”自动执行，TTY 回车确认及 `check-only` / `skip` 优先级保留。第一次真实 `pub get` 可能因生成文件时间戳而保留旧绝对路径；沿用两份配置备份、移出后再次官方生成及失败恢复流程，不手改生成源码。CI 由 `podfile_readiness.rb --verify-project` 硬检查当前 SDK / module 路径、registrant podspec 及 iOS engine，准备失败不进入安装；安装步骤单独固定 `JOBS_SPECS_SOURCE=cdn`，本机交互默认自动选源不变。来源：用户此次要求修复并授权 GitHub 推送、真实临时目录迁移与 [run 40280564217](https://github.com/JobsKits/JobsSwiftBaseConfigDemo/actions/runs/40280564217)；状态：verified；创建 / 更新：2026-10-26。修复提交 `36b83b9855c00a0f13277b2670c2c31fa5c3c1de` 的完整工作流已成功，涵盖 64 个自有 Pod、主 App / 测试包、27 项宿主测试零失败与上传。实际下载产物为 167,153,753 字节，完整 SHA256 与 GitHub digest 一致；内外 ZIP 完整性、唯一主 App 身份、预期 Bundle ID、arm64 / IOSSIMULATOR、SDK 27.1、Debug 动态库与主资源均已核验。不扩展为真机或人工功能验收。

- 来源：用户于 2026-10-17 要求修复 OC 新旧与 Swift 的 GitHub workflow 失败，2026-10-24 要求父仓四工程的 iPhone Duo 适配包含远端 workflow 成功；状态：confirmed（覆盖范围）、verified（下述实现及明确列出的分工程验收）；创建：2026-10-17，更新：2026-10-24。工程绝对路径沿用本笔记第一节及文件头，不由历史通过记录推断最新提交整条 CI 已通过。
- 2026-10-18 用户明确验收标准：Swift 及 OC 新旧工程的 workflow 修复，必须以对应修复提交的完整 GitHub workflow 正常成功结束为任务完成标志；本地编译、局部回归或仅推送修复均属于中间验证，不能提前报完成。状态：confirmed；适用范围：本节的三处 iOS 工程。
- Swift 与 OC 新工程的测试设备按当前 Xcode Simulator SDK 主版本选择可用 arm64 iPhone，再按数字 runtime 版本排序；不让已启动的旧系统抢占。Swift 在依赖安装前，以最低 iOS 15.6 编译并实际运行 WebKit overlay 加载探针，不通过提高部署版本或弱化链接绕过问题。首次启动准备预算为 10 分钟。
- OC 新工程 CI 全 job 使用 `JOBS_SIMULATOR_ONLY=1`，两个 Jobs 自有 podspec 在该模式排除真机专用 IJK，保留 AVPlayer / ControlView；默认本地安装不设此变量，切换模式须重新 `pod install`。安装模式连同架构写入源码指纹和结果身份；此模式的通过结果不能作为真机 IJK 验收。旧工程依赖原本未启用 IJK，不照搬新工程的 Pod 装配方式。
- OC 新旧工程主 target 的 Debug / Release 均启用 `GCC_PRECOMPILE_PREFIX_HEADER=YES`，复用各自既有前缀头。旧工程两配置 Objective-C / C 的实际 PCH 与代表源码编译已验证；新工程只改主 target 的工程设置，不改 PCH 正文或第三方源码。新工程 App 每配置保留 1800 秒真实进程限时，外层步骤为 65 分钟，容纳双配置与收尾；run 39101036560 中 Debug / Release 分别以 1172.87 / 1167.19 秒成功结束。新工程验证证据为实际配置解析及端到端成功，`-quiet` 日志未直接展示 PCH 编译命令，不据此声称已抓到该命令。
- Swift hosted 测试须避开首次通知授权弹窗：仅共享 Scheme 的 TestAction 配置 `JOBS_HOSTED_TESTS=1`，AppDelegate 在该环境跳过授权请求，正常启动沿用原流程；测试准备阶段等待真实 `UIApplication.applicationState == .active`，不以发送前台通知冒充实际前台状态，不削弱 Timer 的后台暂停行为或原有断言。来源：2026-10-18 同一任务的冷启动复现及完整 CI；状态：verified。
- Swift 与 OC 旧工程打包按 `${products_dir}/${SCHEME}.app` 精确取主 App，并核对 plist、非 `.xctrunner` Bundle ID、可执行名及文件存在；不能使用目录枚举到的第一个 `.app`。Swift 的 build-for-testing 会同时产生 UI 测试 Runner，workflow 绿灯仍须核对实际下载产物身份。来源：2026-10-18 错包实证及修复后的 ZIP 核验；状态：verified。
- Swift CI 使用 `.github/tests/JobsPodsUpgrade/validate_builds.rb --batch-pods` 一次构建全部自有根 target，默认逐 Pod 与 `--pods` 定向模式保留。系统 `plutil` 读取已安装 Pods 项目，按真实 UUID、native / aggregate 类型、产品类型和配置核对成员；临时 workspace / Scheme 仅写日志目录，不修改生成的 Pods 项目。批次真实成功退出后成员才通过，成员共享批次日志、独立耗时为 null；失败、中断、生成器失败均不得误报通过。`JobsAppIconRibbon` 的 macOS 生成器仍独立编译。来源：2026-10-20 用户授权提交推送的超时修复；状态：verified。
- 2026-10-20 Swift `477104b6` 的 [run 39406444088](https://github.com/JobsKits/JobsSwiftBaseConfigDemo/actions/runs/39406444088) 在 Xcode 26.3 完整成功：验收时 64 个自有根 target（63 native、1 aggregate），批次 549.67 秒、图标生成器 5.58 秒，整个 Pod 步骤 9 分 16 秒；182 项验证器断言及 27 项 hosted UIKit / Timer 测试通过、零失败，主 App / 测试包编译与产物上传通过。最终产物已下载，大小 177,176,631 字节且 SHA256 匹配 GitHub digest；内外 ZIP 完整性通过，唯一主 App 为 `JobsSwiftBaseConfigDemo.app`，Bundle ID 为 `com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo`，同名可执行文件、arm64 / IOSSIMULATOR、被引用的 Debug dylib、`Assets.car` 和 `JobsMicroAppLab.bundle` 均核实。此前两次已结束失败是逐 Pod 编译达到 60 分钟时限，不能归因于当时尚未加入的微应用 Demo。状态：verified；范围仅为上述提交与运行。
- OC 新工程 CI 的自有 Pod 编译按 Debug / Release 各启动一次批量构建，仍覆盖原有 109 个根 target（106 个 native、3 个 aggregate）及其依赖，不改默认逐 Pod 模式或独立组件测试阶段。批次记录真实进程、退出码及耗时，成员记录共享批次证据且耗时为 null；校验当前源码指纹、成员、配置、Scheme / workspace / command 绑定，失败、超时、进程状态未收集或源码变更均不得接受为成功。来源：2026-10-18 的 70 项批量结果门禁回归及 run 39101036560 的双配置构建成功；状态：verified，整条 workflow 的最终验收另列。
- OC 新工程对 ReactiveObjC 的适配只写入 Jobs 维护的 Podfile：保留继承的头搜索路径，加入上游 prepare 后的 `ReactiveObjC/extobjc`，并仅对 ReactiveObjC target 的 Debug / Release 设 `USE_HEADERMAP=NO`。不复制或修改第三方头，不私有化 RACExtra 的公共宏头，不扩大到其他 target；旧工程独立完整 CI 已通过，不因新工程批量依赖图的现象追加该开关。来源：2026-10-18 的隔离双配置完整 ReactiveObjC 编译、公共模块 / 头消费验证及上述 CI Pod 构建；状态：verified。实际 CI 中异常 header map 的具体产生原因尚未证实，不记录为已知 Xcode 缺陷或已证实的同名头冲突。
- 2026-10-18 分工程验收基线：Swift `6606ecb3` 的 [run 39087121259](https://github.com/JobsKits/JobsSwiftBaseConfigDemo/actions/runs/39087121259) 完整成功，27 项 hosted UIKit / Timer 测试零失败；OC 旧工程 `main` 的 `f88cc0041` [run 39101054898](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/39101054898) 完整成功。两者最终 ZIP 均核实为对应主 App、预期 Bundle ID、真实可执行文件、arm64 / IOSSIMULATOR 平台、Debug 动态库及主资源。状态：verified；范围仅为上述提交和运行。
- 同日 OC 新工程 `byPods` 的 `523997452` [run 39101036560](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/39101036560) 独立完整成功：109 个自有 Pod 的双配置批次及 218 份成员证据完整，49 组 XCTest 共 135 项执行全部通过、零失败零跳过，10 组 harness 全过，主 App 双配置成功；源码指纹一致，Keychain 实际宿主权限审计与三份静态审计通过。ReactiveObjC 前后配置 / 宏头 SHA 一致，真实编译响应文件无 header map / VFS 入口且保留原始头搜索路径。最终产物完整 SHA256 匹配 GitHub digest，内外 ZIP 校验通过，唯一主 App 为 `JobsOCBaseConfigDemo.app`、Bundle ID 为 `com.JobsOCBaseConfigDemo.byPods`，同名可执行文件、arm64 / IOSSIMULATOR、Debug 动态库及主资源均核实。状态：verified；不代表真机 IJK 或人工 App 功能验收。

- 2026-10-24 四工程的新 SDK 验收基线：范围为 `/Users/jobs/Documents/Github/JobsBaseConfig` 下文件头所列 OC 老工程、Swift UIKit、SwiftUI 与 Flutter，不包含独立目录的 OC 新工程。四条构建 / 回归 workflow 均明确选择 Xcode 27.1 / iOS 27.1 SDK，保留原最低系统版本；验收时四个 GitHub `main` 均与下列完整成功运行的 head SHA 一致。父仓 [d2dd577e329accdfdbab01594460a041dbf9cfa3](https://github.com/JobsKits/JobsBaseConfig/commit/d2dd577e329accdfdbab01594460a041dbf9cfa3) 已发布，远端四个 gitlink 与成功 SHA 一致，README 保留精确运行链接及未验收边界。状态：verified；这是精确提交基线，不覆盖并行任务尚未提交的工作区改动。
- 对应成功运行：OC `9b4d51561ed1d15304fdcc735857edaf6ab1dc17` 的 [run 40054135112](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/40054135112) 完整主 App 构建、打包及上传成功；Swift `80e7ec2f14ad83fe7599f767e0a2d1d09d573fa7` 的 [run 40049391857](https://github.com/JobsKits/JobsSwiftBaseConfigDemo/actions/runs/40049391857) 覆盖 64 个自有 Pod、主 App / 测试包及 27 项 hosted 测试，零失败；SwiftUI `17c8bba89bb2a084eee23d51c37842abd281e5ec` 的 [run 40050717252](https://github.com/JobsKits/JobsSwiftUIBaseConfigDemo/actions/runs/40050717252) 覆盖 Debug / Release 完整 App；Flutter `76f061460d9ccb1a454685c140174305c779a204` 的 [run 40049224954](https://github.com/JobsKits/JobsFlutterBaseConfigDemo/actions/runs/40049224954) 覆盖明确清单内的 Dart 分析、21 项回归与默认入口的完整 iOS Simulator App，不代表教学示例全仓分析或全部测试均通过。OC 另有 [协议图 run 40049466303](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/40049466303) 成功，其全部触发输入至上述 OC 提交保持不变；四仓已提交且启用的 workflow 共五份，均有对应成功记录。来源：本任务 GitHub 运行、远端分支与独立只读复核；状态：verified。
- OC 老工程对 SDK 27.1 的依赖兼容只在 Jobs 维护的 Podfile 中，将 `ZFPlayer` 与 `AFNetworking` 两个 target 的 `CLANG_ENABLE_MODULES` 设为 `NO`，保留公共 modulemap / `DEFINES_MODULE` 及消费者模块编译；原版第三方源码不修改。两个完整 framework 与启用模块的消费者编译链接均已验证，最终由上述完整 App workflow 复验通过；不把此开关扩大到其它依赖。Jobs 自有布局代码若经过返回父类的 DSL 后调用子类方法，应从原有强类型对象分开调用，保留执行次序；不能只检查新加的相邻调用，须追溯整条链的已有前缀。来源：本任务 Xcode 27.1 的真实编译失败、原版依赖探针及修复后的 CI；状态：verified。
- 上述四工程最终 App 产物均已真实下载：外层 SHA256 与 GitHub digest 一致，内外 ZIP 完整性通过，预期主 App 身份、可执行文件、arm64 Simulator 架构及 Mach-O / plist 中的 SDK 27.1 均已核验；SwiftUI 的 Debug / Release 分别验包，Flutter 另含 x86_64。OC 主包为 `com.JobsOCBaseConfigDemo`，不能混同 OC 新工程的 `.byPods` 包；Swift 为 `com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo`，SwiftUI 为 `com.jobs.jobsswiftuibaseconfigdemo`，Flutter 为 `com.example.jobsFlutterBaseConfigDemo`。来源：2026-10-24 对应成功运行的原始 artifacts、校验摘要与实际解包检查；状态：verified。
- Duo 验收边界：上述构建 / 自动回归不等于闭合、半折、展开与左右分屏的实际姿态交互均通过；本地 Duo 模拟器启动曾报 `Data Migration Failed`，完整原生姿态体验仍未验收。折痕保留区、铰链特效、相机双屏及 App Store 截图 / 上架不属于本轮基础动态布局基线。来源：本任务实际运行与交付范围；状态：verified（失败现象及验证边界）。

## 六十二、<span id="microapp-learning-demos">三工程微应用教学 Demo</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-19 根据 iOS 招聘要求明确提出，2026-10-21 根据截图修复布局；状态：confirmed（教学范围与交付约束）、verified（下述各轮明确列出的编译及交互范围）；创建：2026-10-19；更新：2026-10-21。适用范围为本笔记第一节的 OC 新工程、OC 老工程和 Swift UIKit 基础工程。
- 三侧各提供 5 个独立 VC，分别展示微应用 / 微程序容器、多账户 / 多会话、[**mPaaS**](https://help.aliyun.com/zh/product/49548.html) 本地平台适配、逻辑沙箱和 [**PWA**](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps) 离线资源。界面必须有可操作能力；定义、演进、用法、接入步骤和真实限制直接写在相关代码注释中，简明扼要，不另建学习 `*.md`。本项目后续新增这类教学功能沿用三侧同轮覆盖和完整主工程可编译门禁。
- OC 新旧 Demo 均在各自工程根下的 `JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@MicroAppLearning/`，随附资源为该目录的 `Resource/JobsMicroLearning.bundle/`。Swift Demo 在工程根下的 `JobsSwiftBaseConfigDemo/主业务流程/VC/SubVC/Demo@微应用学习/`，资源为 `JobsSwiftBaseConfigDemo/Resources/JobsMicroAppLab.bundle/`。沿用原有主工程集成方式，OC 老工程不为教学示例新增 Pod 依赖。
- 教学边界：mPaaS 页是本地协议 / 适配练习，未接商业 SDK；“多开”演示同一宿主内账户和 Web 数据隔离，不克隆或运行其它 App；命名空间子目录是宿主逻辑隔离，不新增系统级沙箱。`file://` 加载的是 Native 离线包，不代表 [**Service Worker**](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API) 已注册；资源经同源可信 HTTP(S) 部署后才能另行验证真实 SW / Cache 行为。
- 2026-10-21 布局修复：微应用草稿表单明确保留 12 点间距并在窄屏换行；微应用和 PWA 自有本地网页按正文自然高度撑开，由外层页面滚动，不能用固定卡片高度裁切按钮。远程 PWA 保留独立可滚动视口；Swift 自动高度显式选择启用，不影响双会话容器。OC 新旧离线安装目录与两侧 Web 缓存版本更新为 v2，避免升级后继续加载旧布局。Swift 打开 HTTPS 前复用 `jobsDismissKeyboard()` 收起 URL 键盘，防止回退后的计数按钮被遮挡。此前交互 / 主题成功未覆盖这两处布局问题，不能据此替代控件完整可见与实际点击验收。状态：verified。
- 2026-10-21 复验基线：三工程完整 Debug、arm64、iOS Simulator 构建均成功，日志为 `/tmp/jobs-micro-layout-swift-final-build.log`、`/tmp/jobs-micro-layout-oc-new-final-build.log`、`/tmp/jobs-micro-layout-oc-old-final-build.log`。iOS 27.0 的 375×667 点最大辅助字号和 402×874 点正常字号下，三侧微应用 / PWA 均通过真实明暗按钮切换、表单间距 / 完整可见、草稿保存 / 非法参数拒绝及离线连续计数；三侧 HTTPS 实际失败后恢复本地包并继续计数通过，Swift 同时验证键盘已收起。OC 新旧 Demo 源码 / 资源一致，三份 App 的学习资源与源码校验一致。此轮只验收本地构建与 UI，Codex 未执行 Git 提交、推送或触发 CI；不扩展为 Release / 签名真机或商业 SDK 验收。
- 2026-10-19 最终验证范围：三工程 Debug、arm64、iOS Simulator 的完整主工程构建均为 `BUILD SUCCEEDED`，本机证据分别为 `/tmp/jobs-micro-swift-verified.log`、`/tmp/jobs-micro-oc-new-verified.log`、`/tmp/jobs-micro-oc-old-verified.log`；15 个 Demo 页面均启动成功。三工程均通过 Bridge 允许 / 拒绝、沙箱读写 / 越界、多账户数据隔离、mPaaS 打开路由及 Native 离线包状态检测的实际交互测试。
- 六组微应用 / PWA 页面通过实际按钮切换主题与截图复验，已修正 Swift 按钮配置背景未跟随主题及 OC 网页主题问题。两套 PWA Web 资源均在 [**Chrome**](https://www.google.com/chrome/) localhost 完成“在线注册 SW → 停止 HTTP 服务 → 普通重载并继续交互”验证；此结果只证明 Web 资源的真实 SW 离线行为，不表示 `WKWebView` 的 `file://` 模式运行了 SW。Release 构建和签名真机运行仍未验证；结论仅适用于本轮已列环境、页面与操作，不外推为全平台或所有功能保证，也不把此前 CI 成功提交的结论套用到当前未提交改动。

## <span id="jobs-toc-heading-64" data-jobs-toc="v2">六十三、四工程挂载脚本的交互完整性 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-24 发现 OC 的 `pod install` 挂载脚本交互减少，明确要求覆盖 OC 新旧、Swift UIKit 与 SwiftUI 工程整改；状态：confirmed（范围与交互要求）；创建 / 更新：2026-10-24。四工程绝对路径见本笔记第一节。
- 维护安装辅助脚本时必须逐项保护既有功能和用户选择，不能因为 Hook 标记、自动识别目录、默认离线或后台调度而静默绕过确认、安装 / 升级选择及危险操作授权。终端保留真实键盘输入；无 TTY、输入结束及取消不得默认为授权。自动化只读 / 跳过应明确可选，辅助任务失败必须如实显示，保留原 CocoaPods 安装结果。
- 按各工程真实集成维护：Swift UIKit 的 Flutter / FVM、SPM 和 Unity 功能继续保留；SwiftUI 原无这些挂载，不凭目录或其它工程清单擅自新增。自动定位已知工程路径可以保留，不为恢复确认强迫重复拖入目录。
- 用户同日明确补充 SwiftUI 真机 Run 构建后须在工程根目录创建 `build/真机.ipa`。沿用本笔记第四十九节的签名和唯一产物规则，主 App 的 `Save Build IPA` 必须位于资源复制等阶段之后；这属于主 App 构建阶段，不冒充整个 Scheme 或 App 运行结束回调。隔离脚本与工程配置检查不能替代真实真机 Run 验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
