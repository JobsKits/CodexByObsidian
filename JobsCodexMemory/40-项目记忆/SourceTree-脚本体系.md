---
type: project-memory
status: active
scope: sourcetree-scripts
runtime: /Users/jobs/SourceTree.command
backup: /Users/jobs/Documents/Github/JobsGenesis/SourceTree.command
created: 2026-07-15
updated: 2026-09-30
tags:
  - codex-memory
  - project
  - sourcetree
---

# SourceTree 脚本体系

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> SourceTree 脚本、同名 README 和脚本行为文档的双位置维护边界。

## 一、必须同步的位置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 运行目录：`/Users/jobs/SourceTree.command`。
- 备灾目录：`/Users/jobs/Documents/Github/JobsGenesis/SourceTree.command`。

## 二、验证基线

- 两份对应文件必须内容一致。
- 如果修改 `.command`，必须分别对运行副本与备灾副本执行 `zsh -n`。
- 新增或修改 Sourcetree 脚本时，必须把动作实际写入当前用户 `actions.plist` 并完成重载验证；只生成脚本或 README 不算完成。
- 当前用户 `actions.plist`、运行目录和备灾目录内的菜单配置必须同步，覆盖前生成带时间戳的可恢复备份。
- Codex 负责菜单项除显示标题之外的全部配置。用户可能自行调整显示标题，因此更新已有动作时按目标脚本路径识别并默认保留当前标题，除非用户明确要求改名。
- 详细决策见 [[30-工作流决策/工作流决策#三、SourceTree 双位置同步|SourceTree 双位置同步]]。

## 三、Git Fetch 引用冲突修复

- `【MacOS@SourceTree】📥修复Git无法Fetch.command` 是独立 Sourcetree 动作，与 Commit 修复脚本分开维护。
- 脚本处理远端分支在 `foo` 与 `foo/bar` 之间迁移造成的文件/目录冲突，也处理远端 `SaaS` 与 `saas/...` 在 MacOS 大小写不敏感文件系统上的路径碰撞。
- 安全流程是“先正常 Fetch→仅命中远端跟踪引用冲突才继续→读取远端真实分支→仅提取错误点名的目标分支→备份阻塞 loose ref/reflog→重试 Fetch”。
- 冲突元数据移入目标仓库的 `.git/jobs-ref-conflict-backups`，不直接删除；脚本不修改工作区、索引、本地分支或提交历史。
- 验证基线：使用临时 Git 仓库分别复现 `foo → foo/bar` 和 `foo/bar → foo` 后验证自动修复；大小写碰撞还要确认脚本只处理错误点名的分支。

## 四、Commit / Fetch 场景化解锁

- Commit 修复固定拆成 `C01`–`C07`：工作树与 gitdir 绑定、`index.lock`、`.gitmodules` 暂存顺序、嵌套工作树与路径迁移、子模块与 gitlink、一轮完整索引刷新、索引/dry-run 解锁复验；每个场景必须有独立函数、出现原因和通过日志。
- Fetch 修复固定拆成 `F01`–`F05`：原生 `fetch --prune`、`remote prune`、MacOS 大小写路径碰撞、前缀文件挡目录、同名目录挡文件；每产生一项实际修复就立即重新 Fetch，成功后停止后续元数据处理。
- Fetch 大小写碰撞不能只搬移 loose ref；应先用 Git 原生 `pack-refs` 保留有效引用并释放大小写前缀文件路径，再备份冲突 reflog 后复试。
- 两份同名 README 必须专门维护“故障现象、出现原因、独立处理、解锁判据、不处理边界”，并与脚本场景编号一一对应；JobsDocs Git 故障手册继续保留跨主题知识地图，但与单个脚本直接相关的原理、错误分流、诊断命令、手工边界和执行后核对必须完整下沉到同名 README，不能只在 JobsDocs 保留或只放链接。

## 五、Magic Resume 后台运行

- 来源：用户于 2026-09-06 明确确认；适用脚本为 `【MacOS@SourceTree】🪄配置并运行Magic Resume.command`。
- 当前仓库任意 remote 指向 `JOYCEQL/magic-resume` 时直接使用当前仓库；不匹配时先扫描父目录第一层的全部同级文件夹，目录名不限，候选自身必须是 Git 根目录且任意 remote 指向官方仓库。只有全部同级目录都未命中时，才新建 / 复用完全空的同级目录后克隆，禁止覆盖非空冲突目录。
- 按官方快速开始执行 `pnpm install` 与 `pnpm dev`，服务就绪后打开 `http://localhost:3000`；不自动执行 `git pull`、依赖升级、构建或部署。
- 开发服务器必须使用 `nohup`、断开标准输入并脱离 zsh 作业控制在后台运行，保证关闭终端或 Sourcetree 输出窗口后服务继续可用，同时记录服务日志和实际监听 PID。
- 3000 端口只复用脚本 PID 文件已记录的当前仓库后台 Vite；当前仓库未托管的 Vite dev 只发送普通 `TERM` 后转为后台运行，不强制结束；其它目录或无法确认为 Vite dev 的监听进程一律不处理并报错退出。

## 六、Sourcetree 菜单挂载完成定义

- 来源：用户于 2026-09-13 明确确认；适用于今后所有 Sourcetree 脚本的新建、修改和重命名。
- 每次交付必须完成运行副本、备灾副本、两边菜单配置和当前用户 Sourcetree 动作配置的同步，并验证菜单动作能够解析到可执行脚本。
- 用户侧最多只调整 Sourcetree 菜单显示标题；动作路径、`$REPO` 参数、动作类型、输出策略、执行权限、安装与备份由 Codex 完成。
- 更新已有动作时，默认保留用户在 Sourcetree 中修改过的显示标题。修改 `actions.plist` 前生成可恢复备份，重载后反查动作唯一性与配置字段。

## 七、逐层空白提交推送的递归范围

- 来源：用户于 2026-09-30 明确确认；适用于 `【MacOS@SourceTree】🚀逐层空白提交并Push.command`。
- 从 `JobsGenesis` 等大仓运行时，必须先递归处理其管理的子仓，例如 `SourceTree.command`；子仓完成 commit + push 后，父仓再提交并推送更新后的 gitlink。仅向上查找父仓不满足需求。
- 从小仓运行时，处理该子树后继续向上处理父仓，不扩展上层兄弟仓。无改动不创建空提交，仍可推送已有提交；任一失败停止后续队列。
- 来源：用户于 2026-09-30 确认落盘游离态自动恢复流程。仅对游离仓舍弃独有提交、未提交改动及非忽略的未跟踪文件；先明确目标分支并成功 fetch，再恢复远端最新版本，正常分支内容保留。忽略文件、未跟踪嵌套 Git 仓库及已有正常分支独有提交不自动删除。终端清理需 YES，Sourcetree 按已声明策略无交互执行。
- 已替代（`superseded`）：逐层推送脚本遇到任何游离 HEAD 一律停止的旧行为；目标不明确、fetch 失败、冲突或未完成操作仍停止。

- 来源：用户确认远端存在本地没有的提交时必须先拉取，最终同步结果要求本地与远端一致。正常分支采用 fetch、提交本地改动、快进或合并远端、push、远端提交号核验；保留双方历史，不强推，合并冲突停止并保留现场。该规则替代此前正常分支不获取远端、直接 push 的行为。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
