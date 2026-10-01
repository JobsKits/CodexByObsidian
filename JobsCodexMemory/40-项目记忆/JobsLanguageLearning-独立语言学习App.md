---
type: project-memory
status: active
scope: JobsLanguageLearning
repository: /Users/jobs/Documents/Github/JobsLanguageLearning
source: 2026-10-01 用户明确要求从 Swift Demo 剥离语言学习并整合三个 Python 软件；当前工程文件与验证结果
confirmation: 用户确认项目目标；架构事实由工程核验
created: 2026-10-01
updated: 2026-10-01
tags:
  - codex-memory
  - project
  - swift
  - language-learning
---

# JobsLanguageLearning 独立语言学习 App

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 用户要求在系统桌面新建独立 [**Swift**](https://www.swift.org/) App，沿用 Jobs Swift 项目的架构与链式 UI，整合俄语、英语、日语三个成熟学习功能。

## 一、项目与来源边界

- 新工程最初创建在桌面，任务期间整体迁至 `/Users/jobs/Documents/Github/JobsLanguageLearning`；当前工程；打开 `JobsLanguageLearning.xcworkspace`，显示名“Jobs语言学习”。
- Swift 来源：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo` 的俄语语言学习模块与 JobsByPods 依赖基座。
- Python 功能来源：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/语言学习.py` 下 `JobsRussianTrainer.py`、`JobsEnglishWordBook.py`、`JobsKanji.py`。
- 日语源工程在提取后更名为 `JobsKanjiByJap.py/JobsKanjiByJap`；交付时原始词库与指南重新核验一致。来源清单同时保留提取时路径和现行位置，新 App 不依赖源文件夹路径。
- 新 App 启动直接展示三个 Cell 的 TableView；每个 Cell 进入独立学习页面。App 使用 Swift 原生实现，复用英语、日语离线语料，不携带 Python / Qt / Argos 运行时。
- 原 Swift 和 Python 工程保持原样，新 App 的 Jobs 公共库为独立快照；后续修改新 App 不默认回写来源工程。尚未创建 Git 提交或远端。

## 二、架构与持续维护

- `Podfile` 管平台与安装策略，`Podfile.deps` 管 `swiftAppCommon`、`byJobs`、target；使用 [**CocoaPods**](https://cocoapods.org/) 本地 Pods 和静态 frameworks。
- 用户于 2026-10-01 确认 `Podfile.deps` 的展示与安全挂载属于同一要求：依赖清单在 Xcode 呈现红色 Ruby 钻石图标的文件引用态，同时保持 Pods 工程完整。当前由 `Podfile` 的 `post_integrate` 自动维护 Pods 根组中与 `Podfile` 相邻的唯一引用，显式类型 `text.script.ruby`，不进入 Build Phase；保存后重开校验，失败恢复原工程并告警。Xcode 当前窗口已核验红钻、引用箭头与 Ruby 高亮，依赖清单已展开为逐条 `pod`；持续规则归属 `jobs-podspec` 1.6.1。
- 新业务 Pods：JobsLanguageCore、JobsRussianLearning、JobsEnglishLearning、JobsKanjiLearning，分别放在 `JobsByPods/<名称>@Pods`。`Core` 仅代码，`Resource` 保存数据及归属声明；一类型一同名目录，根级源码规则不建立重复 Core subspec。
- 用户于 2026-10-01 明确主业务控制器不属于 Pod：俄英日学习页、详情页、Cell / View 及日语翻译桥接共 14 份 UI 文件归 App 的 `Business`；三个语种 Pod 只保留课程 / 模型 / Repository / 资源，公开数据接口与资源 bundle 所有者同步。旧“App 只负责生命周期、导航与首页”结构已 `superseded`，由当前业务归属替代。UI 使用真实 JobsByUIKit 工厂、JobsSwiftDSL 链式配置、JobsCor / JobsFont 和 [**SnapKit**](https://github.com/SnapKit/SnapKit)。
- 词库由 Repository actor 读取只读 SQLite；查询绑定参数、分页并过滤旧请求。播放队列按页面独占，离开页面 / 失去活跃状态停止，并丢弃取消后的旧回调。
- 三态主题与按语种的语速、声音、重复次数、音量保存到沙盒。俄语页面快捷设置和通用设置使用同一存储。
- 2026-10-01 用户要求一处主题异常按全局问题修复。当前公共按钮配置背景通过 `byLearningBackgroundColor` 绑定 JobsThemeCenter，禁用文字使用次级语义色；日语富文本同时监听 UIKit 与主题中心，在颜色更新后重建。6 项单元测试、iPhone / iPad 各 4 项页面流程及手机例句 / 弹窗补充通过，覆盖三态主题、俄语矩阵与辅音选择、英日详情、红色振假名、系统深色与横屏；截图和日志见工程验证记录。19 个来源 Jobs Pod 快照保持一致，未回写原 Swift / Python 工程。
- 独立 App 的公共 `JobsLanguageBaseVC` 在 `viewDidAppear` 清除系统返回手势的默认代理限制，按导航栈深度启用屏幕边缘侧滑；根页面禁用。沿用原 Swift BaseVC 的处理，不修改来源快照或第三方导航框架。
- 代码按 [[10-用户画像/长期偏好#十三、OC / Swift 代码可读性|OC / Swift 代码可读性偏好]] 提行缩进；执行范围仅新 App 自有代码，不批量改写来源工程。
- 本次业务迁移和返回手势由 6 项单元测试、iPhone / iPad 各 5 项完整 UI 流程验证，新增用例实际从屏幕边缘拖动。58 份自有 Swift 正常提行缩进并通过语法检查；Skills 与 CodeSnippets 同步，第三方和 19 个来源快照保持原样。迁移目录时首轮 iPad 结果包保存中断，新位置复测成功，记录见工程验证记录。
- 快照范围、语料来源和校验分别记录在 `dependency-snapshot.json` 与 `resource-provenance.json`，验证结果见根 `验证记录.md`。不得以语言迁移为由改第三方源码。
- 用户于 2026-10-01 确认加入五端一次性构建产物工作流：主 App 末尾 `Save Build IPA` 输出 `build/真机.ipa` 或 `build/模拟器.ipa`，打包成功后先清空 build 全部内容再写入唯一新包；源 App / DerivedData 必须在 build 外。脚本、初始工程生成器和 README 同步，具体边界见 [[Jobs-iOS-仓库族#四十九、五端 iOS 一次性构建产物]]。

## 三、数据与设备边界

- 最低 iOS / iPadOS 18；支持 iPhone 与 iPad。真机签名需使用用户自己的开发 Team。
- 俄语课程保留 10 元音、21 辅音、210 组合，系统 TTS 不等于专业音素录音。
- 英语原库没有逐义例句关系，详情保留词条级关联说明；分级数据和来源再分发限制继承原软件。
- 日语保留读法 / 写法 / 词义限制、中文学习指南和红色振假名。未缓存中文使用 Apple Translation 真机下载语言包后生成，持久缓存到 Application Support 的 `JobsKanjiChinese.json`；界面不以英文释义兜底。
- 原语料缺项和自动中文 / 振假名歧义如实展示；系统声音与语言包下载必须真机验证，不把模拟器页面测试当作听音或翻译验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
