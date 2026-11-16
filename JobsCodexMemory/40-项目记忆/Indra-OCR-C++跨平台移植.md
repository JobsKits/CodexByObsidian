---
type: project-memory
status: active
scope: indra-ocr-port
repository: /Users/jobs/Documents/GitHub/OCR
source: 2026-11-16 用户明确改用Rust重写、指定OCR工程与JobsBaseConfig各宿主集成、独立Demo验收及README致谢
created: 2026-11-16
updated: 2026-11-16
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

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
