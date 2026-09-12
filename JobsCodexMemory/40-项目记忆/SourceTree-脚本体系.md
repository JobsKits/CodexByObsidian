---
type: project-memory
status: active
scope: sourcetree-scripts
runtime: /Users/jobs/SourceTree.command
backup: /Users/jobs/Documents/Github/JobsGenesis/SourceTree.command
created: 2026-07-15
updated: 2026-09-06
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
