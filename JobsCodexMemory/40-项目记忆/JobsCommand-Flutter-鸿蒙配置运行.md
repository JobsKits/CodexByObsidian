---
type: project-memory
status: active
scope: JobsCommand-Flutter
created: 2026-10-23
updated: 2026-10-29
source: 用户于2026-10-23明确要求新增独立Flutter鸿蒙配置运行脚本，并指定JobsHarmonySimulatorCreator作为参考
confirmation: confirmed
---

# Flutter／鸿蒙独立配置运行

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、工程与固定边界](#paths)
- [二、实现与验证基线](#implementation)
- [三、双端鸿蒙打包与关联入口](#harmony-dual-artifacts)
- [四、双端独立模拟器与鸿蒙运行入口](#dual-simulator-entries)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

用户要求在已有 [**Flutter**](https://flutter.dev/) 配置运行入口之外，额外提供独立鸿蒙入口。参考源码为 `OS@Extension/MacOS@Extension/JobsHarmonySimulatorCreator`，原 Flutter 包及其已有未提交修改保留。

## 一、<span id="paths">工程与固定边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Flutter`。
- 新包：`MacOS/配置相关/【MacOS】⚙️一键配置Flutter／鸿蒙项目至运行.command/`，同名 `.command`、README、Scripts 和 Tests 独立交付；半角 `/` 为路径分隔符，文件名使用全角 `／`。
- 只针对已有含 `pubspec.yaml`、`lib/` 的可写工程；固定鸿蒙 SDK 与工程级 FVM，不执行全局 Flutter 切换。其它已有 FVM 绑定须精确 `YES` 才切换，缺 `ohos/` 也须精确 `YES` 才生成。
- 复用参考模拟器业务快照，运行时不依赖外部参考目录。Apple Silicon 原生 Mac，真机可只准备工具；许可本人阅读同意，签名与插件适配仍需按工程处理。

## 二、<span id="implementation">实现与验证基线</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 2026-10-23 已实现独立包：CPF-Flutter 固定 tag `3.35.7+ohos-1.0.5`（远端ref已核实）、FVM custom SDK 隔离缓存、DevEco/CLT与配套工具、JDK17检查、工程环境与编辑器配置、安全合并和设备选择运行。
- 缺工具/镜像的下载、来源、固定摘要与许可沿用当前参考源码；不以 Vault 中该参考早期“不自动下载”的旧基线描述此新包。
- SDK绑定失败或信号中断恢复 `.fvmrc`、FVM元数据、SDK链接和 `.fvm/versions`；真实源码目录与符号链接边界检查失败停止。恢复失败保留快照。
- `--help` / 主入口 `--check` 无交互可用，后者只盘点候选文件，不联网或运行工具，不代表环境健康通过。动态设备列表只选鸿蒙，空列表可重载或创建。
- 57项主流程/配置测试、58组模拟器回归（457断言）、三份zsh语法与新增文档链接/字节往返/临时索引转换通过。真实HAP编译、签名、安装和热重载未执行；未提交或推送。

## 三、<span id="harmony-dual-artifacts">双端鸿蒙打包与关联入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-28 明确要求补齐 WindowsOS / MacOS 鸿蒙安装包，并强调一次同时输出 `.hap` 与 `.app`，随后指定 `OS@Extension` Flutter 工程右键菜单及 `SourceTree.command` 一起接入；状态：需求 confirmed；适用范围：三个仓库的鸿蒙打包入口；创建 / 更新：2026-10-28。
- 独立包位于 `MacOS/打包相关/【MacOS】📦双击打包Flutter.Harmony.command/` 与 `WindowsOS/打包相关/【WindowsOS】📦双击打包Flutter.Harmony.ps1/`，默认 release，顺序解析依赖、构建 HAP、构建 APP；双包均成功且最终同时存在非空产物才整体成功。签名沿用工程，不自动安装到设备或上传商店。
- OS 右键标题统一“📦 打包鸿蒙（HAP + APP）”；Mac 复用 `package-ohos`，Windows 新叶 `build-harmony`，点击前复核当前根目录和鸿蒙工程清单，快捷入口固定工程 FVM、release 与双包，无 flavor。需要通过既有 GUI 安装 / 更新才能部署修改，源码验证不等同于真实系统菜单已更新。
- Sourcetree 沿用两端 `.ohos` 动作与用户标题，双击默认 all，菜单默认 release / all；运行副本与备灾副本的变更需同任务精确同步。旧“默认只生成 HAP、APP 按需选择”口径由本节替代（superseded），显式 CLI 单包选项仍可作为兼容能力。
- 验证边界：使用假 SDK / 临时工程验证双包顺序、失败停止及第二步移除首包时失败；真实 Flutter / DevEco 编译、签名、设备安装与 Windows Explorer 原生加载需目标环境验收，不得写成已完成。

## 四、<span id="dual-simulator-entries">双端独立模拟器与鸿蒙运行入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-29 连续明确补齐要求；状态：需求 confirmed；适用仓库为 `/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Flutter` 的 `MacOS/运行` 与 `WindowsOS/运行`，截图或举例使用 Mac 不代表只做单端。
- 两端均应有独立“初始化 Android 模拟器”“初始化鸿蒙模拟器”“打开已实例化的鸿蒙模拟器”“运行 Flutter 项目（鸿蒙模拟器）”入口。iOS 只用于 Mac 侧交互参照，不在 Windows 增加 Apple 专属功能。
- 各入口按自身位置寻找随包资源，可整体复制改名后运行，不依赖 `OS@Extension` 参考源码路径。复用已有工具链与设备；新建、必要下载和许可按脚本声明确认，取消不创建、不覆盖原实例。
- 鸿蒙运行先验证工程 `ohos/` 和所选 Flutter SDK 的 HAP 能力，工程 FVM 缺失或不匹配时停止；不静默换成普通 Flutter，不重写全局 SDK。启动已有 / 缺失时初始化，等待受支持的鸿蒙模拟器进入 Flutter 列表，再选择设备运行。
- 实现与验证（2026-10-29）：八个入口及就近 README 已补齐；Windows 按实际依赖裁剪随包内核，四包复制改名、无关工作目录的 Plan / Check 和资源一致性共 41 项通过。Mac 新入口 12 组 / 46 断言、Windows 新行为 12 断言通过，脚本语法与文档往返通过。鸿蒙启动使用独立后台进程，避免官方 CLI 驻留阻塞后续设备等待；真实 SDK 下载、设备创建 / 启动、HAP 安装和 Windows 桌面均未实机验收，未提交推送。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
