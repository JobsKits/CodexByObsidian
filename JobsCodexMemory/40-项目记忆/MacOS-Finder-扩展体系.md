---
type: project-memory
status: active
scope: macos-finder-extensions
repository: /Users/jobs/Documents/Github/JobsGenesis/MacOS@Extension
created: 2026-09-13
updated: 2026-09-13
tags:
  - codex-memory
  - project
  - macos
  - finder-extension
---

# MacOS Finder 扩展体系

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 记录 `MacOS@Extension` 中 Finder 右键功能的工程粒度、安装选择和文档表达约束。

## 一、功能与工程边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-09-13 明确确认。一个 Finder 右键菜单功能应视为一个独立安装单元；新增能力优先采用“一项右键功能对应一个工程”的结构。
- 现有 `JobsTerminalOpener` 是兼容例外：同一 App + Finder Sync Extension 暂时承载 `用终端打开`、`pod install`、`flutter pub get`、`CodeGraph 代码地图` 和 `空白 Commit 并 Push` 五项功能，但必须把五项分别展示为复选框，不能只提供整个工程的总开关。
- 已替代（2026-09-13）：功能组合只在构建时固化、变更必须重新安装的旧方案不再使用。构建值只作为首次运行默认值；安装器和已安装 App 共用持久化配置，Finder 扩展每次生成菜单时读取当前选择。
- `空白 Commit 并 Push` 只对普通文件夹提供菜单；Git 命令健康、当前文件夹是否位于 Git 工作树、当前分支、暂存区和推送远程必须全部在 Terminal 内校验。暂存区非空时不允许创建所谓空白 Commit。

## 二、安装与文档约束

- 根安装器使用 macOS 原生复选框 UI，逐项选择全部右键功能，并提供“全部安装”和“取消”；同一工程中的多个已选功能只构建、注册一次。
- `JobsTerminalOpener` App 必须在主窗口提供本工程全部功能的复选框，一项功能独占一行并显示适用条件，同时提供保存、全选和全不选；保存后重新打开 Finder 右键菜单即可生效，不要求重新编译。
- `JobsTerminalOpener` 主窗口必须允许拖动缩放并设置合理最小尺寸；内容从顶部开始排布，高度不足时使用垂直滚动承接，标题、功能项和底部说明均不得被标题栏或窗口边界裁切。
- 仓库根 README 与多功能工程 README 的前言区域必须醒目、简洁地列出所含右键功能，并明确哪些功能可以独立勾选。
- 安装器收到未知功能标识时立即停止；功能选择、工程去重、构建参数、扩展菜单过滤和安装结果汇总必须保持同一映射。

## 三、验证基线

- AppleScript 选择器使用 `osacompile` 做语法编译。
- 根安装脚本使用 `zsh -n`，并分别验证全选、部分选择和未知标识解析。
- `JobsTerminalOpener` 使用部分功能集合隔离构建，随后读取宿主 App 与扩展产物的 `JobsTerminalEnabledFeatures`，确认首次运行默认值与勾选项完全一致；共享配置读写还要同时进入两个 target 并通过真实构建。
- 普通验证不得运行完整安装流程，避免注册扩展、重启 Finder 或触发真实依赖安装。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
