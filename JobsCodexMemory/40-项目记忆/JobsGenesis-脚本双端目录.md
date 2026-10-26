---
type: project-memory
status: active
scope: JobsGenesis-platform-scripts
repository: /Users/jobs/Documents/Github/JobsGenesis
source: 2026-10-23 用户明确要求五个脚本仓按 MacOS 和 WindowsOS 划分
created: 2026-10-23
updated: 2026-10-26
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
- [四、Windows 本机与虚拟机测试计划](#windows-compatibility-testing)
- [五、JobsCommand@Others 大文件历史与双远端同步](#others-git-history-cleanup)

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
- 来源：用户于 2026-10-26 明确要求“一个功能，装在一个文件夹里面，文件夹里有 `*.cmd` 和 `*.ps1`，不要散落”；状态：confirmed；适用范围：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others/WindowsOS`；创建 / 更新：2026-10-26。同一功能的 `.cmd` 与 `.ps1` 成对放入同一功能目录，不在 `WindowsOS/` 根层平铺；整理时同步相对调用、功能专属资源及 README 入口。此约束仅记录当前仓目录要求，不据此批量调整其它脚本仓。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、平台功能与命名 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户明确排除 Windows 的 iOS 模拟器脚本。Xcode、iOS/IPA 构建、CocoaPods 和 macOS 系统专属操作也按实际平台能力列明排除或原生等价适配，不能提供假装可运行的入口。
- 混合入口保留可在 Windows 执行的 Android、Web、Windows、鸿蒙及通用 Git/文件工具功能；各仓 README 维护逐项对照与验证范围。
- 因 Windows 检出会检查整个仓，`MacOS/` 内路径同样不得含 Windows 非法 ASCII `:<>"|?*`。只对命中的非法字符作全角最小改名，并同步引用及精确目录清单。
- 本任务未授权业务仓提交、推送或远程发布；本地脚本落盘及隔离验证不代表 Windows 实机已验收。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、SourceTree 与记录器边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- SourceTree 运行副本根仍为 `/Users/jobs/SourceTree.command`，动作目标迁至其 `MacOS/包名/脚本名`；备灾根仍在本仓同名子仓。双副本同步和菜单备份规则继续适用，详见 [[SourceTree-脚本体系]]。
- Windows SourceTree 提供当前用户 `customactions.xml` 安装/精确恢复入口，菜单动作转交独立终端确认，危险操作精确输入 `YES`。
- Windows 键盘记录器必须可见、手动开始/停止、会话归属清楚；入口或终端结束后停止监听，不允许关闭后继续写入或重建输出目录。原已确认约束见 [[JobsKeyboardRecorder-运行边界]]。

## 四、<span id="windows-compatibility-testing">Windows 本机与虚拟机测试计划</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-24 明确表示持有从 [**Windows**](https://www.microsoft.com/windows) XP 开始的系统，计划开始本机与虚拟机测试；状态：confirmed（测试意向），当时为测试意向，最新已验范围见本节验证记录；创建 / 更新：2026-10-24。
- 当前关注范围为本仓 `OS@Extension/WindowsOS@Extension` 右键菜单与 `JobsPythonTools.py` 打包的 Windows EXE。旧系统的实际兼容性需要逐项核对，不能把持有系统或计划测试写成已经支持，也不能将现有 CI / macOS 回归等同于 Windows 桌面验收。
- 来源：用户于 2026-10-24 明确要求将 Windows 系统限制写入对应 `README.md`，并再次强调用户最关心最低支持；状态：confirmed（文档要求）。上级总览与可独立交付包的就近说明须在前部直接标明“最低支持系统”，当前基线为 Windows 10 64 位（x64），并保留最低 build 未锁定、实机兼容性待验证的边界；详细说明继续列出目标系统、架构、依赖限制和实机验证状态。Python 源码 / 构建要求与成品运行条件分开，基础菜单可安装不代表外部工具业务可用。

- 来源：用户于 2026-10-25 明确提供运行中的 Windows 虚拟机，授权用它测试本仓 Windows 脚本并纠错；同日要求测试时不要让电脑锁住；状态：confirmed（授权与保活需求）、verified（本机识别到 VMware Fusion 的 Windows 11 ARM 虚拟机），Windows 原生测试结果另据实际日志记录。后续可利用该虚拟机执行安全隔离回归，并分别记录系统、架构、PowerShell 版本与跳过项；ARM 结果不能替代 x64 或 XP 等旧系统验收。长时间测试使用任务期间的临时保活，结束后撤回，不持久关闭密码或锁屏保护；遇到系统已经锁定时由用户手动解锁，不绕过认证。

- 验证记录（2026-10-26，verified）：Windows 11 ARM64 build 26300、系统 Windows PowerShell 5.1.26100.9711 / STA，先完整执行 38 套主回归，再对失败项定向修复重测；各套最新原生结果合并为 33 Passed、5 Partial、0 Failed / TimedOut，不能表述成最终快照完整重跑全部 38 套。Partial 包含符号链接权限不足及未启用的真实原生工具链分支，不计作通过；实际桌面菜单、真实 SDK / EXE 构建、x64 和旧系统仍未验。Python BAT 独立补充原生通过 202 项断言（28 个安全片段，stderr 为空）；中文 BAT 使用 UTF-8 / CRLF，Git 属性固定检出行尾，测试使用真实隐藏控制台并拒绝异常输出。源码哈希与逐套日志保存在仓库 `Tests/Reports/windows11-arm64-2026-10-26/summary.json`。

## 五、<span id="others-git-history-cleanup">JobsCommand@Others 大文件历史与双远端同步</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-26 提供 Gitee 超限拒绝日志，并针对“应用到 main 并同步 GitHub、Gitee”明确回复“此次授权”；状态：confirmed（本次授权）、verified（双远端真实推送及提交号复核）；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others`。本次授权不扩展为今后默认改写远端历史的许可。
- 仅从待同步历史移除两个旧分卷对象 `04c300ba51f76594dcdc63c6ec9578a48591b0d4` 与 `04a737bac425847400640d22e61670f9316fd890`；当前源码、资源及四个较小测试分卷保持原样，完整文件树仍为 `1bcb782de1dd1ad38e7c481ed3d73a4118726417`。本地与两个远端的 `main` 已统一到 `6ee1a5b734f6eb3d3c9be5965143bfb41709ae19`；Gitee 普通快进成功，GitHub 按原提交 `1e90cc08a6ec6f0572a8e53045f6dfbf804cc115` 的明确租约强推成功。不要再次合并清理前的旧历史，以免重新引入超限对象。
- 当前仓库 local 配置 `pack.useSparse=false`：目录迁移后，默认稀疏打包会额外带上远端已有的大样本；精确枚举后，Gitee 实际上传为 232,328 字节。此配置仅作用于本仓库，Sourcetree 普通推送同样使用，不修改全局 Git 或代理设置。
- 完整旧历史备份与验证记录位于 `/Users/jobs/Library/Application Support/JobsGitHistoryCleanup/JobsCommand-Others-2026-10-26.JyOW8n/`，其中 `before-cleanup.bundle` 已验证可恢复。父仓 `JobsGenesis` 当前 gitlink 仍为旧 `1e90cc08`，需要在父仓后续正常提交流程中更新到清理后的提交；本次未改动父仓暂存区、提交或远端。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
