---
type: project-memory
status: active
confirmation: confirmed
scope: JobsDocs 博客自动构建、HTML 内嵌展示与音乐交互
repository: /Users/jobs/Documents/Github/JobsDocs
source: 2026-10-08 当前会话用户明确要求“始终要自动构建”；现有工作流文件核验
created: 2026-10-08
updated: 2026-11-15
tags:
  - codex-memory
  - project
  - jobsdocs
---

# JobsDocs 博客自动构建

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、项目边界](#jobs-toc-heading-2)
- [二、已确认约束](#jobs-toc-heading-3)
- [三、同步与核验](#jobs-toc-heading-4)
- [四、站内 HTML 与音乐交互](#html-and-music)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 记录 JobsDocs 博客的自动构建、产物回写、HTML 内容展示与背景音乐交互约束。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、项目边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 仓库路径：`/Users/jobs/Documents/Github/JobsDocs`；远端为 [**GitHub**](https://github.com) 的 `JobsKits/JobsDocs`。
- 适用范围：`.github/workflows/deploy-blog.yml` 与 `blog/` 的自动生成和产物回写；不外推到 iOS、IM 或其它项目的构建策略。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、已确认约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 用户原话：“始终要自动构建”；确认状态：`confirmed`；确认日期：2026-10-08。
- 始终保留 `push main` 自动触发博客生成及构建产物回写 `main` 的能力；不能通过关闭工作流、取消回写或跳过构建来解决 `non-fast-forward` 推送拒绝。
- 2026-10-08 核验现有工作流：推送 `main` 后运行 `blog/install.command --ci`，`blog/` 产物有变化时由机器人提交，并执行 `git push origin HEAD:main`。远端因此可能先于本地出现新的产物提交。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、同步与核验 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 后续授权推送前先 `fetch` 并检查工作区和双方历史；分叉时整合本地业务提交与远端构建提交，保留双方历史，再正常推送，不用强推覆盖构建提交。
- 推送后等待对应自动构建完成，核验构建结果，再获取并整合产物回写，确认本地 `main` 与 `origin/main` 同步。构建或回写失败时继续排查实际失败原因，不能用跳过构建作为成功判据。
- 本笔记保存长期项目约束和工作流事实，不保存一次性提交号、运行日志或构建结果；不扩大未授权提交、推送的权限。

## 四、<span id="html-and-music">站内 HTML 与音乐交互</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-11-15 明确要求本站不只显示 Markdown，HTML 也要显示在原 Markdown 正文区域，形成画中画；同时指出手动暂停音乐后移开鼠标会自动续播。需求状态：`confirmed`；范围：JobsDocs 网站。
- HTML 与 Markdown 都是可导航的内容类型；独立 HTML 必须有目录入口，不要求先提供 README。打开后在右侧正文区域内嵌显示／运行，左侧导航保留，原 HTML 文件不改写。
- README 配套 HTML 可在说明页内嵌；站内入口继续定位对应小窗，保留重新运行、独立窗口及网页自身全屏能力。
- 背景音乐的手动暂停优先于自动播放重试；鼠标移动、普通点击、滚动、文档切换和页面恢复不能解除暂停，只有用户主动播放才恢复。当前实现保留暂停、进度、音量及静音状态，不能通过重复叠加自动播放脚本绕过用户选择。
- 本地构建与浏览器验证不等于线上已更新；仍遵守用户未授权时不提交、不推送的边界，并保留自动构建和产物回写。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
