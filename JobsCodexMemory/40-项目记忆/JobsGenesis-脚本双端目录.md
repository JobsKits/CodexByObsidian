---
type: project-memory
status: active
scope: JobsGenesis-platform-scripts
repository: /Users/jobs/Documents/Github/JobsGenesis
source: 2026-10-23 用户明确要求五个脚本仓按 MacOS 和 WindowsOS 划分
created: 2026-10-23
updated: 2026-10-23
tags:
  - codex-memory
  - project
  - scripts
  - windows
---

# JobsGenesis 脚本双端目录

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、适用范围](#jobs-toc-heading-2)
- [二、平台功能与命名](#jobs-toc-heading-3)
- [三、SourceTree 与记录器边界](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> 用户确认的脚本平台边界；后续维护按实际平台目录定位，避免恢复成混排布局。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、适用范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 根目录：`/Users/jobs/Documents/Github/JobsGenesis`。
- 五个独立子仓：`JobsCommand@Flutter`、`JobsCommand@Gits`、`JobsCommand@Others`、`JobsSh.sh`、`SourceTree.command`。
- 各根下使用 `MacOS/`、`WindowsOS/`；原脚本包、分类目录、README 与资源整体迁入 `MacOS/`，仓根 Git 元数据和 Markdown 目录过滤器留在原处。
- Windows 对照原功能使用原生 PowerShell `.ps1` 与可双击 `.cmd`；中文源码带 UTF-8 BOM 兼容系统 Windows PowerShell 5.1。依赖随本仓携带，不硬编码当前电脑路径。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、平台功能与命名 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户明确排除 Windows 的 iOS 模拟器脚本。Xcode、iOS/IPA 构建、CocoaPods 和 macOS 系统专属操作也按实际平台能力列明排除或原生等价适配，不能提供假装可运行的入口。
- 混合入口保留可在 Windows 执行的 Android、Web、Windows、鸿蒙及通用 Git/文件工具功能；各仓 README 维护逐项对照与验证范围。
- 因 Windows 检出会检查整个仓，`MacOS/` 内路径同样不得含 Windows 非法 ASCII `:<>"|?*`。只对命中的非法字符作全角最小改名，并同步引用及精确目录清单。
- 本任务未授权业务仓提交、推送或远程发布；本地脚本落盘及隔离验证不代表 Windows 实机已验收。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、SourceTree 与记录器边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- SourceTree 运行副本根仍为 `/Users/jobs/SourceTree.command`，动作目标迁至其 `MacOS/包名/脚本名`；备灾根仍在本仓同名子仓。双副本同步和菜单备份规则继续适用，详见 [[SourceTree-脚本体系]]。
- Windows SourceTree 提供当前用户 `customactions.xml` 安装/精确恢复入口，菜单动作转交独立终端确认，危险操作精确输入 `YES`。
- Windows 键盘记录器必须可见、手动开始/停止、会话归属清楚；入口或终端结束后停止监听，不允许关闭后继续写入或重建输出目录。原已确认约束见 [[JobsKeyboardRecorder-运行边界]]。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
