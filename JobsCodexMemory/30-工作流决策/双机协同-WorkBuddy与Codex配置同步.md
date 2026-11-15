---
type: workflow-decision
status: active
scope: cross-host-config-sync
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS
source: 2026-10-19 用户明确要求“每次更新 WorkBuddy 相关 Skills，同时更新 Codex 配置资料”
created: 2026-10-19
updated: 2026-11-13
tags:
  - codex-memory
  - workflow
  - skills
  - workbuddy
  - codex
---

# 双机协同：WorkBuddy 与 Codex 配置同步

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、设备分工与唯一源头](#jobs-toc-heading-2)
- [二、同步方向：WorkBuddy → 仓库单向转译](#jobs-toc-heading-3)
- [三、固定动作门禁](#jobs-toc-heading-4)
- [四、工具与不回流清单](#jobs-toc-heading-5)
- [五、当前基线](#jobs-toc-heading-6)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 记录两台 Mac 之间共用一套 Codex / WorkBuddy 配置的边界与同步方向。目的是让同一份规范在两台机器上语义一致，同时避免把宿主编译产物当成规范源码。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、设备分工与唯一源头 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 来源：用户于 2026-10-19 明确说明设备分工；状态：已确认；适用范围：全部用户级 Skills 与全局工作规约。
- 备份更新边界：来源为用户 2026-11-13 最新明确要求；状态 `confirmed`；创建 / 更新：2026-11-13。Codex 本机专项规则只维护 `$HOME/.agents/skills`；不直接编辑 `💻JobsCodexConfigs/skills`，不复制运行态内容过去。备份态只在首次使用时用于环境部署，后续配置更新通过 Git 拉取；日常修改 / 审计不自动拉取，详见[[40-项目记忆/Codex-配置标准源#skills-backup-git-pull|Skills 备份态部署与拉取规则]]。
- 私人电脑使用 Codex，是规范原文的写作视角；工作电脑（`/Users/wx996768`）不能安装、也不能使用 Codex，日常只有 WorkBuddy。
- 唯一仓库：`/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/💻JobsCodexConfigs`（工作机实际路径为 `/Users/wx996768/Documents/Gitee/...`）。仓库只存 **Codex 侧**两件套——`AGENTS.md` 与 `skills/` 子模块；路径写 `/Users/jobs/...`、宿主称 Codex、记忆目录写 `~/.codex/memories`。
- `💻JobsCodexConfigs/skills` 本身仍是 Git 子模块（目录内含 `.git` 文件），父仓只跟踪 gitlink；旧“修改后需在该子模块提交，再更新父仓”的逐次维护要求已于 2026-11-13 `superseded`。备份态执行[[40-项目记忆/Codex-配置标准源#skills-backup-git-pull|Skills 备份态部署与拉取规则]]；Git 提交、推送与父仓指针更新仍需明确授权。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、同步方向：WorkBuddy → 仓库单向转译 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 主路径是 **WorkBuddy 优先、Codex 由 AI 补齐**：工作机上灵感与习惯先落 WorkBuddy，用户明确不做第二次手工维护，AI 在同一次任务补齐 Codex 语义版本；Codex 本机专项规则落到运行态 `$HOME/.agents/skills/<name>/`，长期全局行为写进标准源 `AGENTS.md`，不直接补写备份子模块。
- 仓库只存 Codex 侧内容，不存 WorkBuddy 镜像：`workbuddy/AGENTS.workbuddy.md` 于 2026-10-19 按用户要求删除并确认无引用，仓库因此回到「`AGENTS.md` + `skills/` 子模块」两件套。
- 因为不再有镜像，也就不存在「仓库 → WorkBuddy 渲染」这条路径。`【MacOS】同步Codex配置到WorkBuddy.command` 仅保留 `--skills-only` 的部署能力，`--global-only` 与全局技能渲染随镜像一并停用。
- 反向同步必须做语义改写而不是整目录拷贝：把 WorkBuddy 副本原样倒进仓库，会把 `/Users/wx996768`、`~/Documents/Gitee`、`~/.workbuddy` 和 WorkBuddy 专有入口（`jobs-workbuddy-global`、`.jobs-workbuddy-managed.json`）写成规范原文，污染私人机视角。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、固定动作门禁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 触发条件：任何写入 WorkBuddy 相关习惯的动作——新建 / 修改 / 删除 `~/.workbuddy/skills/<name>/`、往个人 `MEMORY.md` 写长期规则、改动 WorkBuddy 侧工作流约定。
- 同轮动作：专项规则语义转译为 Codex 版，在 Codex 本机维护运行态 `$HOME/.agents/skills/<name>/SKILL.md`；长期全局行为写进 `AGENTS.md` 并按全局约定部署，不再维护任何 WorkBuddy 镜像副本。旧“同轮直接写进 `💻JobsCodexConfigs/skills/<name>/SKILL.md`”要求已于 2026-11-13 `superseded`，执行[[40-项目记忆/Codex-配置标准源#skills-backup-git-pull|Skills 备份态部署与拉取规则]]。
- 改写映射：`/Users/wx996768` → `/Users/jobs`；`~/Documents/Gitee` → `~/Documents/Github`；WorkBuddy → Codex；`~/.workbuddy/skills` → `$HOME/.agents/skills`；`~/.workbuddy/memory` → `~/.codex/memories`；WorkBuddy 专有脚本与生成物改写成 Codex 侧等价描述或删除。
- 落地口径：WorkBuddy 侧副本允许在工作机维护，同一次任务仍须补出 Codex 语义版本；Codex 本机专项内容以运行态工作树为维护落点，备份子模块不作为直接编辑目标。配置仓库仍只存 Codex 侧 `AGENTS.md` 与 `skills/`，不恢复 WorkBuddy 镜像目录。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、工具与不回流清单 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `【MacOS】同步Codex配置到WorkBuddy.command`：镜像删除后只有 `--skills-only` 可用（仓库 `skills/` → 本机 `~/.workbuddy/skills`）；`--global-only` 会因缺 `workbuddy/AGENTS.workbuddy.md` 失败，不要调用。
- 历史入口 `💻JobsCodexConfigs/skills/同步Skills.command` 曾提供 fzf 多选、双向同步、先备份、拒绝写穿上游，以及同名覆盖、目标独有保留和链接实体化；保留脚本真实能力记录。旧人工复制入口对该备份目录的授权已于 2026-11-13 `superseded`，不再作为现行备份更新方式。
- 历史参数说明：该脚本默认系统目录为 `${HOME}/.agents/skills`，工作机没有该目录；原来可用 `JOBS_SKILLS_SYNC_SYSTEM_DIR="$HOME/.workbuddy/skills"` 指定 WorkBuddy 侧。该参数事实不恢复旧复制授权，当前不据此写入备份态。
- 不回流清单：`*__skillhub`（第三方市场安装）与 `jobs-workbuddy-global`（早期镜像渲染生成的本机文件）不属于仓库源，不得写进仓库。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、当前基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 2026-10-19 核对：仓库 `skills/` 共 18 项（16 个 Skill + `README.md` + `同步Skills.command`）；工作机 `~/.workbuddy/skills` 共 21 项。
- 16 个同名 Skill 在排除标记文件后内容一致，剩余差异全部来自宿主渲染（`/Users/jobs` → `/Users/wx996768`、Codex → WorkBuddy、`~/Documents/Github` → `~/Documents/Gitee`）。
- 工作机 `~/.codex/skills` 存在但为空，`codex` 命令不存在，可作为“本机不跑 Codex”的快速判据。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
