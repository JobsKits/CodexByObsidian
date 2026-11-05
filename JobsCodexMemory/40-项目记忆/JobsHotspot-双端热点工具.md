---
type: project-memory
status: active
scope: JobsPythonTools.py/JobsHotspot.py
created: 2026-11-05
updated: 2026-11-05
source: 用户2026-11-05原始七条需求与本机有限验证
tags:
  - python
  - hotspot
---

# JobsHotspot 双端热点工具

## 一、<span id="project-scope">已确认范围</span>

- 状态 confirmed，来源为用户2026-11-05明确需求：用 Python 写独立 MacOS／WindowsOS GUI，把实体以太网／USB 网络输入通过电脑 Wi-Fi 输出为热点；仅 Wi-Fi 入网、无 Wi-Fi 模块或其它不可用情况应显示图文诊断并禁用开启。
- 分享开关显眼、圆形、仅图片，开关两态使用不同图；突出入口和出口流量；支持最小化到状态栏／托盘。右上角语言和主题参考 JobsSSHKeyMgr，沿用全局十语言与白天／黑夜／跟随系统要求。
- 总仓绝对路径：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py`；工具为 `JobsHotspot.py/`，内层工程 `JobsHotspot/`，包 `src/jobs_hotspot/`。按现有 Python 工具目录形态独立打包，仍由总仓管理，不创建独立 Git 或子模块。
- 用户提供参考：`/Users/jobs/Documents/Github/JobsDocs/MacOS配置个人热点🛜.md/MacOS配置个人热点🛜.md`；SSH 参考工程 `JobsSSHKeyMgr.py/`。

## 二、<span id="platform-boundaries">实现与平台边界</span>

- 实现 scoped-verified：PySide6 GUI，共享状态模型，MacOS／Windows 分离后端；真实检测失败不会自动切入模拟数据。`--demo` 为显式的无系统网络写操作演示，`--diagnose` 只读，`--smoke` 自动退出且不改热点。
- MacOS 首次在原生“互联网共享”设置来源→唯一 Wi-Fi 输出及名称密码；App 仅读取现有 NAT 配置、网络与共享进程证据，明确用户操作时精确匹配原生开关。权限、布局、私有配置格式无法确认时阻止开启，不写私有 plist、不强启守护进程。辅助功能授权有单独用户入口。物理链路／IPv4／路由正常不能证明 ISP 或门户放行。
- Windows 使用内置 Windows PowerShell 5.1＋WinRT Mobile Hotspot，读取硬件／软件无线电、网络能力和 ICS 实际入口。权限／组织策略／驱动限制会禁用开启；多物理 Wi-Fi 暂禁开启；入口消失仍尽力保留停止，所有 profile 消失时需系统设置兜底。未使用旧式 hostednetwork。
- 流量为网卡累计收发与差分速率，包含本机其它流量，不能当热点客户端独占流量；未知值显示 —。密码不落日志或普通偏好文件。

## 三、<span id="validation">验证基线</span>

- 2026-11-05：56 项隔离自动测试通过，含平台状态／超时／权限、源码 smoke 退出、语言／主题／凭据／流量和构建清理边界；Shell语法与Windows PowerShell AST检查通过。
- 本机 MacOS27.2 arm64 只读硬件状态和 GUI 成品已检查；APP／DMG 构建、冻结 smoke、DMG 完整性、移至中文空格临时目录并从工程外运行的冻结 smoke 均通过。实际构建依赖：Python3.15.2、PySide6 6.12.0、PyInstaller6.22.3；此为该次证据，后续重新核验。
- 本机仅 Wi-Fi 输入，没有可用实体入口，未进行真实热点开启、客户端传输或端到端验收。Windows 未本机打包／运行；其它 Mac 系统与CPU架构、真实授权启停及跨机分发未验收，不把源码或模拟通过扩大为这些结果。
- 打包按各平台本机生成，外层 dist 时间目录保存真实产物并生成最新入口；未创建提交或推送。
