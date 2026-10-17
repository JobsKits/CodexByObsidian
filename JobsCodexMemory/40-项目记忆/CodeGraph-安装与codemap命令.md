---
type: project-memory
status: active
scope: codegraph-codemap
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS
source: 2026-10-17 用户明确要求三处集成，并确认全依赖链健康体检
created: 2026-10-17
updated: 2026-10-17
tags:
  - codex-memory
  - project
  - shell
  - codegraph
---

# CodeGraph 安装与 codemap 命令

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 记录代码地图安装、系统初始化与终端命令的跨仓库归属；通用依赖体检规则继续归 `jobs-macos-shell`，不在此重复维护一套规则。

## 一、三处集成归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 职责 | 已确认位置 |
| --- | --- |
| 独立安装器 | `/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS/配置相关/【MacOS】⚙️安装代码地图CodeGraph.command/【MacOS】⚙️安装代码地图CodeGraph.command` |
| 新系统入口 | `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/【MacOS】🆕新系统配置.command/【MacOS】🆕新系统配置.command` |
| 命令源码 | `/Users/jobs/Documents/Github/JobsGenesis/JobsConfigOS/🌍JobsMacEnvVarConfigs/scripts/codemap.command/codemap.command` |
| 命令运行副本 | 当前用户 `.JobsMacEnv/Scripts/codemap.command`，并注册 `.local/bin/codemap` 及现行 entrypoints 函数 |

新系统脚本已由根目录文件迁入同完整名称目录，同目录有 README。系统入口以自身位置定位相邻 `JobsCommand@iOS` 安装器，路径不依赖终端当前目录。CLI 安装与给业务项目建立地图分开。

## 二、命令与健康检查边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户明确要求 `codemap` 对当前目录建图，`codemap 地址` 对手工输入或拖入的地址建图；支持含空格、中文与多目录。既有地图重建，首次初始化；不以目录存在或退出码为唯一成功证据。
- [**CodeGraph**](https://github.com/colbymchenry/codegraph) 的官方 npm 包为 `@colbymchenry/codegraph`。安装器体检基础工具 → [**Homebrew**](https://brew.sh/) → [**Node.js**](https://nodejs.org) / [**npm**](https://docs.npmjs.com/) → CodeGraph，并以临时样例真实建图复检。
- 用户于 2026-10-17 再次确认“所有第三方依赖都做健康体检，至少 Brew、Node/npm”；`jobs-macos-shell/SKILL.md` 的 1.7.1 已明确完整依赖链、实际可用性、修复后复检及失败停止，故本任务没有重复修改全局 AGENTS 或 Skill。
- 现行安装器复用健康 Node/npm；缺失时通过 Brew 管理 node@24；更新或新装 CLI 使用用户独立 npm 前缀，保留原全局安装。健康检查不隐式下载平台包，建图调用关闭遥测。
- codemap 只使用现有健康 CLI，不隐式安装；产物固定在目标 `.codegraph`，核对官方 JSON 的项目路径、输出路径、索引时间及完整状态。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

