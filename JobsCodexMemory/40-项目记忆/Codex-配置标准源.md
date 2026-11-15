---
type: project-memory
status: active
scope: codex-config
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs
created: 2026-07-15
updated: 2026-11-14
tags:
  - codex-memory
  - project
  - codex-config
---

# Codex 配置标准源

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、路径映射](#jobs-toc-heading-2)
- [二、同步规则](#skills-runtime-backup-sync)
- [三、审计入口](#jobs-toc-heading-4)
- [四、外援 Skill 软链接溯源](#jobs-toc-heading-5)
- [五、永久记忆与自动任务备份](#jobs-toc-heading-6)
- [六、用户级 Skills 手动双向同步](#jobs-toc-heading-7)
- [七、前端设计 Skills 安装与范围](#frontend-design-skills-install)
- [八、外源 Skills 现用清单](#external-skills-current-inventory)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 维护 Jobs 本机 Codex 全局指导和用户级 Skills 时的双仓权威路径；两类配置分别取各自现行标准源。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、路径映射 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 全局指导标准源：`/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/AGENTS.md`。
- `AGENTS.md` 运行态目标：`/Users/jobs/.codex/AGENTS.md`。
- 用户级 Skills 标准仓库：`https://github.com/JobsKits/JobsSkills`。
- Skills 运行态、内容最大集和基准工作树：`/Users/jobs/.agents/skills`。
- Skills 备份态，同时是父仓子模块挂载：`/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/skills`。

## 二、<span id="skills-runtime-backup-sync">同步规则</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-21 明确要求；状态：已确认；适用范围：Jobs 自有 Skills；创建 / 更新：2026-10-21。绑定具体仓库或固定文件路径的专项内容，从原 `SKILL.md` 提取为同一 Skill 文件夹内、与 `SKILL.md` 同级的独立附件；主文件保留相对链接及命中范围下的必读入口，保留完整约束和验证，不另建 Skill、不机械拆通用目录或示例。长期维护规则归 `jobs-codex-config-audit`，README 的 `OS@Extension` 裸露安装 / 卸载入口规则归 `jobs-markdown-docs/README规范-OS@Extension脚本布局.md`。
- 全局指导新增或修改先写 `JobsCodexConfigs/AGENTS.md`，再在同一任务结束前单向部署到 `/Users/jobs/.codex/AGENTS.md`，用 `cmp` 验证逐字节一致，不等待下次启动注入脚本或用户提醒。来源：用户于 2026-10-12 再次明确确认；状态：已确认；更新时间：2026-10-12。此次本地 AGENTS 同步确认不扩展为 Git 提交、推送、Skills 文件复制或 gitlink 更新授权。
- <span id="skills-backup-git-pull"><span id="skills-backup-on-request">Skills 备份态仅部署与拉取</span></span>：来源：用户于 2026-11-13 明确要求运行态“不用每次都同步到备份态”，随后补充“以后也别改备份态。备份态只有在第一次使用的时候进行环境部署，以后都是拉取”；状态：confirmed；适用范围：本机用户级 Skills；创建 / 更新：2026-11-13。日常新增、修改或删除只维护运行态 `/Users/jobs/.agents/skills`；不直接编辑备份态 `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/skills`，不把运行态内容复制过去。备份态只在首次使用时进行环境部署，此后通过 Git 拉取更新；日常修改和审计均不自动拉取。全局 `AGENTS.md` 的同任务部署与 `cmp` 核验继续保留。
- 已替代（`superseded`，2026-11-13）：用户于 2026-11-03 确认的“只要写了运行态，都要立即同步备份态”及免重复确认的常驻同步授权；原适用范围为本机用户级 Skills 本地同步，创建于 2026-11-03，现执行[[#skills-backup-git-pull|备份态部署与拉取规则]]。
- 已替代（`superseded`，2026-11-13 同日补充）：本轮曾拟定“用户明确要求备份 / 同步或主动运行人工入口时，按范围复制运行态到备份态”；用户后续明确禁止编辑备份态，该按需复制方案不再执行，改按[[#skills-backup-git-pull|备份态部署与拉取规则]]维护。
- 获准进行备份态首次部署或后续 Git 拉取前，检查备份工作区并保护已有改动；目标存在独有修改、冲突或无法安全继续时保留现场并报告，不用复制运行态、反向覆盖、强制重置或清理目标独有文件消除差异。外援软链接不写穿上游，沿用既有所有权和 Git 排除边界。
- 首次部署或 Git 拉取后核对该操作的结果、备份工作区和版本状态；不要求备份文件与未发布的运行态逐字节一致。Git 提交、推送和父仓 gitlink 更新仍需明确授权；获准版本发布时，先发布现行 `JobsSkills`，再按授权范围更新父仓指针。
- Skills 现行基准仍为运行态，不得自动用父仓子模块、历史备份或其它副本反向覆盖它。2026-10-06 的独立脚本人工双向复制授权已被 2026-11-13 最新决定替代，脚本存在及旧能力仅作历史记录，见第六节。
- 来源：用户于 2026-10-19 明确要求；状态：已确认；适用范围：`jobs-markdown-docs` 的 README 项目统计规范；创建 / 更新：2026-10-19。`README规范-项目统计条款.md` 与现行 `/Users/jobs/.agents/skills/jobs-markdown-docs/SKILL.md` 保留在同一目录，通过主文件的相对链接按需加载，不合二为一、不用旧版主文件覆盖现行规则；项目 README 编写 / 维护及项目统计任务先读取条款全文。
- 来源：用户于 2026-10-19 明确要求将配置仓库 `.jobs-markdown-toc/` 融入运行态文档 Skill；状态：已确认；适用范围：目录过滤器的复用资源；创建 / 更新：2026-10-19。完整模板统一放在 `/Users/jobs/.agents/skills/jobs-markdown-docs/assets/markdown-toc/`，由主规范链接独立的 `MarkdownToc.mjs`、`README.md` 与 `manifest.json`；模板清单只登记随包工具 README，其它路径按目标仓库核实、增量维护，保留既有清单，不照搬配置仓库专用名单。
- `JobsCodexConfigs/skills` 仍是 `JobsSkills` 的子模块挂载，父仓只跟踪 gitlink，不转为父仓直接跟踪文件；该备份工作区不直接编辑，也不复制运行态内容过去，仅首次环境部署和后续 Git 拉取更新；外援运行态软链接不纳入仓库。
- 已部分替代（`superseded`，2026-11-03；同步频率再次更新于 2026-11-13）：2026-10-03“每次改完必须先提交推送 JobsSkills，再更新父仓指针才算同步”的要求，曾改为即时文件同步，现执行[[#skills-backup-git-pull|备份态部署与拉取规则]]。标准仓库、运行态基准和获准发布时先子后父的顺序保留；本地备份不自动提交推送。
- 全局 `AGENTS.md` 以 `JobsCodexConfigs/AGENTS.md` 为源。若 `/Users/jobs/.codex/AGENTS.md` 含有效独有规则，先合并回标准源，再部署并逐字节比较，避免同步时丢失现行行为。
- 备份态部署 / 拉取与现行工作树的 Git 版本发布分别核验；这项备份更新方式不授权提交、推送或改动父仓 gitlink，也不自动触发任何拉取。
- 历史替代记录（`superseded`）：2026-09-30“运行态未提交内容直接复制到备份子仓，同步不授权提交推送”的临时流程曾于 2026-10-03 被“先提交推送、再更新 gitlink”替代；后者又于 2026-11-03 被即时本地备份规则替代；该即时同步要求于 2026-11-13 再被[[#skills-backup-git-pull|备份态部署与拉取规则]]替代。
- 已替代（`superseded`，2026-09-30）：只允许现行工作树先提交推送、备份子模块只更新已提交版本的限制；其运行态基准方向保留；曾改为每次配置变更后同步，现行备份更新方式按[[#skills-backup-git-pull|首次部署、后续 Git 拉取]]执行，不直接复制运行态内容。
- 备份子仓必须处于正常本地分支，不能保留游离 HEAD；本次已在保持提交内容不变的前提下恢复到 `main`。
- 配置注入脚本只部署 `AGENTS.md` 和扫描现行 Skills 生成注册项，不复制、删除或覆盖 `/Users/jobs/.agents/skills`。
- 已替代（`superseded`，2026-09-13）：`JobsCodexConfigs/skills` 作为 Skills 标准源并部署到运行态的旧方向不再使用。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、审计入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 审计 Skill：`/Users/jobs/.agents/skills/jobs-codex-config-audit/SKILL.md`。
- 只读脚本：`/Users/jobs/.agents/skills/jobs-codex-config-audit/scripts/audit_codex_configs.zsh`。
- 脚本以 `/Users/jobs/.agents/skills` 为 Skills 最大集，检查 Jobs 自有文档结构、代码块外的 `1.` 数字列表、固定专有名词链接和完全重复候选，并核对两个仓库、`AGENTS.md` 运行态和父仓子模块指针；不会自动修改、部署或删除文件。
- 每周自动化名称：`Codex 配置每周审计`，每周日凌晨 2 点执行。任何候选合并都必须先建立语义账本，不能以压缩行数为由删除 Jobs 特征、例外或验证。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、外援 Skill 软链接溯源 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-09-13 明确确认。`/Users/jobs/.agents/skills` 中指向外援 `Skill` 的软链接不进入 Git 索引，在该目录的 `.gitignore` 中按完整链接名称精确忽略。
- 软链接的上游仓库、本地检出目录、版本基线和链接映射必须在同目录 `README.md` 中记录，使忽略的运行态链接可溯源、可重建。
- `README.md` 和 `.gitignore` 直接由 `JobsSkills` 现行工作树维护；其中 `.gitignore` 必须提交到 `JobsSkills` 后才会随克隆和子模块检出传播。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、永久记忆与自动任务备份 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-04 在任务 `01a104bf-fb16-7f02-9185-4261501ba4fe` 明确要求；状态：已确认；适用范围：Obsidian 永久记忆及自动任务备份 / 恢复；创建 / 更新：2026-10-05。
- 记忆仓库根目录 `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/📒CodexByObsidian` 下的 `同步Obsidian记忆.command` 将本机记忆同步到相邻 `JobsCodexMemory`，项目内目标按脚本位置计算；源与目标相同时无需复制，不删除目标独有内容。
- 同目录 `Obsidian自动任务备份/同步Obsidian自动任务.command` 提供两个同步方向：本机自动任务同步至备份，或备份恢复至本机。恢复遇到不同的本机文件时，由操作者逐项选择保留本机或覆盖；覆盖前保存快照。自动任务运行态目录由用户环境动态解析，不硬编码本机路径。
- 永久记忆 Vault 与自动任务配置备份是不同数据域；只在用户明确运行对应脚本时同步，不把整个 Vault 复制进 Skills 或运行态配置目录。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、用户级 Skills 手动双向同步 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 历史来源：用户于 2026-10-06 明确要求；原范围：`JobsCodexConfigs/skills` 与系统用户级 Skills 的人工选择同步；创建：2026-10-06；更新：2026-11-13；状态：`superseded`。旧人工双向复制入口对该备份目录的授权已被[[#skills-backup-git-pull|备份态部署与拉取规则]]替代，不再作为现行备份更新方式。
- 历史脚本仍位于 `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/skills/同步Skills.command`；曾支持系统 `/Users/jobs/.agents/skills` → 当前目录，以及当前目录 → 系统两个方向，项目路径从自身位置计算、系统路径动态解析。保留脚本存在事实不表示继续授权复制。
- 历史交互能力：`fzf` 多选 Skill，第一项和默认光标为“全部同步”，直接回车选择全量，也可搜索并多选特定 Skill；这些能力不构成现行备份操作指引。
- 历史保护能力：选择方向和范围、预览确认后复制，覆盖前备份目标、保留目标独有文件，排除根 Git 元数据、内置 Skills、插件缓存和脚本自身；外援软链接实体化且不写穿上游。当前不据此启动旧复制入口或修改备份态。
- 2026-11-03 的常驻即时同步授权与 2026-11-13 本轮先拟定的按需复制方案均已 `superseded`；当前仅执行[[#skills-backup-git-pull|备份态部署与拉取规则]]。
- 历史替代记录（`superseded`，2026-10-06；2026-11-13 再次更新）：旧“禁止父仓子模块反向覆盖系统”的限制曾允许人工选择复制；该旧入口对备份目录的复制授权现已撤销。运行态基准、配置注入单向边界、代码所有权和获准版本发布流程继续适用。

## 七、<span id="frontend-design-skills-install">前端设计 Skills 安装与范围</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-12 明确补充“前端”同时包含 Web 和移动端，并要求将本轮推荐的四项全部安装；需求状态 `confirmed`，安装与限定功能验证状态 `verified`；创建／更新：2026-11-12。沿用既有 App／移动 Web／桌面 Web 分开推导的约束，不将响应式网页等同原生 App。
- 已安装 [**UI UX Pro Max**](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)、[**Impeccable**](https://github.com/pbakaus/impeccable)、[**Anthropic frontend-design**](https://github.com/anthropics/skills/tree/main/skills/frontend-design)、[**Vercel web-design-guidelines**](https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines)，目录名分别为 `ui-ux-pro-max`、`impeccable`、`frontend-design`、`web-design-guidelines`，均位于 `/Users/jobs/.agents/skills`。固定提交、来源、内容摘要与恢复说明见该目录 `frontend-skills.lock.json` 和 `README.md` 第七节；完整实体目录按相同相对路径即时备份到配置父仓的 `skills` 挂载，144 个文件的内容及模式核对一致。
- 四项是上游所有的外部实体安装，根 `.gitignore` 按四个精确目录排除源码，来源说明和锁定清单保留；未改上游规则内容，UI UX Pro Max 入口由同提交的官方 Codex 全局模板生成，避免依赖 Claude 环境变量。没有安装其额外六个兄弟 Skill，既有 Jobs Skills 与原有改动保留。
- UI UX Pro Max 的四个移动技术栈检索与设计系统生成已运行；UIKit／Objective-C 未列为专项技术栈，通用视觉指导与既有 Jobs 语言 Skill 配合。Impeccable 当前安装版 `4.8.2` 包含原生 iOS／Android 评审和适配资料，随包提供 arm64 引擎 `0.1.22`，从官方 npm 平台包取得并同时核对 npm integrity 与上游引擎 SHA256，启动器握手通过；未启用 hooks 或 live。
- 本机 Codex app-server 的 `skills/list` 强制重扫已识别四项且均 `enabled=true`、无本轮 Skill 错误；51 份 Markdown 的 104 条相对链接核对通过。`quick_validate.py` 因现有 Python 缺 PyYAML 未能运行，已改用现有 Ruby 解析校验 YAML，并以实际 Codex 发现结果验证元数据；未为校验额外安装 Python 依赖。这些是安装和运行验证，尚未进行同题页面美观效果对比。
- 现有配置全量审计脚本固定查询 `origin`，当前 Skills 工作树实际远端名为 `GitHub` 且地址确为 `JobsKits/JobsSkills`，因此原脚本在源检查阶段停止；本轮未改远端或审计脚本。运行态 HEAD `615b49c8a56ba6ec7a54818916de7ea68cef6f0d`、备份 HEAD `bcc38b69c2ec91571992d1a22ed231878452da33` 保持原值，本轮文件已同步，不以提交号相同代替内容检查；未提交、推送或更新父仓 gitlink。

## 八、<span id="external-skills-current-inventory">外源 Skills 现用清单</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-14 明确要求“我装的外源性 Skills，都要写入公约文件”，并补充以后都按当前最新保留项维护，考虑到使用后可能弃用；状态：`confirmed`；适用范围：所有第三方实体、外援软链接和插件分发 Skills；创建／更新：2026-11-14。
- 全局公约 `JobsCodexConfigs/AGENTS.md` 的现用清单是换机查询入口，登记名称、用途、来源、版本依据和恢复方式；安装、更新、替换、停用、卸载或明确弃用时在同一任务内更新。弃用／卸载／被替代项移出现用清单，安装但停用的明确标注；不累积历史安装记录，不以缓存残留或本轮未注入推断当前状态。
- 当前清单区分随 JobsSkills 恢复、独立重装、独立仓软链接和插件恢复；未知上游明确待核，不编造下载地址。更新后继续标准源单向部署运行态并 `cmp`；本项不授权安装／卸载、提交／推送或编辑 Skills 备份态。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
