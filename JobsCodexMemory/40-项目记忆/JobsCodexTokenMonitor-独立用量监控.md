---
type: project-memory
status: active
scope: JobsCodexTokenMonitor
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexTokenMonitor.py
source: 用户于 2026-10-18 明确要求账户切换与 Token 监控拆分，后续明确修正置顶为主面板高频操作、设置只从二级菜单进入
created: 2026-10-18
updated: 2026-10-18
tags:
  - codex-memory
  - python
  - token-monitor
---

# JobsCodexTokenMonitor 独立用量监控

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、项目归属](#jobs-toc-heading-2)
- [二、桌面与数据边界](#desktop-data-boundaries)
- [三、验证基线](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

记录用户确认的工程拆分与桌面交互边界，不保存聊天、凭据或个人用量。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、项目归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 状态：已确认。用户要求同级两个 Python 功能工程，账号切换位于 `/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexAccountSwitcher.py`，监控位于 `/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexTokenMonitor.py`。
- 每个工具使用“外层入口 + 内层 Python 工程”，分别拥有源码、依赖、测试、README、macOS / Windows 打包入口和可单独分发的 APP / EXE。
- 监控包为 `jobs_codex_token_monitor`；不依赖账户包或账户 APP，不使用旧轻量启动器调用账号主程序的方式。账户包移除监控源码、GUI 入口和钩子配置功能；仅保留无副作用的旧钩子退役应答。
- 新目录当前由总仓直接管理，未配置独立远端或子模块，不猜测镜像地址，不自动提交或推送。

## 二、<span id="desktop-data-boundaries">桌面与数据边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 状态：已确认；来源：用户于 2026-10-18 后续明确指出“窗口是否置顶”为高频操作，必须从设置面板移到主面板；适用范围仅为本项目。主面板常驻“窗口置顶”复选框，一键置顶或取消，立即生效；沿用原 `always_on_top` 键，首次默认置顶，保存既有选择并在重启后恢复。
- 设置面板只保留三态主题与会话钩子，不再提供置顶控制；用户于 2026-10-18 进一步确认设置只从 `⋯ → 设置…` 二级菜单进入，移除主面板重复的“设置”按钮。历史记录、刷新与单实例保留；此项不泛化为其它软件的全局交互偏好。
- `superseded`：初轮“设置面板提供置顶 / 取消置顶”的入口安排，已由[本节已确认的主面板常驻复选框要求](#desktop-data-boundaries)替代；持久化与重启恢复要求继续有效。
- `superseded`：此前“主面板常驻设置按钮，同时保留菜单设置入口”的双入口安排，已由[本节已确认的唯一二级菜单设置入口](#desktop-data-boundaries)替代；常驻“窗口置顶”复选框继续保留。
- 保留 `Jobs/CodexTokenWidget` 的原有外观与位置设置，账户数据仍位于原 `Jobs/CodexAccountSwitcher`，不因拆分迁移或清空。
- 只读本地会话日志；缓存输入、推理输出已计入对应总数，不能重复相加；主代理与子代理不混算，不把未知当零。详细继承口径见 [[JobsCodexAccountSwitcher-双端账户工具#二、Token 用量与对话归属|原统计约束]]。
- 会话钩子由监控工具管理，识别并安全替换本工具旧动作，保留其它钩子与原文备份；改变命令后仍经官方 `/hooks` 审阅，不自动写信任哈希。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、验证基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 2026-10-18：账户 63 项、监控 169 项及双入口 176 项隔离环境回归通过。两套独立 Mac ARM64 APP / DMG 已生成并校验；实际监控设置按钮、置顶双向切换、取消后重启恢复、钩子标准输入 / JSON 输出和跨进程单实例唤起已验证。Windows 原生 GUI / 打包未实机验证，真实账户切换未在本轮执行。
- 本机原有两条 Token 钩子已精确备份后迁到独立监控的第一层稳定 APP 入口，外部钩子与 `config.toml` 保持；新命令需要官方 `/hooks` 重新审阅。账户工具第一层的旧 `JobsCodexTokenWidget.app` 入口已随重打包移除。
- 设置面板关闭与主窗口生命周期绑定，关闭主窗口时结束读取线程并关闭设置；当时验证的常驻“设置”按钮已 `superseded`，现行入口见[唯一二级菜单设置入口要求](#desktop-data-boundaries)。
- 唯一菜单入口调整后，169 项回归通过，其中界面用例实际点击 `⋯ → 设置…` 打开面板；Mac APP / DMG 已重建校验，成品主面板确认没有“设置”按钮且保留置顶复选框。
- 高频控件上移后重新通过监控 169 项回归并重建 Mac APP / DMG；桌面核对主面板常驻复选框、直接取消置顶及重启恢复，设置面板已无置顶控件。保持原键、位置与监听线程；窄窗口保留完整标题。
- 同日补充迁移验证：磁盘 `hooks.json` 已指向独立监控，但当前桌面会话仍执行缓存的账号 APP `--hook-report`。本机后端走匿名 stdio，没有公开控制 socket；界面自动化不允许操作 Codex，不尝试未开放 IPC 或重启其它工作。账户启动器增加仅用标准库的退役应答：旧 Stop 输出合法迁移提示、旧 SessionStart 静默退出，均不读会话或账户、不调用监控。独立浮窗可继续使用，新联动在客户端空闲时重启并经官方审阅后核对；不能将磁盘迁移或直接调用测试冒充当前会话已经重载成功。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
