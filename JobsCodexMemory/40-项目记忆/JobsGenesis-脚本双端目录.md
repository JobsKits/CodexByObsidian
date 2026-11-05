---
type: project-memory
status: active
scope: JobsGenesis-platform-scripts
repository: /Users/jobs/Documents/Github/JobsGenesis
source: 2026-10-23 用户明确要求五个脚本仓按 MacOS 和 WindowsOS 划分
created: 2026-10-23
updated: 2026-11-05
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
- [六、SSH 终端与 Python GUI 分工](#ssh-cli-python-gui)

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

- <span id="windows-native-regression-20261030">验证记录（2026-10-30，verified）</span>：用户再次提供运行中的虚拟机并授权 Windows 侧测试与纠错。Windows 11 ARM64 build 26300 / PowerShell 5.1.26100.9711，576 份脚本 Parser / BOM 通过；完整 65 套后定向修复复测，逐套最新结果为 55 Passed、10 Partial、0 Failed / TimedOut，最终快照未再次完整跑 65 套。修复覆盖 5.1 JSON 顶层数组、Path 大小写恢复、字面 %TEMP% / NBSP 路径、管理面板 Timer 闭包与副本一致性、IPv6 地址及构建 UTF-8。173 个 CMD 与 10 个 Python BAT 原生夹具通过。三款应用构建保护共 67 通过 / 18 符号链接权限跳过；EXE / MSVC DLL 真构建、真实菜单安装、PySide6 成品 GUI、x64 与旧系统仍未验。JobsAppTrafficMonitor 的管理员 ETW 本地 TCP / UDP 按 PID 和 EXE 实测通过，上下行各 2,141,952 字节、UDP 各 44,800 字节，测试后自有会话撤回已查询确认；管理员许可仅限这一次回环，不扩张为后续默认授权。报告：`Tests/Reports/windows11-arm64-2026-10-30/summary.json` 与同目录 README / 原始日志；无业务提交或推送。

## 五、<span id="others-git-history-cleanup">JobsCommand@Others 大文件历史与双远端同步</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-26 提供 Gitee 超限拒绝日志，并针对“应用到 main 并同步 GitHub、Gitee”明确回复“此次授权”；状态：confirmed（本次授权）、verified（双远端真实推送及提交号复核）；适用仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others`。本次授权不扩展为今后默认改写远端历史的许可。
- 仅从待同步历史移除两个旧分卷对象 `04c300ba51f76594dcdc63c6ec9578a48591b0d4` 与 `04a737bac425847400640d22e61670f9316fd890`；当前源码、资源及四个较小测试分卷保持原样，完整文件树仍为 `1bcb782de1dd1ad38e7c481ed3d73a4118726417`。本地与两个远端的 `main` 已统一到 `6ee1a5b734f6eb3d3c9be5965143bfb41709ae19`；Gitee 普通快进成功，GitHub 按原提交 `1e90cc08a6ec6f0572a8e53045f6dfbf804cc115` 的明确租约强推成功。不要再次合并清理前的旧历史，以免重新引入超限对象。
- 当前仓库 local 配置 `pack.useSparse=false`：目录迁移后，默认稀疏打包会额外带上远端已有的大样本；精确枚举后，Gitee 实际上传为 232,328 字节。此配置仅作用于本仓库，Sourcetree 普通推送同样使用，不修改全局 Git 或代理设置。
- 完整旧历史备份与验证记录位于 `/Users/jobs/Library/Application Support/JobsGitHistoryCleanup/JobsCommand-Others-2026-10-26.JyOW8n/`，其中 `before-cleanup.bundle` 已验证可恢复。父仓 `JobsGenesis` 当前 gitlink 仍为旧 `1e90cc08`，需要在父仓后续正常提交流程中更新到清理后的提交；本次未改动父仓暂存区、提交或远端。

## 六、<span id="ssh-cli-python-gui">SSH 终端与 Python GUI 分工</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-04 连续明确调整；状态：confirmed；创建 / 更新：2026-11-04；适用范围：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Gits` 和 `/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py` 的个人 SSH 工具。
- `JobsCommand@Gits` 维护 MacOS / WindowsOS 平行黑窗终端脚本，算法用 fzf，邮箱为唯一必需文字输入；旧“默认读取 Git / 不内置邮箱”约定为 superseded，用户随后明确指定默认 `295060456@qq.com`，仍允许编辑。名称统一去掉算法括号段，只保留“⚙️双击为私人账户生成 SSH 密钥”。
- 图形版单独进入 `JobsPythonTools.py/JobsSSHKeyMgr.py/`，沿用兄弟 Python 工具的外层入口与内层工程格式，自包含实现双端同等业务，不依赖另一个仓库的本机位置。生成、配置、agent、登记及验证自动衔接，既有密钥不覆盖，授权不足如实显示待完成。
- GUI 按钮两列布局；旧主窗口红底白字退出按钮已 superseded，用户改为 GitHub Token 网页（固定 `https://github.com/settings/tokens`，不使用 `settings/apps`），系统窗口关闭仍可退出，后续公钥显示方式改为主界面内嵌面板，不再提供独立弹窗关闭。默认邮箱可编辑，提供算法、GitHub 公钥网页与本机密钥文件夹入口。十语言和白天 / 黑夜 / 跟随系统主题遵循 [[10-用户画像/长期偏好#gui-i18n-theme-baseline|GUI 全局基础能力]]，语言另保留跟随系统。
- 用户确认图形版新名称为 `JobsSSHKeyMgr`，目录 / 模块 / 构建名对应统一；旧 QSettings 域仅作为已保存偏好兼容项保留。原“独立公钥窗口”已于 2026-11-05 被用户新要求替代（superseded）：公钥面板常驻一级页面“执行结果”下方，显示完整内容、路径及可反复使用的复制按钮；不再弹出独立窗口，只展示 `.pub`，不展示私钥正文。ED25519 标为推荐并给出算法区别说明，RSA 4096 用于不支持 ED25519 的旧系统兼容。

- 来源：用户于 2026-11-05 根据实机截图明确要求；状态：confirmed。主标题须明确为“🔑Jobs Github SSH 配置辅助工具”；语言与主题是次要功能，缩为标题同排右上角的图文按钮（左图标、右文字，无下拉箭头）。算法说明紧跟下拉框，按实际字段宽度与字体高度换行，不预留无意义的多行空白。黑夜模式的执行结果和公钥文本区采用黑底绿字，内容均支持上下滚动；继续保持十语言与系统主题联动。

- 来源：用户于 2026-11-05 进一步指定；状态：confirmed。原“生成并配置融入四按钮”已被最新要求替代（superseded）：蓝色“生成并配置”独占一行，其下四个辅助图文按钮两行两列依次为“复制公钥 / 打开当前系统密钥文件夹”“打开 GitHub 公钥网页 / 打开 GitHub Token 配置网页”。复制按钮从公钥面板移至该组左上角，仅存在有效公钥时可用；不再提供查看或定位公钥按钮。默认邮箱仍是实际可编辑值，使用较淡文字色呈现，输入其它邮箱恢复正常文字色。

- 来源：用户于 2026-11-05 明确补充；状态：confirmed。配置后须有清晰连接测试阶段，并提供单独“测试 SSH 连接”重测入口；使用已有密钥进行严格 GitHub SSH 验证，显示实际账号或失败原因，不重新生成、不重写 SSH 连接配置、不登记公钥或改写主机记录。原“按钮仅只读、不补齐别名”约定已由用户下述从零运行要求替代（superseded）：按钮认证成功后须自动补齐 Sourcetree 识别入口；底层纯验证函数继续保持只读。设置、辅助及测试按钮采用本地随包图标，均左图右文；公钥路径栏与测试按钮按字体 / 样式自然高度布局，避免固定高度造成文字裁切，覆盖多语言、主题及高像素比例。

- 来源：用户于 2026-11-05 针对误导日志明确要求修改程序；状态：confirmed。GUI 与 MacOS / WindowsOS SSH 终端脚本须分别提示 gh 未检测到、已安装但未登录、凭据被拒绝（HTTP 401）、请求被拒绝（HTTP 403）、网络错误、超时及无法确定状态，不能合并为“未安装、未登录或授权失效”。读取当前活跃账户的结构化状态，失败保留本地密钥并给出重新授权或网页登记的下一步；不把未知 / 网络错误推断为凭据失效，不将原始授权响应写入日志。

- 来源：用户于 2026-11-05 明确追加并限定；状态：confirmed。“生成并配置”时在当前用户 `.ssh` 目录生成 `README.md`，介绍 `config`、`id_ed25519_personal`、`id_ed25519_personal.pub`、`known_hosts` 的用途；GUI 和 MacOS / WindowsOS 终端同步。README 已存在就跳过，不覆盖、不追加、不更新，保留已有文件及同名链接或目录；缺失时才独占创建。说明只含用途和文件名，不保存私钥正文；独立测试连接不生成说明。

- 来源：用户于 2026-11-05 进一步补充；状态：confirmed。GUI 关闭重开后必须自动显示当前已有个人公钥并恢复复制入口，不要求再次生成。优先本工具托管 SSH 配置，再读取已保存的相对文件名与受支持的个人密钥候选；只读配置与 `.pub`，私钥仅校验文件属性。启动恢复不生成密钥、不写 SSH 配置或 README，不沿用上次认证成功状态；支持再次点击测试验证。

- 来源：用户于 2026-11-05 聚焦 Sourcetree 识别故障；状态：scoped-verified（本机 4.2.20 / 324 二进制只读核验及严格 SSH 认证）。该 MacOS 版本账户页按 `<GitHub用户名>-GitHub` / `.pub` 探测文件，后备名为 `id_rsa`、`id_dsa`、`Identity`，不根据 `config` 的 `IdentityFile` 识别自定义个人文件名；账户页未找到不等于 SSH 认证失败。严格认证确认实际账号后，可复用工具的别名函数创建同目录相对链接，保留密钥、配置与 known_hosts；需重新打开账户编辑弹窗刷新显示。用户名是 GitHub login，不能拿邮箱或密钥注释代替；不读取、使用或记录用户贴出的 Token。

- 来源：用户于 2026-11-05 明确要求“改程序、从零开始运行”；状态：confirmed。Sourcetree 识别修复必须进入 GUI 与双端终端源码，不以单次手工补本机链接作为完成。首次配置认证成功即创建兼容名；首次未登记公钥时，网页添加后点击 GUI 测试按钮，程序按实际 SSH 认证账号自动补齐 `<用户名>-GitHub` 与 `.pub`。MacOS 相对符号链接、Windows 普通硬链接，原个人密钥名与已存在 README 不变；冲突保留并明确提示，别名失败不抹掉 SSH 认证成功。隔离空目录验证整个首次生成→未登记→登记后重测→识别补齐流程，不依赖开发机已有文件。

- 来源：用户于 2026-11-05 根据已有公钥的界面截图明确要求；状态：confirmed。GUI 恢复或生成已有密钥后，主按钮改为“重新生成配置”；点击须先弹窗二次确认，默认取消，取消 / Esc / 关闭弹窗不启动任务、不清空公钥、不修改偏好。弹窗跟随当前十语言与主题，显示当前邮箱、算法及匹配密钥复用、不覆盖已有密钥、已有 README 保留的说明；此交互不改变既有密钥保护规则。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
