---
type: project-memory
status: active
scope: codex-config
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs
created: 2026-07-15
updated: 2026-09-13
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

## 二、同步规则

- 全局指导修改先写 `JobsCodexConfigs/AGENTS.md`，再单向部署到 `/Users/jobs/.codex/AGENTS.md`，部署后检查内容一致。
- Skills 修改直接写 `/Users/jobs/.agents/skills` 现行工作树；不得用父仓子模块、历史备份或其它副本反向覆盖它。
- `JobsCodexConfigs/skills` 只记录 `JobsSkills` 子模块版本。先在现行工作树提交并推送，再更新父仓 gitlink；父仓不直接维护第二份 Skills 内容。
- 配置注入脚本只部署 `AGENTS.md` 和扫描现行 Skills 生成注册项，不复制、删除或覆盖 `/Users/jobs/.agents/skills`。
- 已替代（`superseded`，2026-09-13）：`JobsCodexConfigs/skills` 作为 Skills 标准源并部署到运行态的旧方向不再使用。

## 三、审计入口

- 审计 Skill：`/Users/jobs/.agents/skills/jobs-codex-config-audit/SKILL.md`。
- 只读脚本：`/Users/jobs/.agents/skills/jobs-codex-config-audit/scripts/audit_codex_configs.zsh`。
- 脚本以 `/Users/jobs/.agents/skills` 为 Skills 最大集，检查 Jobs 自有文档结构、代码块外的 `1.` 数字列表、固定专有名词链接和完全重复候选，并核对两个仓库、`AGENTS.md` 运行态和父仓子模块指针；不会自动修改、部署或删除文件。
- 每周自动化名称：`Codex 配置每周审计`，每周日凌晨 2 点执行。任何候选合并都必须先建立语义账本，不能以压缩行数为由删除 Jobs 特征、例外或验证。

## 四、外援 Skill 软链接溯源

- 来源：用户于 2026-09-13 明确确认。`/Users/jobs/.agents/skills` 中指向外援 `Skill` 的软链接不进入 Git 索引，在该目录的 `.gitignore` 中按完整链接名称精确忽略。
- 软链接的上游仓库、本地检出目录、版本基线和链接映射必须在同目录 `README.md` 中记录，使忽略的运行态链接可溯源、可重建。
- `README.md` 和 `.gitignore` 直接由 `JobsSkills` 现行工作树维护；其中 `.gitignore` 必须提交到 `JobsSkills` 后才会随克隆和子模块检出传播。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
