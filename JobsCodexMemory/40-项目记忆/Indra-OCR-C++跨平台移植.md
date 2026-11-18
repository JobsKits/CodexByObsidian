---
type: project-memory
status: active
scope: indra-ocr-port
repository: /Users/jobs/Documents/GitHub/OCR
source: 2026-11-16 用户明确改用Rust重写、指定OCR工程与JobsBaseConfig各宿主集成、独立Demo验收及README致谢
created: 2026-11-16
updated: 2026-11-18
tags:
  - codex-memory
  - project
  - ocr
---

# Indra OCR Rust 跨平台移植

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

保存已确认的项目目标与源码定位，评估建议和实际实现必须分开。

## 一、<span id="confirmed-scope">已确认目标与边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- <span id="core-seed-layout-20261117">OCR仅作为源码核心种子</span>：来源：用户2026-11-17明确纠正项目定位，状态 confirmed；适用 `/Users/jobs/Documents/GitHub/OCR`。它不是传统前后端软件工程，不套用从零到一的需求／代码／部署／交付目录模板。核心唯一入口为 `JobsOCR/`，内含算法、C头、tests、Models、许可与可复用Apple图片桥；核心README集中原理、参数、代码地图、限制和Apple原生离线OCR详细对比，根README负责各端使用／源码接入。禁止将自建`.a/.o`等库或SDK包作为开源分发物；宿主使用时在仓外编译，模型保留独立许可。此前“交付/Apple源码SDK包为默认入口”的目录／交付形态仅此部分 superseded，五外部宿主原有自包含源码不变。用户同日要求核对后合并并删除临时归档：独有MacOS示例源码归JobsOCR/Examples/MacOS，ORT来源／旋转夹具／历史证据保全至本工程；5候选43清单文件与真实宿主及后继提交核对、328保全文件逐字节检查后，已整体删除同级OCR-本地归档-20261117。当前实现和验证查本仓 `项目相关报告/README.md`；目录整理快照的7算法文件与模型SHA保持，21契约、新位置扫描CLI35行及中文图禁网进程已验（scoped-verified），不外推全部宿主或随后并行算法已重验。用户同日确认另一聊天正在优化算法，并要求最终合成同一个OCR工程；共用当前JobsOCR源码，禁止另建第二套核心／恢复旧目录，最终算法以合并回归为准；同日合并核对的8个src摘要与30核心契约／8图端到端／35行扫描已验版本一致，模型不变，Mac示例4组纯契约通过，各消费App本轮重建另验。Apple Vision同样离线；可证实亮点为开放可修改管线／跨平台合同，不宣称重写必然更准或全面更快。

- <span id="source-delivery-20261116">五Demo源码交付与OCR页面改进</span>：来源：用户2026-11-16本轮确认，状态 confirmed；范围OC新旧／Swift UIKit／SwiftUI／Flutter。自建Rust源码、Cargo.lock、C头及测试随各仓，自建libJobsOCRCore.a本地生成且不入仓；六SDK副本不得依赖外部开发机OCR路径，ORT官方依赖下载及模型各自保留来源／许可。五Demo需通过各自实际提交的GitHub工作流。页面追加相机拍照（相册保留），修白天按钮对比、整页滚动而非结果独立滚动、结果快捷复制、紧凑开始／取消动作；默认样本、真实离线识别、取消治理、十语三主题保留。当前代码和验证分别以共享源码交付报告及五宿主资产表为准。2026-11-18限定交付基线（scoped-verified）：五宿主已提交版本的必需GitHub工作流及官方模拟器成品验收闭环通过，OC新旧正式App原件正常启动已验；新OC的CI按run/attempt隔离并回收已结束缓存、提前保全原始结果，通用规则归现行jobs-github-actions。真机实拍、完整十语／设备矩阵与工作区并行混排新版核心仍须各自验收，本轮绿灯不覆盖未提交的新算法。

- 用户最初要求C／C++通用实现；同日明确“用rust来写吧”，原核心语言决定标为 `superseded`。现行目标为 [**Rust**](https://www.rust-lang.org/) 离线通用核心，通过稳定C ABI接入各系统；iOS／Android／HarmonyOS属于明确范围。
- 用户指定源码目录为 `/Users/jobs/Documents/GitHub/3rd/indra`，并要求使用 [**REA**](https://github.com/morluto/rea) 辅助分析。此目录是第三方参考源码，不等于已经创建自有 SDK 实现工程；本轮未修改该目录。
- 用户指定自有实现目录 `/Users/jobs/Documents/GitHub/OCR`；第三方源码仍为只读参考。验收重点是iOS真机、iOS模拟器、MacOS桌面应用共用核心，不能以编译通过代替Demo启动与实际识别。
- 用户明确要求集成OC新旧／Swift UIKit／SwiftUI／Flutter；新封装分别进入各宿主 `JobsByPods`／`JobsByPubs`，旧OC直接放主工程，不新增Pod。各宿主单独OCR Demo，入口、资产盘点与实际验证同步到项目报告。
- 根README必须致谢 [**Indra OCR**](https://github.com/datalab-to/indra)，明确灵感来源。复用模型与原算法的归属和独立许可不因重写而改变。
- 最低系统、复用模型和具体后端为实施选择，不追认为用户原始指定。当前AppleSDK最低iOS15.1／MacOS14，模型固定官方v1.1.0并随包预置。

## 二、<span id="verification">评估状态</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 2026-11-16（source-verified）：已只读审阅本地提交 `ca81e18f7403435a3545c8c8ae9c4a1cecdd32a4`，检查时工作树干净。包声明 1.1.2，但与 PyPI 1.1.2 wheel 存在差异；后续以提交和模型逐文件哈希建立基线。
- 初次评估时仅完成源码审阅；此状态已由下节实现证据更新，不继续把旧评估当成当前状态。共享源码不等于同一二进制，HarmonyOS原生后端仍需目标系统验证。
- 初次评估时REA未启动：会话无入口，受管CLI未装、Node缺库；这仅是早期观测，现已 `superseded`。同日后续本机REA6.9.0 CLI实际可调用，补做PyPI wheel及自有MacOS App静态容器清单，Evidence归OCR测试目录。完整源码目录不属于该artifact入口支持对象，算法分析仍基于直接源码审阅；未启动原生反编译引擎，也不把容器清单称为反编译。

## 三、<span id="rust-implementation">Rust实现与验证基线</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 2026-11-16（scoped-verified）：Rust实现检测／方向／裁行／多语言识别／CTC语言模型／布局及C ABI；产品不依赖Python，Apple桥静态合并ONNX Runtime。13个模型／元数据／许可文件已按固定版本及SHA256核对；本地Indra源码仓库不含这些权重，下载模型不等于重下源码。
- 21项核心契约实际通过。MacOS优化CLI与通用桌面App均对韩文／英文样例实际识别成功；通用App已在ARM64运行35行并实看文字框。x86_64构建与签名通过，不声称Intel实际运行。当前完整主题／语言／选图交互仍须验证。
- 五个Apple架构核心已编译，Swift UIKit／SwiftUI／OC新旧／Flutter五宿主实际模拟器识别35行通过，与MacOS同图文本SHA完全相同。六个Apple消费包的库与封装摘要均与正式SDK一致。旧OC以同一xcodeproj内自有静态库target隔离旧全局PCH，不新增Pod，源码／框架／资源仍归旧主工程。
- Android ARM64已用现有NDK r28c／API24真实链接`.so`／`.a`并验证6个C导出与16KiB LOAD对齐；未含ORT／JNI／App、未设备推理。HarmonyOS／Linux／Windows为同源离线 `cargo check --lib` 通过；OHOS当前缓存缺完整Native工具链，不视为系统链接或推理通过。
- SwiftUI真机目标编译／链接通过，但既有IPA导出拒绝无签名，总exit65；留档App不能直接安装、真机当前不可用。Flutter官方冷包及唯一run_id回执已通过；完整十语三主题／选图／取消等交互分别记录已验与待核。最新状态以OCR及各宿主 `项目相关报告/` 为准，不把此阶段观测当成长期全平台验收结论。
- 图片OCR为当前实现范围，PDF文字层、数学识别、学习型表格头和图片块尚未实现，不宣称原版所有功能完全等价。
- 2026-11-17（scoped-verified）：应用户询问完成本机Vision accurate revision3与现有Rust构建的两张PNG对照，端到端外层计时区分首轮与同进程预热；当前CPU Rust热耗时较低，Vision在合成中文混排行保留了Rust遗漏的前缀，但有大小写错误。原始逐轮数据、一次Vision首次初始化约33秒的波动及方法边界保存在 `/Users/jobs/Documents/Codex/2026-11-16/ocr-pip-install-indra-ocr/outputs/Vision对照/对照说明.md`；不代表一般准确率、iPhone速度／功耗／内存，也不构成用户确认切换引擎。本轮未改App／SDK源码。

- <span id="mixed-script-fix-20261117">2026-11-17混排路由修正</span>（来源：用户要求修正遗漏“跨平台”；状态 scoped-verified）：在同一个 `OCR/JobsOCR` 核心增加墨迹覆盖／低置信度片段局部脚本复核与有界CJK候选重选，LM最终文字及CTC位置同步，模型14文件含manifest摘要未变。MacOS ARM64实际30项核心测试＋8图E2E（4图整行精确控制）通过，原遗漏／前中后缀均恢复；原35行扫描的lines/text与基线逐项相同。前一条Vision比较属于修正前基线，不能再用旧漏字或旧耗时代表当前核心。原始结果和最终源码摘要以 `/Users/jobs/Documents/GitHub/OCR/项目相关报告/混排回归/README.md` 为准；六消费方各24个源文件／锁文件／头／测试／夹具已与唯一核心逐项核对一致；新版App实际重建／运行另验，本次不借旧宿主验收宣称新算法全端通过。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
