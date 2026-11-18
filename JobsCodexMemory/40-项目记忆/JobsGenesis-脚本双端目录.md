---
type: project-memory
status: active
scope: JobsGenesis-platform-scripts
repository: /Users/jobs/Documents/Github/JobsGenesis
source: 2026-10-23 用户明确要求五个脚本仓按 MacOS 和 WindowsOS 划分
created: 2026-10-23
updated: 2026-11-18
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
- [七、终端配色广域修复](#terminal-style-genesis-fix)
- [八、环境同步生效提示](#zshrc-activation-message)
- [九、全局 Flutter 与项目 FVM 更新边界](#global-flutter-update)
- [十、脚本规范统一与源码迁移](#script-unification-20261117)
- [十一、父子 Git 仓库管理收口为双端 Python GUI](#nested-git-gui-20261118)

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

- 来源：用户于 2026-11-05 根据实机截图明确要求；状态：confirmed。主标题须明确为“🔑Jobs GitHub SSH 配置辅助工具”（用户同日纠正品牌拼写，旧 `Github` 写法为 superseded）；语言与主题是次要功能，缩为标题同排右上角的图文按钮（左图标、右文字，无下拉箭头）。算法说明紧跟下拉框，按实际字段宽度与字体高度换行，不预留无意义的多行空白。黑夜模式的执行结果和公钥文本区采用黑底绿字，内容均支持上下滚动；继续保持十语言与系统主题联动。

- 来源：用户于 2026-11-05 进一步指定；状态：confirmed。原“生成并配置融入四按钮”已被最新要求替代（superseded）：蓝色“生成并配置”独占一行，其下四个辅助图文按钮两行两列依次为“复制公钥 / 打开当前系统密钥文件夹”“打开 GitHub 公钥网页 / 打开 GitHub Token 配置网页”。复制按钮从公钥面板移至该组左上角，仅存在有效公钥时可用；不再提供查看或定位公钥按钮。默认邮箱仍是实际可编辑值，使用较淡文字色呈现，输入其它邮箱恢复正常文字色。

- 来源：用户于 2026-11-05 明确补充；状态：confirmed。配置后须有清晰连接测试阶段，并提供单独“测试 SSH 连接”重测入口；使用已有密钥进行严格 GitHub SSH 验证，显示实际账号或失败原因，不重新生成、不重写 SSH 连接配置、不登记公钥或改写主机记录。原“按钮仅只读、不补齐别名”约定已由用户下述从零运行要求替代（superseded）：按钮认证成功后须自动补齐 Sourcetree 识别入口；底层纯验证函数继续保持只读。设置、辅助及测试按钮采用本地随包图标，均左图右文；公钥路径栏与测试按钮按字体 / 样式自然高度布局，避免固定高度造成文字裁切，覆盖多语言、主题及高像素比例。

- 来源：用户于 2026-11-05 针对误导日志明确要求修改程序；状态：confirmed。GUI 与 MacOS / WindowsOS SSH 终端脚本须分别提示 gh 未检测到、已安装但未登录、凭据被拒绝（HTTP 401）、请求被拒绝（HTTP 403）、网络错误、超时及无法确定状态，不能合并为“未安装、未登录或授权失效”。读取当前活跃账户的结构化状态，失败保留本地密钥并给出重新授权或网页登记的下一步；不把未知 / 网络错误推断为凭据失效，不将原始授权响应写入日志。

- 来源：用户于 2026-11-05 明确追加并限定；状态：confirmed。“生成并配置”时在当前用户 `.ssh` 目录生成 `README.md`，介绍 `config`、`id_ed25519_personal`、`id_ed25519_personal.pub`、`known_hosts` 的用途；GUI 和 MacOS / WindowsOS 终端同步。README 已存在就跳过，不覆盖、不追加、不更新，保留已有文件及同名链接或目录；缺失时才独占创建。说明只含用途和文件名，不保存私钥正文；独立测试连接不生成说明。

- 来源：用户于 2026-11-05 进一步补充；状态：confirmed。GUI 关闭重开后必须自动显示当前已有个人公钥并恢复复制入口，不要求再次生成。优先本工具托管 SSH 配置，再读取已保存的相对文件名与受支持的个人密钥候选；只读配置与 `.pub`，私钥仅校验文件属性。启动恢复不生成密钥、不写 SSH 配置或 README，不沿用上次认证成功状态；支持再次点击测试验证。

- 来源：用户于 2026-11-05 聚焦 Sourcetree 识别故障；状态：scoped-verified（本机 4.2.20 / 324 二进制只读核验及严格 SSH 认证）。该 MacOS 版本账户页按 `<GitHub用户名>-GitHub` / `.pub` 探测文件，后备名为 `id_rsa`、`id_dsa`、`Identity`，不根据 `config` 的 `IdentityFile` 识别自定义个人文件名；账户页未找到不等于 SSH 认证失败。严格认证确认实际账号后，可复用工具的别名函数创建同目录相对链接，保留密钥、配置与 known_hosts；需重新打开账户编辑弹窗刷新显示。用户名是 GitHub login，不能拿邮箱或密钥注释代替；不读取、使用或记录用户贴出的 Token。

- 来源：用户于 2026-11-05 明确要求“改程序、从零开始运行”；状态：confirmed。Sourcetree 识别修复必须进入 GUI 与双端终端源码，不以单次手工补本机链接作为完成。首次配置认证成功即创建兼容名；首次未登记公钥时，网页添加后点击 GUI 测试按钮，程序按实际 SSH 认证账号自动补齐 `<用户名>-GitHub` 与 `.pub`。MacOS 相对符号链接、Windows 普通硬链接，原个人密钥名与已存在 README 不变；冲突保留并明确提示，别名失败不抹掉 SSH 认证成功。隔离空目录验证整个首次生成→未登记→登记后重测→识别补齐流程，不依赖开发机已有文件。

- 来源：用户于 2026-11-05 根据已有公钥的界面截图明确要求；状态：confirmed。GUI 恢复或生成已有密钥后，主按钮改为红底白字的“重新生成配置”（首次生成仍为蓝底白字）；确认弹窗中的同名执行按钮也采用红底白字，明暗及跟随系统主题保持一致。点击须先弹窗二次确认，默认取消，取消 / Esc / 关闭弹窗不启动任务、不清空公钥、不修改偏好。弹窗跟随当前十语言与主题，显示当前邮箱、算法及匹配密钥复用、不覆盖已有密钥、已有 README 保留的说明；此交互不改变既有密钥保护规则。

## 七、<span id="terminal-style-genesis-fix">终端配色广域修复</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户明确将“终端配色未自动恢复”修复范围扩大到 `/Users/jobs/Documents/GitHub/JobsGenesis` 下全体 `*.command`，包含实际子仓；状态：需求 confirmed／三轮重发及退出控制键兼容 scoped-verified／用户原会话重跑 pending；创建 / 更新：2026-11-15。本轮跨午夜，按 11 月 15 日记录；这是用户明确指定的项目范围，不据此推断其它目录的默认维护授权。
- 用户实机反证保留（2026-11-15，failure confirmed）：重跑原 `install（快捷入口）.command`，日志证明当时新版 guard 已运行，正常退出仍报颜色项 10“回复不完整或超过约 2 秒等待”，先前“功能已修复完成”的认定因此撤回。随后原生隔离完整链取得另一处失答实证并再次修订实现，限定验证及源码／固定副本同步已通过；用户颜色项 10 现场没有直接采样，不能认定唯一根因，原会话重跑仍待用户确认。
- 实施边界：按既有所有权规则排除第三方、供应商、构建产物及 `JobsConfigOS/💻JobsCodexConfigs/skills` 备份整树；只修已有同源终端保护及其附属 helper／生成模板，没有该保护的源入口不机械加一套。各树先留备份，保护块外原业务和已有改动保留，HEAD、Git 配置及动作配置不动。
- 全体盘点为 326 份 `.command`：其中 282 份已有同源 guard 已全部更新到本轮新模式，分布为 `🌍JobsMacEnvVarConfigs` 48、根目录 3、`JobsConfigOS` 其余 17、六个脚本／工具树 165、`OS@Extension` 12、`SourceTree.command` 37；其余 44 份不含该保护的入口保留，并核对转发调用。旧单请求短等候、旧三信号退出模式及破损 guard 残留均为 0；这是源码覆盖检查结果。
- 前阶段累计修改 483 份源码，为 282 份 `.command` 加 201 份相关 Shell helper／JS 模板，包含环境仓 66 份源码；各同源变体同步保留“延迟答复可完整读取、精确比对本次临时值再还原、外部改色冲突保留、诊断具体颜色项／失败原因、信号清理完成后退出”的修复语义。
- 前阶段 17 场景 PTY 矩阵按变体验证：环境仓 17、根目录 17、`JobsConfigOS` 两组 34、六个脚本／工具树三组 51，`OS@Extension` 和 `SourceTree.command` 各 17（两组合计 34），共 153 次场景全部通过，包含多变体重复覆盖；另用真实独立 Terminal 窗口验证精确恢复。未执行各脚本的真实安装／部署／删除业务，也未操作用户原 TTY。
- 该阶段统一静态及副本检查 scoped-verified：326 份 `.command` 逐个 `zsh -n` 全部通过，累计 483 份改动源码语法全部通过，3 份 JS 模板产生的 POSIX Shell 语法通过；旧查询／旧三信号退出模式／破损 guard 均为 0，上述限定检查 0 失败。159 个既有运行副本（环境仓 118＋SourceTree 41）逐字节比对 0 异常；环境安装入口二次确认的两份晚改副本已额外备份后原子补同步，结果已计入该阶段报告。语法、隔离 PTY、独立 Terminal 及副本同步通过的事实保留，不能将它们扩展为用户实际入口恢复已通过。
- 前阶段 `SourceTree.command` 按固定双位置对 41 个对应文件先备份再同步，`cmp` 一致且两侧语法通过；33 个当前 actions 的只读核对确认目标可执行、`REPO` 参数正确，未改动作配置。`OS@Extension` 已安装 Finder App 本轮不重打包，源码修复不冒充已安装 App 更新。
- 备份根为 `/Users/jobs/.codex/backups/terminal-style-genesis-20261114.gXAZ95`，聚合报告为其中已生成的 `final-report.json`，各树子报告及精确备份由总报告引用；报告列明 326／282／44 入口、483 份源码、3 份生成 Shell、159 运行副本及 153 次 PTY 场景的该阶段限定结果，实际用户入口失败按本节后续反证记录。未修改 Skills／AGENTS，未提交或推送，不执行用户旧恢复脚本或修改系统／终端全局设置。
- 失答实证与验证边界（2026-11-15，scoped-verified）：原生 Terminal 完整“快捷入口→bootstrap／reexec→实际同步／生成／注册→退出”隔离夹具，在 startup 颜色项 `4;9` 连续 20 次读取均为 0 字节而降级，证明仅等待同一请求会持续失答；这不是用户 cleanup 颜色项 10 的直接采样。真实 Brew／JDK 只读健康，所有业务写入均在临时目录；未执行真实 HOME 安装。
- 三轮重发查询实现（后续 cleanup 帧外控制键兼容见下文）：每项最多 3 轮实际发送查询，每轮有界等待约 2 秒；严格按 BEL／ST 单颜色帧处理，合法旧／重复答复消歧，非法 RGB、多记录、冲突及帧内键盘输入停止；startup／applied 阶段继续严格拒绝所有键盘输入。`dd` 哨兵保留换行，目标 `normalized` 必须非空；startup 三轮全丢时保留原配色，applied／cleanup 全丢时保留恢复路径，不盲目覆盖颜色。源全体及环境／SourceTree 固定副本已同步，用户原快捷路径已是本轮代码。
- 三轮重发阶段限定验证通过：当时永久回归为原 17＋新增 21，共 38 场景完整 PASS，实际执行 bootstrap，覆盖 cleanup 丢 1／2 次后的真实重发、三阶段丢包、迟到旧／重复帧、分片和无效输入。新原生 Terminal 实际全链隔离夹具记录 `applied=true`、57 条有效目标回复、退出 0、无警告；此前 6 次简单 guard 原生压力也无警告，但没有触发重发，不作为真实丢包恢复证据。
- 三轮重发阶段发布及检查：67 份文档 verify、484 份源码语法及 3 份生成 Shell 语法通过；326 份 `.command` 中 282 个既有 guard 均使用新查询函数，旧单请求 guard 为 0。160 个运行映射检查无业务差异，其中 158 个更新 guard、2 个无 guard 保留；159 份字节一致，另 1 份只有原有末尾换行差异。整轮备份／总报告为 `/Users/jobs/.codex/backups/terminal-style-query-retry-20261115.WwpSjz/final-report.json`；报告明确 `originalUserSessionRetest=pending`，保留用户原会话重跑待确认。未跑旧 `restore.sh`、改全局终端设置／Skills／AGENTS、提交或推送。

- 用户补充与复现（2026-11-15，输入事实 confirmed／机制 scoped-verified）：用户确认安装中“按过方向键或连续回车”。以当时已部署代码保留完整 bootstrap／reexec 的独立 PTY 复现，cleanup 颜色项 10 的有效答复前混入真实 CSI 左键或连续回车均会失败；随后原生 Terminal 独立窗口在退出查询前注入 `←＋连续回车`，实采首包包含 `ESC[D＋LF＋LF＋完整 OSC 10 答复`，旧版临时配色已完整生效，仍退出 1 并出现原警告。这证明了已确认操作可以触发同类故障，但未直接采样用户原颜色项 10 现场，不据此宣称唯一根因或原会话复测成功。
- 当前退出按键兼容：只有 cleanup 查询显式传入阶段参数时，才在颜色帧边界消费已识别 CR／LF、CSI／SS3 四向键，以及 CSI `1;2..8` 修饰方向键；支持分片。一次 cleanup 在全部 19 个颜色项及重发之间共享最多 64 个控制单元，CR／LF 各算 1 个、完整方向键算 1 个，第 65 个立即停止自动恢复。普通文本、未知／残缺 ESC、帧内按键、无效 RGB、多记录及冲突答复仍严格失败；startup／applied 不接受上述按键。颜色仍须读取并比对为本次临时值后才恢复，保留外部改色，不盲目覆盖；3 轮真实重发及其有界等待继续保留。
- 退出按键兼容的原生 A/B 限定验证通过：完整 bootstrap＋假业务的新原型在独立 Terminal 窗口收到同一实际 29 字节首包，识别 3 个控制单元，临时配色完整生效、退出 0 且无恢复警告；还原后额外重新查询 19 项并逐项比对原始 normalized 快照，全部一致。76 条有效目标回复由保存 19＋临时核验 19＋cleanup 19＋还原后验证 19 组成，额外复核并非生产新增查询。仅关闭按唯一测试历史与空闲状态核对过的自建窗口，未操作用户原窗口；此夹具没有真实安装业务，不能替代用户原安装会话复测。
- 本轮发布与最终检查 scoped-verified：原 17 生命周期场景及完整 47 查询场景在代码相同的原型 guard 上全部 PASS，共 64 个独立正式场景；生产 guard 另跑新增 26＋原有 LF 两例共 28 项复核全部 PASS，属于重复验证，不虚增独立场景数。67 份文档 verify、diff check、484 份源码语法、3 份生成 Shell 语法通过；326 个入口中 282 个既有 guard 已更新，158 个运行 guard 已备份同步，160 个运行映射无业务差异（159 份字节一致，另 1 份仅原有末尾换行差异）。备份／最终报告为 `/Users/jobs/.codex/backups/terminal-style-cleanup-keys-20261115.b71cksnt/final-report.json`，原生 A/B 证据已复制到同根 `native-ab/`；继续明确 `originalUserSessionRetest=pending`。未执行真实 HOME 安装或旧 `restore.sh`，未改用户原终端／全局设置、Skills／AGENTS、Git 配置，未提交或推送；既有排除范围及 Finder App 不重打包边界保留。

- 用户后续原入口日志（2026-11-15 09:34，log-observed）：用户再次提供 `install（快捷入口）.command ; exit;` 的完整输出，本次已替换 `~/.zshrc`、打印同步完成及日志路径，随后正常保存会话，未出现配色恢复警告。该日志支持本次原入口正常完成；没有直接展示 19 项原色复核，也未说明是否再次制造方向键／连续回车余留，因此不外推所有按键场景均已完成用户实测。之前原会话失败反证保留。

- 当前设置核验／回退行为（2026-11-15，需求 confirmed／隔离与原生独立会话 scoped-verified）：设置核验也有界接受帧外回车与明确方向键；核验失败重新读取19项当前值，安全撤回成功后纯文本继续业务，取代旧“applied按键严格停止且未完成核验不恢复”的行为。484份同源源码与SourceTree41份运行guard已更新，保护块外业务保留；87项配色及35项远程地址回归通过，原生独立会话相同按键对照与还原后19色读回通过。具体范围与用户要求的现行范本维护方式见[[SourceTree-脚本体系#terminal-style-template|终端临时配色与现行范本]]；本轮没有同步其它环境安装副本，也没有操作用户原TTY或执行旧restore脚本。

## 八、<span id="zshrc-activation-message">环境同步生效提示</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-15 核对 `source ~/.zshrc` 提示后，明确要求区分已打开与新打开的终端；状态：confirmed；创建 / 更新：2026-11-15；适用范围：`🌍JobsMacEnvVarConfigs/install.command/install.command` 环境同步安装器及其 `~/.JobsMacEnv/install.command` 已安装副本。完成提示应说明：当前已打开的终端需在各自窗口执行 `source ~/.zshrc` 重新加载配置；新打开的交互终端会自动加载 `~/.zshrc` 中的最新配置，无需手动执行。这里的“最新”指该文件当前内容，不承诺跳过替换时也会加载本次生成的配置。本轮只调整这两份安装器的提示文案，不新增自动 `source`、不改变安装流程，也不扩展为其它脚本或 Skills 的全局约束。

## 九、<span id="global-flutter-update">全局 Flutter 与项目 FVM 更新边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：用户于 2026-11-15 明确要求 `update` 升级本机已配置的全局 [**Flutter**](https://flutter.dev/) 环境，没有则跳过且不安装；项目 SDK 由 [**FVM**](https://fvm.app/) 独立管理。状态：confirmed；创建／更新：2026-11-15；仓库：`/Users/jobs/Documents/GitHub/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs`。
- `scripts/update.command/update.command` 只发现和升级独立全局 SDK；先跳过 PATH 中的项目 FVM／未知包装入口，继续检查有效 PATH 候选、Flutter 环境变量及 Homebrew 实际前缀。FVM 数字版本、频道缓存和项目绑定均不因全局维护而改写；未安装 FVM 工具也不借 Dart 顺手安装。
- 全局 SDK 沿用当前频道获取最新版，不隐式换频道或来源；升级在 SDK 目录执行，避免 Flutter 官方 `upgrade` 根据调用方工程执行 pub 依赖升级。用户另行明确授权的项目换版单独执行，不视为全局 `update` 的默认动作。
- 限定验证（2026-11-15，scoped-verified）：Flutter／Gem 隔离回归 29 项、入口隔离 15 项及语法通过；本机只读发现 Homebrew 全局 SDK 为 Flutter 3.50.0。本轮修改源码及说明，未执行全量环境同步或整轮真实 `update`，现有已安装短命令副本不冒充已部署。

## 十、<span id="script-unification-20261117">脚本规范统一与源码迁移</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：用户在 2026-11-16 要求按现行脚本 Skills 和公约统一，并明确范围“仅 JobsGenesis 下的脚本”，2026-11-17 要求继续；状态：confirmed（范围）、scoped-verified（源码迁移与隔离验证）；适用仓库：`/Users/jobs/Documents/GitHub/JobsGenesis`；创建 / 更新：2026-11-17。
- 当前源码使用含扩展名的同名包装目录及按角色适用的平台前缀，就近保留 README；source / import 库、固定工具名、测试协议入口和已发布 App 平铺资源按各自职责处理，不能把源码包装路径写回旧收据或安装产物。路径与逐文件验证集中在仓根 `项目相关报告/脚本路径映射.json`、`脚本统一验证清单.json` 与 `脚本统一审查.md`，后续定位先查现行清单；根 `🔎审计脚本.py` 继续保留已确认的独立入口例外。
- Sourcetree 固定运行副本与源码副本先备份、保留各自有效独有内容后同步；实际菜单配置只读核验。OS 扩展的源码包装与 Bundle 资源名分离，通过显式复制阶段保留旧发布路径；仅源码验证不代表已安装 App 更新。本轮 Windows AST / BOM、静态夹具或 macOS PowerShell 检查均不替代 Windows 5.1 / CMD 实机验收，也不覆盖先前日期的原生验证记录。

## 十一、<span id="nested-git-gui-20261118">父子 Git 仓库管理收口为双端 Python GUI</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 来源：用户于 2026-11-18 结合 JobsGenesis 根目录截图明确提出；状态：confirmed（需求与推广边界）；创建／更新：2026-11-18。当前实施仓库为 `/Users/jobs/Documents/GitHub/JobsGenesis`。
- 用户要求将根目录子模块下载／递归同步、父子引用维护、`.gitmodules` 维护收进一个 [**Python**](https://www.python.org) GUI，按 [**MacOS**](https://www.apple.com/macos/)／[**WindowsOS**](https://www.microsoft.com/windows) 双端组织。仓内新建一个功能目录，放完整可修改源码、源码阐述 README、构建入口和生成的可运行包；仓根放相对定位的普通快捷启动入口，不用 Finder 替身，不硬编码本机仓库路径。
- 根 `【MacOS】🧹清理缓存与构建产物.command` 用户明确不要，清理职责由 `OS@Extension` 下现有 Finder／资源管理器扩展承担；不在新 Git 面板重复提供清理功能。此要求对截图中仓根配置入口生效，不授权删除子仓同名工具或改动系统扩展。
- 此类父子嵌套 Git 仓库今后采用同一标准；本轮先整改 JobsGenesis；同任务后续用户明确指定将标准推广到其子仓 `JobsConfigOS`，当前授权范围为这两个实际 Git 根，其它仓库仍等待点名，不自动批量铺开。主规则收口现行 `jobs-git-repository/SKILL.md` 的 `nested-git-gui`；旧脚本包装与三个独立文档条目要求在已迁移仓按新 GUI 的真实布局与能力描述，不延续已删除入口。
- 同日用户依据界面截图追加，并明确并入此类父子嵌套 Git 仓库的通用标准（confirmed）：窗口及页内标题要明确“Git 父／子仓管理”，主标题前配图标；语言与主题控件同一横行，标签前分别有对应图形标识；“选择仓库”不带省略号；移除“进入面板只扫描”横幅。现行通用实现规则仍归 `jobs-git-repository/SKILL.md#nested-git-gui`，本轮实现 JobsGenesis，并已获用户明确指定推广到其子仓 JobsConfigOS；其它仓库等待用户点名，移除横幅不取消写前预览与确认。
- 本轮两仓已实际接入同一 `1.0.1` 六模块源码与本地Git图标，分别构建Mac成品并原生扫描JobsGenesis的10子仓、JobsConfigOS的8子仓；对应记录位于两仓本轮Git父子仓资产盘点（2026-11-18，scoped-verified）。Windows目前是完整源码及本机构建入口交付，未生成或验收Windows EXE，不能把Mac结果外推。
- 需求确认与实现验收分开：当前源码、产物、相对启动和两端验证状态以仓根 `项目相关报告/` 对应资产盘点为准，不能从本记忆推断任一平台已完成实机验收；本次标准记录不授权业务仓暂存、提交、推送或远程变更。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
