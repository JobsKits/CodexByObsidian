---
type: project-memory
status: active
scope: JobsCodexAccountSwitcher
source: 用户于 2026-10-02 至 2026-10-28 明确要求
created: 2026-10-02
updated: 2026-10-28
tags:
  - python
  - codex-account-switcher
---

# JobsCodexAccountSwitcher 双端账户工具

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、已确认范围](#jobs-toc-heading-2)
- [二、Token 用量与对话归属](#jobs-toc-heading-3)
- [三、双平台主分支映射](#repository-branches)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

记录经用户确认的项目范围；不保存账户身份、凭据或授权数据。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、已确认范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户于 2026-10-02 要求以 Python 编写 Windows / macOS 双端 Codex 桌面账户切换工具，包含 README 和两端打包入口。
- 当前仓库根目录：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py`，用户于 2026-10-10 明确指定当前工程 `JobsCodexAccountSwitcher.py/`。2026-10-02 的桌面路径 `/Users/jobs/Desktop/JobsPythonTools.py` 已被此次指定替代（`superseded`）；不再沿用此前“Documents 路径已废弃”的判断。
- 用户明确选择外挂方式，避免修改 Codex 本体。
- 工程落在 `JobsCodexAccountSwitcher.py/`，使用外层交付入口与内层 Python 工程结构。
- 用户于 2026-10-02 明确要求：账户库口令保护必须是可选功能，不能强制设置口令；保留可自行开启或关闭的保护入口。
- 双端包必须分别在对应系统构建；桌面双账户兼容性须单独核验，不能把本地缓存替换或虚拟 Token 测试当成真实授权成功。

- 用户于 2026-10-03 确认：双击账户应自动关闭所选 ChatGPT / Codex 桌面应用、切换账户并重启；账户列表右键支持更改备注和刷新缓存，空白处右键刷新，列表可滚动；不保留人工核验完成或回滚按钮。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、Token 用量与对话归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- **工程归属已替代（superseded，2026-10-18）：** 用户明确要求账户切换与 Token 上下行监控拆成两个同级 Python 工具，不能仅用同一主程序的不同参数或轻量启动器区分。账户工程仅管理账户；独立监控工程及置顶设置约束见 [[JobsCodexTokenMonitor-独立用量监控]]。下列统计与隐私口径继续适用于独立监控工具，2026-10-10 的合包验收仅为历史基线。

- 用户于 2026-10-10 要求保留账户切换，新增只负责每轮上行 / 下行 Token 的独立桌面浮窗；账户窗口与浮窗各自运行，浮窗不加载账户库，不读取或切换登录凭据。
- 用户要求随 Codex 钩子启动，并能对已运行的 Codex 热接入。实现方向为只读本地会话日志、用户级 `SessionStart` 后台启动和单实例唤起，不注入或修改 Codex 本体。
- 用户明确反馈短会话编号无法认出对应对话，并要求在回复所在对话显示统计。浮窗需提供对话标题、本轮实际提问摘要，以及可搜索、可滚动的记录；通过官方 `Stop` 的 `systemMessage` 返回对应轮次提示，不篡改原回复正文。
- 本轮最终用量在最终答复之后才落盘；同轮提示只接受最终答复后匹配轮次的精确累计，缺失时显示待统计 / 未知，浮窗继续补齐。缓存输入和推理输出已经包含在输入 / 输出里，不能再次相加；主代理与子代理不得混为账号汇总。
- 新增或变更钩子需要 Codex 官方 `/hooks` 审阅信任；程序只合并并备份 `hooks.json`，不自动写入信任哈希。当前 `SessionStart` 在新建 / 恢复后首轮执行时消费待处理事件，不能宣称只打开空窗口必定触发。2026-10-10 本机两条动作已通过官方 CLI 审阅启用。
- 标题与提问摘要只用于本机内存显示，不保存聊天副本、不上传。Mac / Windows 仍分别本机打包和验收，不把 Mac 实测当作 Windows 已通过。
- 2026-10-10 已实现并通过 161 项回归、Mac 成品与真实日志统计验证；Windows 原生运行及客户端同轮提示的实际显示位置仍需后续对应环境验收。

## 三、<span id="repository-branches">双平台主分支映射</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-16 要求修正本仓远端分支；状态：已确认并实际核验；创建 / 更新：2026-10-16；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexAccountSwitcher.py`。
- 复用已有本地 `main`，对应 [**GitHub**](https://github.com) 与 [**Gitee**](https://gitee.com) 的 `main`；Gitee 默认分支为 `main`。本仓原先的远端目标 `gitee` 已替代（`superseded`），逐层推送不得按通用默认映射重建它。
- 2026-10-28 用户明确指定本仓远端别名为 `Github` / `码云`，替代旧 `origin` / `gitee`；实际跟踪引用为 `Github/main` / `码云/main`，不改变本地 `main` 或提交历史。改名后原分支覆盖配置缺失，本轮已恢复仓库本地 `remote.码云.jobsPushBranch=main`；旧键 `remote.gitee.jobsPushBranch` 的记录已替代（`superseded`）。该例外不传给父仓、子仓或其它项目，不改变其它仓库默认的码云 `gitee` 目标与 OC 独立快照边界。脚本兼容和验证见[[SourceTree-脚本体系#remote-alias-push|远端改名与逐层推送]]。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
