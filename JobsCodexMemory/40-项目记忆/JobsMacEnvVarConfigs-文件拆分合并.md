---
type: project-memory
status: active
scope: JobsMacEnvVarConfigs-file-parts
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs
source: 2026-11-13 用户要求以 WindowsOS_11 的 split.command 和 merge.command 为蓝本补齐功能
created: 2026-11-13
updated: 2026-11-13
tags:
  - codex-memory
  - project
  - scripts
---

# JobsMacEnvVarConfigs 文件拆分与合并

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、手动目标与持续校验](#manual-target-validation)
- [二、源码与短命令](#entrypoints)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> 保存用户已确认的输入校验边界和本仓入口映射，避免后续恢复隐式默认目录。

## 一、<span id="manual-target-validation">手动目标与持续校验</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-13 明确要求“具体操作都是要手动输入 / 拖入正确的目标目录”，不合法就持续询问，拆分需有具体文件、合并需有多个文件；需求状态：confirmed；适用范围：本仓拆分 / 合并工具。
- 每次启动后手动输入或拖入目标，不以空输入扫描脚本目录或当前目录。空白、无效位置及无可处理内容持续重问；Ctrl+C、关闭终端或 EOF 终止，不在 EOF 空转。
- 拆分接受单个普通文件，或仅扫描所选目录第一层；合并按蓝本的 `原文件名@序号of总数` 分组，至少两卷且完整、编号唯一、总数一致。两个无关普通文件不视为可还原分卷。

## 二、<span id="entrypoints">源码与短命令</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 源码包：`scripts/【MacOS】split.command/【MacOS】split.command`、`scripts/【MacOS】merge.command/【MacOS】merge.command`，各自有同级 README，可独立复制使用。
- 短命令：`jsplit` / `jmerge`，由 `scripts/entrypoints.command`、`scripts/list.command` 和仓根 `install.command` 注册，避免覆盖系统 `split`。
- 默认保留原文件和分卷，已有输出不覆盖；最终执行菜单默认取消，精确 `YES` 才进入删除复检。源码完成与实际环境部署分别报告，不为脚本交付自动运行环境同步、提交或推送。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
