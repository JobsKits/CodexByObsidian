---
type: project-memory
status: active
scope: JobsCommand-Flutter
created: 2026-10-23
updated: 2026-10-23
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
