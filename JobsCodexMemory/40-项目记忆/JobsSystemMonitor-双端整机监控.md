---
type: project-memory
status: active
scope: JobsSystemMonitor
source: 用户于 2026-10-15 要求双端整机监控，并反馈运行时抢焦点
created: 2026-10-15
updated: 2026-10-15
tags:
  - python
  - system-monitor
---

# JobsSystemMonitor 双端整机监控

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、范围与目录](#jobs-toc-heading-2)
- [二、焦点约束与基线](#jobs-toc-heading-3)
- [三、远端与母子仓库关联](#jobs-toc-heading-4)
- [四、跨机器打包兼容性](#jobs-toc-heading-5)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

记录已确认的产品范围与验收基线，后续维护先核对源码及外层 README。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、范围与目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户要求使用 [**Python**](https://www.python.org) 在 Mac 状态栏 / Windows 任务栏区域显示整机上行、下行、CPU / GPU / 内存占用，参考腾讯柠檬的紧凑监控布局。
- 仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py`；新工具：`JobsSystemMonitor.py/`，内层工程 `JobsSystemMonitor/`。独立于已有按 App 流量统计的 `JobsAppTrafficMonitor.py/`。
- Mac 使用系统原生 `NSStatusItem`；Windows 使用可拖动任务栏浮层和托盘入口，不为 Explorer 原生按钮预留布局空间。双端分别本机打包，外层有 APP / DMG 或 EXE / ZIP 最新入口。
- 全部指标读取本机真实系统数据；不支持或未预热显示未知和原因，不填伪造值。Mac GPU 读取驱动提供的 IORegistry 字段；Windows 使用原生 PDH GPU Engine。驱动支持具有平台边界。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、焦点约束与基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户反馈运行过程中持续抢焦点，影响输入。后台数据 / 位置刷新不得循环 `show()`、`raise_()` 或 `activateWindow()`；详情激活只来自用户明确点击和首次启动。
- Mac 悬浮工具窗使用非激活显示、禁止键盘焦点，并在应用失活后保持可见，避免失活隐藏与定时重显形成循环。
- 2026-10-15 基线：0.1.1，51 项自动测试通过；Mac Apple M5 真实指标、原生菜单栏、APP / DMG 构建和成品启动已验，修复后文本编辑器跨多个刷新周期输入未被打断。Mac 原生外观信号的跟随 / 手动覆盖和配置恢复已验证。
- Windows 仅完成静态 / 模拟验证，未在真实 Windows 机器构建或验收；Intel Mac、其它 GPU、系统外观切换、多屏和自动隐藏仍需目标机回归。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、远端与母子仓库关联 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户于 2026-10-15 已将该目录初始化为独立 Git 仓库并关联 [**GitHub**](https://github.com/JobsKits/JobsSystemMonitor)，随后明确要求推送至 [**Gitee**](https://gitee.com/JobsGo/JobsSystemMonitor) 并由母仓 `JobsPythonTools.py` 管理。
- 子仓 `origin` 保留 `https://github.com/JobsKits/JobsSystemMonitor.git`；新增 `gitee` 为 `git@gitee.com:JobsGo/JobsSystemMonitor.git`，复用本机已有 SSH 授权。`main` 保持跟踪 `origin/main`，显式 `git push gitee main` 推码云。
- 母仓以子模块 `JobsSystemMonitor.py` 登记；`.gitmodules` 使用 `../JobsSystemMonitor.git`、分支 `main`，让 GitHub / Gitee 克隆分别解析到同站子仓。已用 `git submodule absorbgitdirs` 将元数据归入母仓实际 Git 目录的 `modules/JobsSystemMonitor.py`；子仓工作目录 `.git` 为指针文件。
- 关联时母仓仅暂存 `.gitmodules` 和该子模块 gitlink，没有创建提交或推送母仓。2026-10-15 后续打包修复与本工具产物忽略规则已在子仓提交为 `df7ad57` 并推送 Gitee，远端提交号已核验；未推送 GitHub，未改母仓已暂存的子模块指针。此前“未提交或推送”的记录仅指最初软件实现交付阶段，已由本节远端状态替代。
- 已替代（`superseded`，2026-10-15）：最初“更新 gitmodules 脚本只写清单”的结论被用户同日新要求取代。JobsGenesis 下 5 份同名脚本已统一为一次运行完成新增子仓完整关联，并保留既有配置和指针；不自动提交或推送。规则与验证见 [[30-工作流决策/工作流决策#十四、父仓子模块 Git 元数据集中管理|父子仓一次关联工作流]]。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、跨机器打包兼容性 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户于 2026-10-15 反馈另一台 Mac 克隆为 `JobsSystemMonitor` 后，打包入口在版本断言处抛出裸 `AssertionError`。已移除该断言式退出，实际检测候选 Python 版本及构建标准库，跳过不兼容解释器，复用健康 Python 3.11+；缺失分支须确认安装，取消、EOF、非终端及安装后复检失败均停止。
- 外层克隆目录名不得写死；构建输出按脚本位置锚定，内层工程仍为 `JobsSystemMonitor`，拒绝链接改向、根目录及外部清理。PyInstaller 最低版本与项目声明统一为 6.10。
- 修复基线：72 项自动测试通过，包含运行时发现 / 安装门禁和任意克隆目录名；入口 `zsh -n` 与实际非交互取消已验。本次未重新打包，也未在用户另一台电脑运行。
- 历史方案，已撤销（superseded，2026-10-15）：用户要求新系统最小成本启动，Python 必须通过自检后的 Brew 管理；助手曾将运行时发现 / uv 替代实现收口到随仓 `HomebrewSupport/python-runtime.zsh`，先更新或安装 Homebrew，再按业务版本检查 / 修复 Python。全 JobsGenesis 的公共实现与分发见 [[30-工作流决策/工作流决策#十三、Python 跨端软件依赖与打包收尾|Python 公共自检工作流]]；此阶段监控工具 66 项回归、公共 Python 54 项与 Homebrew 安装选择 15 项隔离回归通过，未执行真实环境安装或重新打包。监控子仓提交 `b1d3460` 已推送 Gitee 并核验，包含独立克隆所需公共模块；其它接入仓库仅本地修改，未提交或推送。

- 用户同日明确纠正：每个涉及 Homebrew／Python 的脚本必须在自己的文件内，以具名函数独立封装完整自检；外置模块不是用户需求。监控入口已完整内嵌，相关外置目录已移出项目到临时恢复备份；Python57、Homebrew15及全部软件测试合计138项通过，包括没有任何支持目录的孤立中文、空格、新emoji路径测试。Brew／Python准备流程和业务版本边界保留，未执行真实安装、升级或重新打包。单文件内嵌版已提交 `2d7d31e` 并推送 Gitee；外置方案的 `b1d3460` 仅为历史记录。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
