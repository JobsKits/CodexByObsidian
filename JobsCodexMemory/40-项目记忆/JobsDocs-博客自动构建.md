---
type: project-memory
status: active
confirmation: confirmed
scope: JobsDocs 博客自动构建与产物回写
repository: /Users/jobs/Documents/Github/JobsDocs
source: 2026-10-08 当前会话用户明确要求“始终要自动构建”；现有工作流文件核验
created: 2026-10-08
updated: 2026-10-08
tags:
  - codex-memory
  - project
  - jobsdocs
---

# JobsDocs 博客自动构建

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 记录 JobsDocs 博客必须持续自动构建的项目约束，以及构建产物回写主分支后的同步要求。

## 一、项目边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 仓库路径：`/Users/jobs/Documents/Github/JobsDocs`；远端为 [**GitHub**](https://github.com) 的 `JobsKits/JobsDocs`。
- 适用范围：`.github/workflows/deploy-blog.yml` 与 `blog/` 的自动生成和产物回写；不外推到 iOS、IM 或其它项目的构建策略。

## 二、已确认约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户原话：“始终要自动构建”；确认状态：`confirmed`；确认日期：2026-10-08。
- 始终保留 `push main` 自动触发博客生成及构建产物回写 `main` 的能力；不能通过关闭工作流、取消回写或跳过构建来解决 `non-fast-forward` 推送拒绝。
- 2026-10-08 核验现有工作流：推送 `main` 后运行 `blog/install.command --ci`，`blog/` 产物有变化时由机器人提交，并执行 `git push origin HEAD:main`。远端因此可能先于本地出现新的产物提交。

## 三、同步与核验 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 后续授权推送前先 `fetch` 并检查工作区和双方历史；分叉时整合本地业务提交与远端构建提交，保留双方历史，再正常推送，不用强推覆盖构建提交。
- 推送后等待对应自动构建完成，核验构建结果，再获取并整合产物回写，确认本地 `main` 与 `origin/main` 同步。构建或回写失败时继续排查实际失败原因，不能用跳过构建作为成功判据。
- 本笔记保存长期项目约束和工作流事实，不保存一次性提交号、运行日志或构建结果；不扩大未授权提交、推送的权限。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
