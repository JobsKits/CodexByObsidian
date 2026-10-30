---
type: project-memory
status: active
scope: sourcetree-scripts
runtime: /Users/jobs/SourceTree.command
backup: /Users/jobs/Documents/Github/JobsGenesis/SourceTree.command
created: 2026-07-15
updated: 2026-10-29
tags:
  - codex-memory
  - project
  - sourcetree
---

# SourceTree 脚本体系

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、必须同步的位置](#jobs-toc-heading-2)
- [二、验证基线](#jobs-toc-heading-3)
- [三、Git Fetch 引用冲突修复](#jobs-toc-heading-4)
- [四、Commit / Fetch 场景化解锁](#jobs-toc-heading-5)
- [五、Magic Resume 后台运行](#jobs-toc-heading-6)
- [六、Sourcetree 菜单挂载完成定义](#jobs-toc-heading-7)
- [七、逐层空白提交推送的递归范围](#jobs-toc-heading-8)
- [八、单本地分支同步双平台](#single-local-branch)
- [九、批量推送中断后的用户选择](#resume-push)
- [十、非管理员新电脑与安装器 Git 副本](#installer-git-copy)
- [十一、只拉取仓库与安装菜单关联](#readonly-pull)
- [十二、Git 动态网络双击配置入口](#dynamic-git-installer)
- [十三、Flutter 鸿蒙独立打包入口](#flutter-ohos-packaging)
- [十四、Flutter 体检与生成脚本的右键平行实现](#flutter-doctor-codegen)
- [十五、双端远程地址复制与打开](#remote-copy-open)
- [十六、远端改名与逐层推送](#remote-alias-push)
- [十七、自定义菜单分类与打包命名](#action-menu-groups)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> SourceTree 脚本、同名 README 和脚本行为文档的双位置维护边界。

2026-10-23 用户确认平台划分：两根中的原动作包均迁入 `MacOS/`，Windows 对应实现放 `WindowsOS/`。本文历史路径在没有平台层时的记录保留；后续实际寻址在根与包名之间加 `MacOS/`。带 ASCII 冒号的 Flutter 运行包已改为全角 `：`；菜单按新路径迁移并保留用户标题。详见 [[JobsGenesis-脚本双端目录]]。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、必须同步的位置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行目录：`/Users/jobs/SourceTree.command`。
- 备灾目录：`/Users/jobs/Documents/Github/JobsGenesis/SourceTree.command`。
- 来源：用户于 2026-10-09 再次明确确认并要求记住；状态：已确认；适用范围：整个 `SourceTree.command` 运行目录。每次修改运行态，必须在同一任务中按相同相对路径同步到备份态，覆盖改动的脚本、`README.md` 和脚本行为文档；方向为运行态 → 备份态。
- 来源：用户于 2026-10-16 明确要求保留唯一仓库副本并淘汰旧库，要求记住；状态：已确认；适用范围：`JobsGenesis` 内的 SourceTree 仓库位置与父子仓关系；创建 / 更新：2026-10-16。
- `JobsGenesis` 内唯一保留的仓库副本为 `/Users/jobs/Documents/Github/JobsGenesis/SourceTree.command`；淘汰 `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/🌲SourceTree.sh`，今后不得从备份或安装清单重新建立旧库。运行目录 `/Users/jobs/SourceTree.command` 继续保留，运行态 → 备灾态双位置同步规则继续有效。
- 删除旧库必须同时移除直属父 [**Git**](https://git-scm.com/) 仓库的 `.gitmodules` 条目、索引中的 gitlink、本地 submodule 注册及旧 Git 元数据关联；不能只删除工作目录。
- 两个本地仓库副本共用 `SourceTree.sh` 远端；保留 [**GitHub**](https://github.com/) / [**Gitee**](https://gitee.com/) 远端仓库及现有 URL。淘汰旧本地副本不代表授权删除远端仓库。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、验证基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用 `cmp` 或内容哈希核验两份对应文件完全一致。
- 如果修改 `.command`，必须分别对运行副本与备灾副本执行 `zsh -n`。
- 新增或修改 Sourcetree 脚本时，必须把动作实际写入当前用户 `actions.plist` 并完成重载验证；只生成脚本或 README 不算完成。
- 当前用户 `actions.plist`、运行目录和备灾目录内的菜单配置必须同步，覆盖前生成带时间戳的可恢复备份。
- Codex 负责菜单项除显示标题之外的全部配置。用户可能自行调整显示标题，因此更新已有动作时按目标脚本路径识别并默认保留当前标题，除非用户明确要求改名。
- 详细决策见 [[30-工作流决策/工作流决策#三、SourceTree 双位置同步|SourceTree 双位置同步]]。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、Git Fetch 引用冲突修复 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `【MacOS@SourceTree】📥修复Git无法Fetch.command` 是独立 Sourcetree 动作，与 Commit 修复脚本分开维护。
- 脚本处理远端分支在 `foo` 与 `foo/bar` 之间迁移造成的文件/目录冲突，也处理远端 `SaaS` 与 `saas/...` 在 MacOS 大小写不敏感文件系统上的路径碰撞。
- 安全流程是“先正常 Fetch→仅命中远端跟踪引用冲突才继续→读取远端真实分支→仅提取错误点名的目标分支→备份阻塞 loose ref/reflog→重试 Fetch”。
- 冲突元数据移入目标仓库的 `.git/jobs-ref-conflict-backups`，不直接删除；脚本不修改工作区、索引、本地分支或提交历史。
- 验证基线：使用临时 Git 仓库分别复现 `foo → foo/bar` 和 `foo/bar → foo` 后验证自动修复；大小写碰撞还要确认脚本只处理错误点名的分支。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、Commit / Fetch 场景化解锁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- Commit 修复固定拆成 `C01`–`C07`：工作树与 gitdir 绑定、`index.lock`、`.gitmodules` 暂存顺序、嵌套工作树与路径迁移、子模块与 gitlink、一轮完整索引刷新、索引/dry-run 解锁复验；每个场景必须有独立函数、出现原因和通过日志。
- Fetch 修复固定拆成 `F01`–`F05`：原生 `fetch --prune`、`remote prune`、MacOS 大小写路径碰撞、前缀文件挡目录、同名目录挡文件；每产生一项实际修复就立即重新 Fetch，成功后停止后续元数据处理。
- Fetch 大小写碰撞不能只搬移 loose ref；应先用 Git 原生 `pack-refs` 保留有效引用并释放大小写前缀文件路径，再备份冲突 reflog 后复试。
- 两份同名 README 必须专门维护“故障现象、出现原因、独立处理、解锁判据、不处理边界”，并与脚本场景编号一一对应；JobsDocs Git 故障手册继续保留跨主题知识地图，但与单个脚本直接相关的原理、错误分流、诊断命令、手工边界和执行后核对必须完整下沉到同名 README，不能只在 JobsDocs 保留或只放链接。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、Magic Resume 后台运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-06 明确确认；适用脚本为 `【MacOS@SourceTree】🪄配置并运行Magic Resume.command`。
- 当前仓库任意 remote 指向 `JOYCEQL/magic-resume` 时直接使用当前仓库；不匹配时先扫描父目录第一层的全部同级文件夹，目录名不限，候选自身必须是 Git 根目录且任意 remote 指向官方仓库。只有全部同级目录都未命中时，才新建 / 复用完全空的同级目录后克隆，禁止覆盖非空冲突目录。
- 按官方快速开始执行 `pnpm install` 与 `pnpm dev`，服务就绪后打开 `http://localhost:3000`；不自动执行 `git pull`、依赖升级、构建或部署。
- 开发服务器必须使用 `nohup`、断开标准输入并脱离 zsh 作业控制在后台运行，保证关闭终端或 Sourcetree 输出窗口后服务继续可用，同时记录服务日志和实际监听 PID。
- 3000 端口只复用脚本 PID 文件已记录的当前仓库后台 Vite；当前仓库未托管的 Vite dev 只发送普通 `TERM` 后转为后台运行，不强制结束；其它目录或无法确认为 Vite dev 的监听进程一律不处理并报错退出。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、Sourcetree 菜单挂载完成定义 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-13 明确确认；适用于今后所有 Sourcetree 脚本的新建、修改和重命名。
- 每次交付必须完成运行副本、备灾副本、两边菜单配置和当前用户 Sourcetree 动作配置的同步，并验证菜单动作能够解析到可执行脚本。
- 用户侧最多只调整 Sourcetree 菜单显示标题；动作路径、`$REPO` 参数、动作类型、输出策略、执行权限、安装与备份由 Codex 完成。
- 更新已有动作时，默认保留用户在 Sourcetree 中修改过的显示标题。修改 `actions.plist` 前生成可恢复备份，重载后反查动作唯一性与配置字段。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、逐层空白提交推送的递归范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-30 明确确认；适用于 `【MacOS@SourceTree】🚀逐层空白提交并Push.command`。
- 从 `JobsGenesis` 等大仓运行时，必须先递归处理其管理的子仓，例如 `SourceTree.command`；子仓完成 commit + push 后，父仓再提交并推送更新后的 gitlink。仅向上查找父仓不满足需求。
- 从小仓运行时，处理该子树后继续向上处理父仓，不扩展上层兄弟仓。无改动不创建空提交，仍可推送已有提交；任一失败停止后续队列。
- 来源：用户于 2026-09-30 确认落盘游离态自动恢复流程。仅对游离仓舍弃独有提交、未提交改动及非忽略的未跟踪文件；先明确目标分支并成功 fetch，再恢复远端最新版本，正常分支内容保留。忽略文件、未跟踪嵌套 Git 仓库及已有正常分支独有提交不自动删除。
- 已替代（`superseded`，2026-10-03）：`clean.command` 清理必须输入 YES 的旧确认方式。现按回车继续，按 Ctrl+C 取消；Sourcetree 按已声明策略无交互执行。
- 已替代（`superseded`）：逐层推送脚本遇到任何游离 HEAD 一律停止的旧行为；目标不明确、fetch 失败、冲突或未完成操作仍停止。

- 来源：用户确认远端存在本地没有的提交时必须先拉取，最终同步结果要求本地与远端一致。正常分支采用 fetch、提交本地改动、快进或合并远端、push、远端提交号核验；保留双方历史，不强推，合并冲突停止并保留现场。该规则替代此前正常分支不获取远端、直接 push 的行为。

- 来源：用户于 2026-10-02 明确确认新增码云线路；逐层推送需同时覆盖已配置的 GitHub 与码云。每仓先获取并整合全部目标线路，再推送同一最终提交并逐条核验；全部成功才处理父仓，单线子仓保留兼容，不自动创建远端仓库。
- 项目例外（2026-10-07，confirmed）：上述双线路同一提交要求仅在 `/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods` 内已被取代（`superseded`）。该工程 GitHub 保留 `byPods` 完整历史，Gitee 使用独立零点快照；不运行通用动作合并两条历史，改用原生推送窗口或明确映射。其它仓库的通用要求保留；详见 [[Jobs-iOS-仓库族#五十六、OC 新工程的 GitHub 完整历史与 Gitee 零点快照|OC 新工程双远端例外]]。
- 来源：用户于 2026-10-04 明确确认；适用范围：`/Users/jobs/Documents/Github/JobsBaseConfig`、`/Users/jobs/Documents/Github/JobsGenesis` 及其下属仓库。码云远端别名和默认远程目标分支为 `gitee`，显式仓库例外按[局部覆盖约定](#single-local-branch)执行；不强推、不覆盖，未配置码云仓库时不擅自创建远程仓库。旧条目中“对应本地跟踪分支也统一为 `gitee`”已替代（`superseded`，2026-10-16），不再创建或维护额外本地 `gitee` 分支。

- 来源：用户于 2026-10-02 明确要求逐层推送动作从 Sourcetree 打开独立 Terminal.app，以实时查看日志。Sourcetree 仅负责启动；终端回车确认后执行，游离态清理保留 YES 门禁，结束后保留结果与退出码。

- 来源：用户于 2026-10-06 明确要求；状态：已确认；适用范围：逐层空白提交并推送脚本；创建 / 更新：2026-10-06。游离态舍弃的 `YES` 提示前必须逐项显示待处理子仓完整路径，不能仅报仓库数量；恢复分支和本次 fetch 固定的目标提交号一并展示并写入日志。应用与备灾两处脚本及 README 同步，继续按两份 `zsh -n` 和 `cmp` 验证。

## 八、<span id="single-local-branch">单本地分支同步双平台</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-16 在逐层空白提交推送脚本任务中明确要求写入 Git 相关 Skills；状态：已确认；创建 / 更新：2026-10-16。
- 适用范围：`SourceTree.command` 运行态和备灾态中的 `【MacOS@SourceTree】🚀逐层空白提交并Push.command`，以及它递归处理的父仓、子仓。用户常用“大 Git 套小 Git”管理；每仓一份代码、一个本地工作分支，同步 GitHub / Gitee 各自的主分支。
- 维护和运行该脚本均不得额外建立本地分支，也不得把辅助分支推到远端；两端主分支名称可以不同，复用已有本地工作分支并显式映射同一最终 HEAD。游离态只恢复明确的已有本地分支，缺失或目标不明确时先停止。已有额外分支不自动删除。
- 此决策替代第七节旧的本地 `gitee` 跟踪分支要求；远端 `gitee` 别名和默认目标分支约定保留。OC 新工程的独立快照例外继续走专用流程，不扩展到通用脚本。
- 来源：用户于 2026-10-16 要求修正账户工具仓库远端分支并防止逐层动作重建旧分支；状态：已确认；创建 / 更新：2026-10-16。固定码云策略支持从各仓本地配置读取非空 `remote.gitee.jobsPushBranch` 覆盖目标分支；全局同名配置不生效，不继承到父仓或子仓。未配置或空值继续用原默认映射，非法分支名或读取异常明确报错并停止，OC 独立快照门禁保持有效。
- 项目例外：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexAccountSwitcher.py` 本地配置为 `remote.gitee.jobsPushBranch=main`，同一已有本地 `main` 同步到 GitHub / Gitee 的 `main`，Gitee 默认分支也为 `main`；原本适用该仓的远端 `gitee` 目标约定已替代（`superseded`）。其它仓库仍沿用原默认 `gitee` 映射，详见[[JobsCodexAccountSwitcher-双端账户工具#repository-branches|账户工具分支约束]]。
- 专项规则归 `/Users/jobs/.agents/skills/jobs-git-repository/SKILL.md`，包含触发描述、分支禁止边界、远端显式映射和隔离验证要求。

## 九、<span id="resume-push">批量推送中断后的用户选择</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-16 明确要求；状态：已确认；创建 / 更新：2026-10-16；适用范围：`SourceTree.command` 中的逐层空白提交并推送脚本及其批量父子仓队列。
- 批量任务中某仓失败并需要人工介入后，再次运行必须由用户选择“从失败处继续”或“从头执行”，不能默认每次重复全部已完成仓库。
- 已完整推送并核验的仓库逐仓保存检查点；续跑前复查本地分支、HEAD、有效 Git 配置和工作区，变化时从最早变化仓重做。失败仓即使已推完部分线路，也按完整仓库流程重试；保留已完成子仓信息以供父仓 gitlink 收口。
- 检查点放在起始仓库实际 Git 管理目录内，按完整队列及连续已完成前缀记录，原子替换，不把状态文件作为 Shell 代码执行；队列变化或状态损坏时不能猜测跳过。成功结束清除检查点和旧日志迁移候选。
- 旧版失败日志只作为候选进度：起始仓库及队列必须一致，选择续跑后先核验本地状态和当前各目标远端提交，再跳过历史成功前缀；取消选择保留候选。运行态与备灾态脚本、README 同步维护。

## 十、<span id="installer-git-copy">非管理员新电脑与安装器 Git 副本</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 报告新电脑运行安装器失败，并说明使用非管理员访客账户、目前访问权限开放；状态：账户背景为用户确认，复制错误为本地隔离复现；适用范围：`【MacOS】安装SourceTree自定义菜单.command`；创建 / 更新：2026-10-18。
- 安装器使用当前用户可写目录与用户级菜单配置，不依赖管理员身份，不使用 `sudo`。远端新电脑的实际权限错误仍按原始诊断区分，不能只凭通用校验失败消息判断账户权限。
- 备灾库是父仓子模块，真实 Git 目录位于 `JobsGenesis/.git/modules/SourceTree.command`；其 `core.worktree=../../../SourceTree.command` 复制到独立 `.git` 后可能失效。旧版 `git -C 暂存目录 config --local --unset` 会先进入失效路径并失败，原脚本还会忽略这次失败；使用 `git config --file` 直接清除暂存 `config` 与已有 `config.worktree` 的全部 `core.worktree`，仅允许无键退出码 5，随后核对实际工作树根目录、HEAD 和只读状态。
- 安装器属于终端交互入口，不作为 Sourcetree 自定义动作挂载；维护它不新增菜单项。本地运行态与备灾态的脚本 / README 同步，隔离验证覆盖发送、最终目录改名、替换备份及失败保留目标和清理暂存；未操作真实菜单、提交或推送。新电脑须取得更新后的同名脚本才生效。
- 来源：用户于 2026-10-29 提供真实安装失败日志；状态：故障复现与修复 verified；创建 / 更新：2026-10-29。源 Git 目录含 `fsmonitor--daemon.ipc` Unix socket 时，`ditto` 会报 `Operation not supported on socket`；安装器的工作树与 Git 元数据复制统一采用系统 tar 流，按实际类型跳过 socket，同名普通文件、权限、链接、扩展属性继续保留。两端管道失败均传播，普通文件读取 / 提取失败仍停止，旧目标只在复制和 Git 校验成功后备份替换。不得删除源 socket、停止源监控器或修改源配置来规避；校验暂存副本时仅对当前 Git 命令使用 `-c core.fsmonitor=false`，不持久化。
- 同日验证：独立 `.git/` 与外置 gitdir、真实临时 socket、普通文件同名、特殊字符与属性、源配置 / 索引保持、成功备份和失败保护共 5 组 59 项断言通过。另用用户实际源库及真实 Git socket 在私有临时目录完成完整复制，独立 Git 根目录、HEAD 和只读状态正常；源 socket inode、配置、索引及当前菜单哈希未变。修改的 6 个文件在运行 / 备灾两处一致，两份 `zsh -n` 通过；没有整体替换真实运行库，用户可重新运行原安装入口。
- 来源：用户于同日提供另一台 Mac 调整后的无 `1` 版本，并反馈本机已完成复制与菜单安装，但 socket 扩展属性提示与成功行连在一起；需求 confirmed。当前主入口统一保留无 `1` 版本的跨机能力：旧目标库保留标志、全部动作普通 / 可执行校验、仅保留旧库时整组回退至健康源库、Flutter 旧 ASCII 冒号迁移、菜单预检和应用退出保存后重新合并。`【MacOS】安装SourceTree自定义菜单1.command` 保留原样作为用户旧版对照，不回退覆盖新版。
- 当前复制流程先用系统 find 生成 NUL 相对清单、按实际类型预排除 socket，再由 tar 以 `--no-recursion --null -T` 归档，普通同名文件、链接与扩展属性保持；不用关闭扩展属性或过滤错误文本来掩盖问题。诊断同步收集并逐行输出，补齐末尾换行；预检静默，最终合并只报告一次运行库及必要回退说明。清单 / 归档 / 提取失败仍停止，临时清单由 always 清理。
- 当前验证：复制 8 组 80 项、跨用户路径及菜单流程 9 组 120 项断言通过；本机真实源库与实际 socket 的临时复制退出 0，输出 / 日志无原始 socket 或扩展属性警告，成功行独立。源配置、索引、socket inode 与真实菜单保持，7 个改动文件双位置一致，旧 `1` 对照未改。用户提供日志确认之前版本已在本机真实安装成功；本次规整版未整体部署或重启应用，另一台 Mac 未接入，需将当前主入口同步过去再做实机复测，不能将本机跨用户夹具等同于两台实机验收。

## 十一、<span id="readonly-pull">只拉取仓库与安装菜单关联</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 明确要求；状态：已确认；创建 / 更新：2026-10-18；适用范围：SourceTree 自定义动作及只能拉取、没有推送权限的本地仓库。
- 独立动作 `【MacOS@SourceTree】⏬只拉取远程代码.command` 通过 Terminal 执行，同步当前仓库明确的远程上游并向下检出各层父仓 gitlink 固定版本，不提交、不推送。发现本地改动时必须红字列出风险，只有精确输入大写 `YES` 才允许舍弃；回车和其它输入均取消，不得以 SourceTree 无交互策略绕过。
- 新增、修改或重命名 SourceTree 动作，必须同时关联 `【MacOS】安装SourceTree自定义菜单.command/` 内安装器的动作登记、`actions.plist` 模板和 README；随后同步运行态、备灾态和当前用户动作配置，保留用户已有标题。此规则已收口到现行 `jobs-macos-shell/SKILL.md` 的 SourceTree 部分，不仅修改当前机器菜单。
- 实现保护边界：先成功 fetch 并固定提交，再允许危险确认；暂存 / 未暂存 / 未跟踪及本地独有提交均检查。忽略内容保留，子仓源码 / 暂存指针、嵌套仓库、未完成操作、目标不明确及路径覆盖风险停止，避免父仓授权扩大到子仓。


- 来源：用户于 2026-10-19 明确选择补齐递归只拉取，并要求 `/Users/jobs/Documents/Github` 全部同名下载入口同步；状态：用户需求已确认、实现经隔离验证；创建 / 更新：2026-10-19。只拉取先预检整棵目标提交树，再同步父仓并逐层按 gitlink 检出，允许纯 HEAD 漂移；不使用 `--remote`，不暂存、不提交、不推送。现有单仓动作对普通子模块指针变化一律停止的旧行为已替代（`superseded`），子仓源码、暂存指针、独有游离提交和未完成现场仍保护。
- 同日实现：8 份 `【MacOS】⏬下载配置当前Git子模块（可向下同步递归）.command` 内嵌相同完整只拉取引擎，回车默认消费固定版本；显式选择维护模式保留各仓原清单、子树选择、深度切换与 `AUTO_PARENT_*` 开关。只拉取不进入 Homebrew / fzf 安装流程，`DRY_RUN=1` 明确停止；旧缓存缺工作树先保护并提示恢复。覆盖 JobsGenesis 根、Python、Gits 包、MacOS 扩展、JobsConfigOS、VScode 包、Codex 配置及 JobsBaseConfig 根；README 同步，SourceTree 运行态 / 备灾态及已安装菜单关联核验。
- 发布边界：父仓锁定的子 SHA 必须在所选托管线路可获取；`not our ref` 由发布电脑补齐对应子仓提交，消费端删除重克隆或提交旧指针不能修复。各子仓追分支最新并自动提交父仓是维护流程，不能用于只拉取电脑消费发布版本。18 组真实 Git / PTY、15 例离线地址矩阵、下载两种入口布局及重复运行通过；本轮没有业务仓提交或推送。

## 十二、<span id="dynamic-git-installer">Git 动态网络双击配置入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 明确要求写入 `JobsCommand@Gits`，双击即可完成本机配置；状态：用户需求已确认、实现经隔离安装与恢复验证；创建 / 更新：2026-10-22。
- 源仓：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Gits`。入口为 `【MacOS】🌐双击配置Git动态代理.command/【MacOS】🌐双击配置Git动态代理.command`，完整内嵌 Git 网络代码，单独携走主文件即可安装，不依赖已有 JobsMacEnv 或原仓路径。
- 双击阅读自述后回车安装，`C` 检查、`R` 恢复；CLI 支持 `--install`、`--check`、`--restore`。运行代码部署到当前用户 Application Support 下 `JobsGitNetworkStrategy/runtime/bin/git`，仅在用户 `.zshrc` 末尾挂载受控 PATH 块，并配置已安装 Sourcetree 的 `gitCustomPath` / `gitWhichOne`；不改 `.gitconfig`、系统代理、VPN 或项目远端。
- 默认系统代理可用时优先、关闭或不可达时探测直连；地址与端口动态读取，Git 业务最多执行一次，HTTP(S) 范围及 SSH / PAC / 多目标边界见包内 README。Sourcetree 在途任务不被结束，已运行应用保存工作后自行重启加载选择。
- 私有快照精确保存文件与偏好的存在状态、值和类型，恢复保留用户后加的无关 Shell 正文；同值异型、失去执行权限或后续受控项冲突明确报错。同版本重复安装不叠加配置，升级可恢复上一版，恢复可重复调用。该入口是独立本机配置安装器，不是 Sourcetree 自定义动作，不新增菜单登记或修改 `SourceTree.command` 双副本。

## 十三、<span id="flutter-ohos-packaging">Flutter 鸿蒙独立打包入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 要求鸿蒙与 Android 打包存在差异时补齐独立 Sourcetree 脚本；状态：需求已确认、实现经隔离检查与真实菜单加载核验；适用范围：本仓及运行库的 Flutter 打包动作；创建 / 更新：2026-10-22。
- 入口：`【MacOS@SourceTree】📦双击打包Flutter.ohos.command/【MacOS@SourceTree】📦双击打包Flutter.ohos.command`，双位置同步；安装器登记、模板、当前用户 `actions.plist` 均已补齐，菜单名 `📦打包生成HAP+APP文件（Flutter.ohos）`（2026-10-29 用户要求，替代原默认名 `📦双击打包Flutter.ohos`，旧名 superseded），仓库参数 `$REPO --target all --mode release`（2026-10-28 已在真实设置页核对），旧动作及其它用户标题保留。
- 面向已有 `ohos/` 的 Flutter 适配工程，默认 release 同时生成 HAP + APP（2026-10-28 用户明确要求，替代旧默认 HAP），显式 CLI 兼容 `--target hap|app|all`、`--mode release|debug|profile` 和 `--flutter-sdk`；需要匹配工程的鸿蒙适配 SDK / DevEco 工具链，普通 Flutter Android SDK 不替代。FVM 固定 SDK 缺失或不具备所选包型能力时停止，不自动下载或升级工具链、不创建平台、不改签名。
- 两份 `zsh -n`、25 项假工具链检查、PTY 确认、44 项安装器隔离检查及 Sourcetree 重启后“自定义操作”可见性通过；真实工程构建、签名、安装和上架未执行。增量构建允许已有非空产物，不能把目录中旧产物存在等同于本次新生成或签名发布已验收。

## 十四、<span id="flutter-doctor-codegen">Flutter 体检与生成脚本的右键平行实现</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-22 明确要求审查升级两个现有脚本并补齐双端右键入口；状态：需求已确认、源码已实现；创建 / 更新：2026-10-22。`【MacOS@SourceTree】🐦Flutter项目体检.command` 与 `【MacOS@SourceTree】🐦Flutter自动化生产代码.command` 继续独立、自包含、双位置同步。
- macOS `JobsFlutterDoctor/Scripts/InspectFlutterProject.zsh`、`JobsFlutterCodegen/Scripts/GenerateFlutterCode.zsh` 分别携带原脚本完整副本，按字节一致性防分叉；修改原脚本须同步资源并重新构建安装，不能依赖源仓绝对路径。Windows 对应独立包保持相同生成器启用规则和 FVM 停止边界。入口、风险和验证范围见 [[MacOS-Finder-扩展体系#flutter-doctor-codegen|双端体检与代码生成]]。

## 十五、<span id="remote-copy-open">双端远程地址复制与打开</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-28 明确要求；状态：需求 confirmed；创建 / 更新：2026-10-28。适用范围：`/Users/jobs/SourceTree.command` 与 `/Users/jobs/Documents/Github/JobsGenesis/SourceTree.command` 中的 macOS / Windows Sourcetree 动作。
- `🌐获取远程仓库地址` 与 `🌍打开远程仓库地址` 使用同一套候选逻辑：枚举全部 remote 的所有生效 fetch / push URL，按完整 URL 去重，不再默认取 origin 首地址；唯一地址直接执行，多地址交给独立终端使用 fzf 单选。取消、无匹配和失败不复制 / 打开；Sourcetree 后台不能交互。
- 获取动作复制原始 Git 地址；打开动作转成 HTTP(S) 网页地址，SSH / Git 非默认端口不能猜网页映射，要求明确 HTTP(S) 地址。菜单和日志脱敏，依赖按需沿上游检查、确认安装 / 修复、刷新会话并复检，失败停止。
- 继续执行双位置、安装模板与当前用户菜单同步，保留用户标题；Windows 对应实现及动作安装清单必须同时覆盖。macOS 当前用户菜单已安全重载并看到两个入口；Windows 原生菜单与 WinGet 实际安装另验，不把 macOS PowerShell 隔离测试写成 Windows 实机通过。

## 十六、<span id="remote-alias-push">远端改名与逐层推送</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-28 实测改名规避原生网页入口问题，随后明确指定账户工具远端名称并要求修复逐层推送兼容；状态：用户命名 confirmed，Mac 实现与隔离回归 verified；创建 / 更新：2026-10-28。
- 用户在 CodeSnippets 实测将 `gitee` 改为 `pitee` 后，原生“显示远程服务器”打开 GitHub；随后指定 `/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/JobsCodexAccountSwitcher.py` 使用 `Github` / `码云`。这不授权批量重命名其它仓库，不把单次名称排序现象当作跨版本保证，也不沿用“只能新增自定义操作”的旧排除结论。
- Mac `【MacOS@SourceTree】🚀逐层空白提交并Push.command` 按完整官方主机识别平台，支持改名及旧名称；保留已配置 upstream。无上游时保留 `origin` 优先，否则接受唯一有效远端或唯一 GitHub 候选，歧义停止。没有 URL 的残留配置不当作线路，非官方网络主机不因平台别名自动纳入；本地镜像兼容原平台别名。
- 本节替代第七节“码云别名固定为 gitee”的限制，以及第八节覆盖键固定旧别名的表述；固定范围的默认远端目标分支仍为 `gitee`，实际覆盖键改为 `remote.<实际名称>.jobsPushBranch`，仅仓库本地非空合法单值生效。旧名 `gitee` 自然继续兼容，不读取孤立旧键；多值、非法值、同地址矛盾映射或读取失败停止。账户工具已补回 `remote.码云.jobsPushBranch=main`，两端仍推 `main`，不创建本地分支。
- 运行 / 备灾脚本、README 与新回归文件同步；23 项隔离回归覆盖真实本地 bare 双端获取、整合、提交及推送，新旧名称、显式上游保持、失败停止、游离恢复与 OC 快照门禁。双份 `zsh -n` / `cmp` 通过，检查点配置摘要包含路由版本，已安装动作仍指向原运行路径。业务仓只恢复上述本地配置键，没有提交或推送；Windows 现有实现本轮未修改。

## 十七、<span id="action-menu-groups">自定义菜单分类与打包命名</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-29 提供真实菜单截图并明确要求归类；状态：分类和鸿蒙命名 confirmed，配置与隔离合并 verified；适用范围：本机 macOS Sourcetree 自定义操作及安装模板；创建 / 更新：2026-10-29。
- 打开类集中，Git 类集中，Flutter Android / iOS / 鸿蒙打包相邻；现行顺序为“打开 → Git 与地址 → 修复 → Flutter 维护 → CocoaPods → 打包 → 工具”。同日用户追加要求两项获取地址放一起，`🌐获取远程仓库地址` 后紧接 `📒获取目标绝对地址`；Git Commit、Git Fetch、Flutter 中文路径三项修复连续排列；体检标题使用 `🏥Flutter项目体检`，末尾不带 `.`。鸿蒙标题须体现同时生成 HAP 与 APP，使用 `📦打包生成HAP+APP文件（Flutter.ohos）`；物理脚本文件名和路径不变。
- 安装器按稳定脚本路径排序，不能只整理模板而继续沿用当前用户旧顺序。保留标题正文、已有 emoji、快捷键、窗口和额外字段；精确旧鸿蒙默认标题自动迁移，自取标题正文保留。用户同日明确每个标题必须以 emoji 开头，Android Studio 两项补 `🤖`、Trae 两项补 `🧠`、VSCode 两项补 `💻`；其它缺图标动作补 `🔧`。使用 Unicode emoji 属性和键帽序列识别，不能将普通数字当图标或重复添加。额外动作按原相对顺序置底，不新增分类占位动作。
- 用户同日明确排除 `⏬双击下载SourceTree效率脚本` 与 `⚙️运行授权` 的菜单挂载：两者只保留独立脚本，禁止删除或更改脚本业务。安装器按两个精确脚本名同时过滤旧模板与当前动作，即使用户改过显示标题，也不能作为额外动作重新保留；其它自定义动作继续保留。现行模板与真实菜单为 32 项，35 个独立主入口仍保留。
- 真实用户配置与运行 / 备灾模板均已备份后写入，34 项目标、参数和其它字段保持；双位置一致、两份 `zsh -n` 与 plist 校验通过。归类合并 22 项及 emoji 补齐 80 项隔离断言覆盖标题、其它设置和重装幂等。首次 GUI 超时的验收限制已于同日后续核验解除：正常退出并重开 Sourcetree 后，在真实仓库右键菜单核对全部 34 项、6 个新图标、两项地址相邻及连续打包组，未点击业务动作；用户提供的后续截图也确认前轮分类与双包标题已实际显示。
- 后续按上述排除规则将真实菜单与双份模板从 34 项缩减为 32 项，仅删除两个挂载、去掉体检标题末尾点并移动 Flutter 修复项；剩余动作其它字段值保持。独立下载 / 授权脚本在双位置的哈希与执行权限未变，7 个改动文件双份一致；正常重启后已在真实仓库右键菜单核对 32 项、修复归组与体检标题。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
