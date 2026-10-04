---
type: project-memory
status: active
scope: codex-config
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs
created: 2026-07-15
updated: 2026-10-03
tags:
  - codex-memory
  - project
  - codex-config
---

# Codex 配置标准源

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 维护 Jobs 本机 Codex 全局指导和用户级 Skills 时的双仓权威路径；两类配置分别取各自现行标准源。

## 一、路径映射 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 全局指导标准源：`/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/AGENTS.md`。
- `AGENTS.md` 运行态目标：`/Users/jobs/.codex/AGENTS.md`。
- 用户级 Skills 标准仓库：`https://github.com/JobsKits/JobsSkills`。
- Skills 现行运行目录、内容最大集和基准工作树：`/Users/jobs/.agents/skills`。
- 父仓子模块挂载：`/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs/skills`。

## 二、同步规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 全局指导修改先写 `JobsCodexConfigs/AGENTS.md`，再单向部署到 `/Users/jobs/.codex/AGENTS.md`，部署后检查内容一致。
- Skills 修改直接写 `/Users/jobs/.agents/skills` 现行工作树；不得用父仓子模块、历史备份或其它副本反向覆盖它。
- `JobsCodexConfigs/skills` 是 `JobsSkills` 的子模块挂载，父仓只跟踪 gitlink。用户于 2026-10-03 明确要求每次改完 Codex 公约或 Skills 都完成同步：Skills 以 `/Users/jobs/.agents/skills` 为现行基准，先在 JobsSkills 子仓提交并推送，再更新父仓子模块指针；外援运行态软链接不纳入仓库。
- 全局 `AGENTS.md` 以 `JobsCodexConfigs/AGENTS.md` 为源。若 `/Users/jobs/.codex/AGENTS.md` 含有效独有规则，先合并回标准源，再部署并逐字节比较，避免同步时丢失现行行为。
- 同步前后检查两个仓库状态，保护已有改动；Skills 内容通过正常 Git 提交和 gitlink 传播，不直接复制文件到父仓子模块挂载点。
- 已替代（`superseded`，2026-10-03）：2026-09-30“把运行态未提交内容直接复制到备份子仓，且同步本身不代表授权提交或推送”的临时流程。后续按用户最新确认和 `jobs-codex-config-audit` 中的标准仓库流程提交、推送 JobsSkills，再更新父仓 gitlink。
- 已替代（`superseded`，2026-09-30）：只允许现行工作树先提交推送、备份子模块只更新已提交版本的限制；其方向仍正确，当前仍以现行工作树为基准，但同步频率改为每次配置变更后完成。
- 备份子仓必须处于正常本地分支，不能保留游离 HEAD；本次已在保持提交内容不变的前提下恢复到 `main`。
- 配置注入脚本只部署 `AGENTS.md` 和扫描现行 Skills 生成注册项，不复制、删除或覆盖 `/Users/jobs/.agents/skills`。
- 已替代（`superseded`，2026-09-13）：`JobsCodexConfigs/skills` 作为 Skills 标准源并部署到运行态的旧方向不再使用。

## 三、审计入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 审计 Skill：`/Users/jobs/.agents/skills/jobs-codex-config-audit/SKILL.md`。
- 只读脚本：`/Users/jobs/.agents/skills/jobs-codex-config-audit/scripts/audit_codex_configs.zsh`。
- 脚本以 `/Users/jobs/.agents/skills` 为 Skills 最大集，检查 Jobs 自有文档结构、代码块外的 `1.` 数字列表、固定专有名词链接和完全重复候选，并核对两个仓库、`AGENTS.md` 运行态和父仓子模块指针；不会自动修改、部署或删除文件。
- 每周自动化名称：`Codex 配置每周审计`，每周日凌晨 2 点执行。任何候选合并都必须先建立语义账本，不能以压缩行数为由删除 Jobs 特征、例外或验证。

## 四、外援 Skill 软链接溯源 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-09-13 明确确认。`/Users/jobs/.agents/skills` 中指向外援 `Skill` 的软链接不进入 Git 索引，在该目录的 `.gitignore` 中按完整链接名称精确忽略。
- 软链接的上游仓库、本地检出目录、版本基线和链接映射必须在同目录 `README.md` 中记录，使忽略的运行态链接可溯源、可重建。
- `README.md` 和 `.gitignore` 直接由 `JobsSkills` 现行工作树维护；其中 `.gitignore` 必须提交到 `JobsSkills` 后才会随克隆和子模块检出传播。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
