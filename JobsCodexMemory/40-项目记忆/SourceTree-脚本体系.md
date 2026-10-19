---
type: project-memory
status: active
scope: sourcetree-scripts
runtime: /Users/jobs/SourceTree.command
backup: /Users/jobs/Documents/Github/JobsGenesis/SourceTree.command
created: 2026-07-15
updated: 2026-10-19
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

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> SourceTree 脚本、同名 README 和脚本行为文档的双位置维护边界。

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

## 十一、<span id="readonly-pull">只拉取仓库与安装菜单关联</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-18 明确要求；状态：已确认；创建 / 更新：2026-10-18；适用范围：SourceTree 自定义动作及只能拉取、没有推送权限的本地仓库。
- 独立动作 `【MacOS@SourceTree】⏬只拉取远程代码.command` 通过 Terminal 执行，同步当前仓库明确的远程上游并向下检出各层父仓 gitlink 固定版本，不提交、不推送。发现本地改动时必须红字列出风险，只有精确输入大写 `YES` 才允许舍弃；回车和其它输入均取消，不得以 SourceTree 无交互策略绕过。
- 新增、修改或重命名 SourceTree 动作，必须同时关联 `【MacOS】安装SourceTree自定义菜单.command/` 内安装器的动作登记、`actions.plist` 模板和 README；随后同步运行态、备灾态和当前用户动作配置，保留用户已有标题。此规则已收口到现行 `jobs-macos-shell/SKILL.md` 的 SourceTree 部分，不仅修改当前机器菜单。
- 实现保护边界：先成功 fetch 并固定提交，再允许危险确认；暂存 / 未暂存 / 未跟踪及本地独有提交均检查。忽略内容保留，子仓源码 / 暂存指针、嵌套仓库、未完成操作、目标不明确及路径覆盖风险停止，避免父仓授权扩大到子仓。


- 来源：用户于 2026-10-19 明确选择补齐递归只拉取，并要求 `/Users/jobs/Documents/Github` 全部同名下载入口同步；状态：用户需求已确认、实现经隔离验证；创建 / 更新：2026-10-19。只拉取先预检整棵目标提交树，再同步父仓并逐层按 gitlink 检出，允许纯 HEAD 漂移；不使用 `--remote`，不暂存、不提交、不推送。现有单仓动作对普通子模块指针变化一律停止的旧行为已替代（`superseded`），子仓源码、暂存指针、独有游离提交和未完成现场仍保护。
- 同日实现：8 份 `【MacOS】⏬下载配置当前Git子模块（可向下同步递归）.command` 内嵌相同完整只拉取引擎，回车默认消费固定版本；显式选择维护模式保留各仓原清单、子树选择、深度切换与 `AUTO_PARENT_*` 开关。只拉取不进入 Homebrew / fzf 安装流程，`DRY_RUN=1` 明确停止；旧缓存缺工作树先保护并提示恢复。覆盖 JobsGenesis 根、Python、Gits 包、MacOS 扩展、JobsConfigOS、VScode 包、Codex 配置及 JobsBaseConfig 根；README 同步，SourceTree 运行态 / 备灾态及已安装菜单关联核验。
- 发布边界：父仓锁定的子 SHA 必须在所选托管线路可获取；`not our ref` 由发布电脑补齐对应子仓提交，消费端删除重克隆或提交旧指针不能修复。各子仓追分支最新并自动提交父仓是维护流程，不能用于只拉取电脑消费发布版本。18 组真实 Git / PTY、15 例离线地址矩阵、下载两种入口布局及重复运行通过；本轮没有业务仓提交或推送。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
