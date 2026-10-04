---
type: project-memory
status: active
scope: JobsLanguageLearning
repository: /Users/jobs/Documents/Github/语言学习
source: 2026-10-03 用户明确要求三端新增法语、西班牙语、朝鲜语拼读；架构与实现由当前工程核验
confirmation: 用户确认新增语言范围；架构事实由工程核验
created: 2026-10-01
updated: 2026-10-04
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

> 用户要求在系统桌面新建独立 [**Swift**](https://www.swift.org/) App，沿用 Jobs Swift 项目的架构与链式 UI，整合俄语、英语、日语三个成熟学习功能；2026-10-03 明确将法语、西班牙语、朝鲜语拼读扩展到原生、Flutter 和 Python 三端。

## 一、项目与来源边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 2026-10-04 用户明确移动端双向同步约束：iOS 出现的问题要在 Flutter 对应调整，Flutter 出现的问题也要在 iOS 对应调整；适用于搜索框位置、字号主次、列表布局等共同能力。
- 2026-10-04 用户要求德语提供与俄语同类的元音、辅音、组合拼读，覆盖原生 / Flutter / Python；原生使用 JobsGermanLearning 数据 Pod。首页现为八个入口，分级英语置顶；字母主字形应显著大于拉丁注音和 IPA。原生完整模拟器构建通过，Flutter analyzer / Python compileall 通过；页面和设备语音尚待验收。


- 2026-10-02 用户确认现行总仓路径为 `/Users/jobs/Documents/Github/语言学习`，远端为 [**JobsLanguageLearning**](https://github.com/JobsKits/JobsLanguageLearning)，分支 `main`；下设 `原生iOS版本`、`Flutter版本`、`Python版本`。替代下文历史工程路径及“尚未创建 Git 提交或远端”的旧状态。
- 用户明确本目录不使用码云；总仓与三个 Python 子仓只保留 GitHub 远端。`Python版本/JobsEnglishWordBook.py`、`Python版本/JobsKanjiByJap.py`、`Python版本/JobsRussianTrainer.py` 通过 `.gitmodules` 和 gitlink 管理，保持各自独立 Git 历史。大词库与原生演示视频使用 [**git-lfs**](https://git-lfs.com/)，构建及本地验证缓存不入库。

- 新工程最初创建在桌面，任务期间整体迁至 `/Users/jobs/Documents/Github/JobsLanguageLearning`；当前工程；打开 `JobsLanguageLearning.xcworkspace`，显示名“Jobs语言学习”。
- Swift 来源：`/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo` 的俄语语言学习模块与 JobsByPods 依赖基座。
- Python 功能来源：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/语言学习.py` 下 `JobsRussianTrainer.py`、`JobsEnglishWordBook.py`、`JobsKanji.py`。
- 日语源工程在提取后更名为 `JobsKanjiByJap.py/JobsKanjiByJap`；交付时原始词库与指南重新核验一致。来源清单同时保留提取时路径和现行位置，新 App 不依赖源文件夹路径。
- 原生首页原有三个 Cell；2026-10-03 增至七个入口，加入法语、西班牙语、朝鲜语和阿拉伯语拼读页。新 App 使用 Swift 原生实现，复用英语、日语离线语料，不携带 Python / Qt / Argos 运行时。
- 原 Swift Demo 不随本次修改；Python 的 `JobsRussianTrainer.py` 按用户本次要求加入三种语言，英语与日语 Python 子仓保持不变。新 App 的 Jobs 公共库仍为独立快照，后续修改不默认回写原 Swift Demo。尚未创建 Git 提交或远端。

## 二、架构与持续维护 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Podfile` 管平台与安装策略，`Podfile.deps` 管 `swiftAppCommon`、`byJobs`、target；使用 [**CocoaPods**](https://cocoapods.org/) 本地 Pods 和静态 frameworks。
- 用户于 2026-10-01 确认 `Podfile.deps` 的展示与安全挂载属于同一要求：依赖清单在 Xcode 呈现红色 Ruby 钻石图标的文件引用态，同时保持 Pods 工程完整。当前由 `Podfile` 的 `post_integrate` 自动维护 Pods 根组中与 `Podfile` 相邻的唯一引用，显式类型 `text.script.ruby`，不进入 Build Phase；保存后重开校验，失败恢复原工程并告警。Xcode 当前窗口已核验红钻、引用箭头与 Ruby 高亮，依赖清单已展开为逐条 `pod`；持续规则归属 `jobs-podspec` 1.6.1。
- 新业务 Pods：JobsLanguageCore、JobsRussianLearning、JobsFrenchLearning、JobsSpanishLearning、JobsKoreanLearning、JobsEnglishLearning、JobsKanjiLearning，分别放在 `JobsByPods/<名称>@Pods`。`Core` 仅代码，`Resource` 保存数据及归属声明；一类型一同名目录，根级源码规则不建立重复 Core subspec。
- 用户于 2026-10-01 明确主业务控制器不属于 Pod：语言学习页、详情页、Cell / View 及日语翻译桥接归 App 的 `Business`；俄法西朝课程 Pods 只保留课程模型，英语 / 日语 Pods 保存模型、Repository 与资源，公开数据接口与资源 bundle 所有者同步。2026-10-03 在 JobsLanguageCore 新增通用 `JobsLanguageSyllableCourse`，拉丁字母拼写组合、Unicode 韩文音节块及阿拉伯语字母与短元音符号共用课程模型；阿拉伯语课程由 App 配置，不增加专属课程 Pod。新语种复用 App 的拼读页面与选项页。UI 使用真实 JobsByUIKit 工厂、JobsSwiftDSL 链式配置、JobsCor / JobsFont 和 [**SnapKit**](https://github.com/SnapKit/SnapKit)。
- 词库由 Repository actor 读取只读 SQLite；查询绑定参数、分页并过滤旧请求。播放队列按页面独占，离开页面 / 失去活跃状态停止，并丢弃取消后的旧回调。
- 三态主题与按语种的语速、声音、重复次数、音量保存到沙盒。俄语页面快捷设置和通用设置使用同一存储。
- 2026-10-01 用户要求一处主题异常按全局问题修复。当前公共按钮配置背景通过 `byLearningBackgroundColor` 绑定 JobsThemeCenter，禁用文字使用次级语义色；日语富文本同时监听 UIKit 与主题中心，在颜色更新后重建。6 项单元测试、iPhone / iPad 各 4 项页面流程及手机例句 / 弹窗补充通过，覆盖三态主题、俄语矩阵与辅音选择、英日详情、红色振假名、系统深色与横屏；截图和日志见工程验证记录。19 个来源 Jobs Pod 快照保持一致，未回写原 Swift / Python 工程。
- 独立 App 的公共 `JobsLanguageBaseVC` 在 `viewDidAppear` 清除系统返回手势的默认代理限制，按导航栈深度启用屏幕边缘侧滑；根页面禁用。沿用原 Swift BaseVC 的处理，不修改来源快照或第三方导航框架。
- 代码按 [[10-用户画像/长期偏好#十三、OC / Swift 代码可读性|OC / Swift 代码可读性偏好]] 提行缩进；执行范围仅新 App 自有代码，不批量改写来源工程。
- 本次业务迁移和返回手势由 6 项单元测试、iPhone / iPad 各 5 项完整 UI 流程验证，新增用例实际从屏幕边缘拖动。58 份自有 Swift 正常提行缩进并通过语法检查；Skills 与 CodeSnippets 同步，第三方和 19 个来源快照保持原样。迁移目录时首轮 iPad 结果包保存中断，新位置复测成功，记录见工程验证记录。
- 快照范围、语料来源和校验分别记录在 `dependency-snapshot.json` 与 `resource-provenance.json`，验证结果见根 `验证记录.md`。不得以语言迁移为由改第三方源码。
- 用户于 2026-10-01 确认加入五端一次性构建产物工作流：主 App 末尾 `Save Build IPA` 输出 `build/真机.ipa` 或 `build/模拟器.ipa`，打包成功后先清空 build 全部内容再写入唯一新包；源 App / DerivedData 必须在 build 外。脚本、初始工程生成器和 README 同步，具体边界见 [[Jobs-iOS-仓库族#四十九、五端 iOS 一次性构建产物]]。

## 三、数据与设备边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 最低 iOS / iPadOS 18；支持 iPhone 与 iPad。真机签名需使用用户自己的开发 Team。
- 俄语课程保留 10 元音、21 辅音、210 组合，系统 TTS 不等于专业音素录音。
- 英语原库没有逐义例句关系，详情保留词条级关联说明；分级数据和来源再分发限制继承原软件。
- 日语保留读法 / 写法 / 词义限制、中文学习指南和红色振假名。未缓存中文使用 Apple Translation 真机下载语言包后生成，持久缓存到 Application Support 的 `JobsKanjiChinese.json`；界面不以英文释义兜底。
- 原语料缺项和自动中文 / 振假名歧义如实展示；系统声音与语言包下载必须真机验证，不把模拟器页面测试当作听音或翻译验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>


## 四、Flutter 独立版本 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户于 2026-10-02 明确要求制作 JobsLanguageLearning 的 Flutter 版本；当前工程随总仓位于 `/Users/jobs/Documents/Github/语言学习/Flutter版本`。旧桌面工程路径为历史位置。
- Flutter 工程独立复制 Swift 工程的完整英日词库、中文种子、学习指南与版权文件，不依赖来源目录运行；来源校验在工程 `resource-provenance.json`。俄语、英语、日语分别有独立页面，日语基础发音包含五元音、14 辅音行、65 有效组合与鼻音。
- 生成 Android / iOS / macOS / Windows 宿主；按语种持久化语音设置、三态主题和页面 / 后台停止播放。macOS 按需中文接入 Apple Translation；移动端接入 ML Kit；Windows 保留内置中文与缺译提示。平台实际验证以工程 `验证记录.md` 为准，不把生成宿主当作已构建或真机验收。
- 2026-10-03 按用户要求增加法语、西班牙语、朝鲜语拼读入口与独立 `fr-FR` / `es-ES` / `ko-KR` 系统语音设置；韩文按 Unicode 规则由 19 个声母、21 个元音及可选收音构成音节块。

## 五、跨端新增拼读课程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 法语课程使用 6 个基础元音字母、20 个辅音字母及 `ch / gn / ph` 拼写行，`q` 只提供 `que / qui`；西班牙语使用 5 个元音、22 个辅音字母及 `ch / ll` 行，提示 `c / g / h / q` 和地区读音规则。两者是基础拼写组合试听，不是完整 IPA 或人工录音。
- 朝鲜语课程包括 19 个声母、21 个元音、27 种收音与无收音。三端共用音节块学习方式，实际词中收音仍受连音、音变影响。
- 原生、Flutter、Python 三端均使用对应语言系统 TTS；缺少语音时明确提示，不跨语种回退。2026-10-03 验证为 Dart analyzer、Python `compileall`、Swift 语法解析与课程模型类型检查、CocoaPods 安装通过；没有运行测试、完整 iOS 构建或设备听音。Python 仓库已有 `.app` / `.dmg` 仍是原俄语版构建产物，尚未重打包。
- 用户于 2026-10-03 确认跨语言的注音呈现方向：面向中文学习者，所有非英语拼读都要并列显示可读的拉丁读音；日语用 Hepburn，俄语与阿拉伯语用拉丁转写，韩语用修订罗马字，法语与西班牙语保留其拉丁拼写并补充宽式 IPA，非英语课程可再附 IPA 辅助辨音。阿拉伯语课程以现代标准阿拉伯语常见入门音值配置 28 个辅音音值和三个短元音符号 `َ / ِ / ُ`，显示简化拉丁转写与 IPA；长元音、词形变化、连读和地区口音不在课程范围。
- 后续验证：原生 iOS Debug 模拟器构建（arm64 / x86_64）通过；Dart 修改文件分析及两个 Python 工程 `compileall` 通过，`git diff --check` 通过。原生构建报错已修复；构建前后 `build/真机.ipa` 哈希不变。本轮未跑 XCTest、Flutter 宿主构建、Python UI 或设备听音。验证详情见三个工程的 `验证记录.md` / `验证结果.txt`。
