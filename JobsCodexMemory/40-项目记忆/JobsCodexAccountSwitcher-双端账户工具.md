---
type: project-memory
status: active
scope: JobsCodexAccountSwitcher
source: 用户于 2026-10-02 明确要求
created: 2026-10-02
updated: 2026-10-02
tags:
  - python
  - codex-account-switcher
---

# JobsCodexAccountSwitcher 双端账户工具

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

记录经用户确认的项目范围；不保存账户身份、凭据或授权数据。

## 一、已确认范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户于 2026-10-02 要求以 Python 编写 Windows / macOS 双端 Codex 桌面账户切换工具，包含 README 和两端打包入口。
- 当前仓库根目录：`/Users/jobs/Desktop/JobsPythonTools.py`（用户于 2026-10-02 确认已移动）。旧路径 `/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py` 已被替代（`superseded`），不再作为编辑目标。
- 用户明确选择外挂方式，避免修改 Codex 本体。
- 工程落在 `JobsCodexAccountSwitcher.py/`，使用外层交付入口与内层 Python 工程结构。
- 用户于 2026-10-02 明确要求：账户库口令保护必须是可选功能，不能强制设置口令；保留可自行开启或关闭的保护入口。
- 双端包必须分别在对应系统构建；桌面双账户兼容性须单独核验，不能把本地缓存替换或虚拟 Token 测试当成真实授权成功。

- 用户于 2026-10-03 确认：双击账户应自动关闭所选 ChatGPT / Codex 桌面应用、切换账户并重启；账户列表右键支持更改备注和刷新缓存，空白处右键刷新，列表可滚动；不保留人工核验完成或回滚按钮。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
