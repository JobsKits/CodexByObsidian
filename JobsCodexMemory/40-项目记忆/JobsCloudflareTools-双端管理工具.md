---
type: project-memory
status: active
scope: jobs-cloudflare-tools
source: 用户于 2026-11-05 明确提出的工具与交互要求
created: 2026-11-05
updated: 2026-11-05
tags:
  - codex-memory
  - project
  - cloudflare
  - shell
---

# Jobs [**Cloudflare**](https://www.cloudflare.com/) 双端管理工具

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 来源：用户于 2026-11-05 明确要求把 Cloudflare 命令行封装为日后可以重复使用的双端脚本工具；本文记录确认的项目边界，不把临时故障判断写成长期事实。

## 一、<span id="project-scope">交付位置与双端范围</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 状态：confirmed；创建／更新：2026-11-05。
- 当前工具目录：`/Users/jobs/Desktop/JobsCloudflareTools`。用户明确指定放系统桌面；未授权为其创建远程仓库、提交或推送。
- 同时提供 `MacOS/` 与 `WindowsOS/` 入口，按现行 `jobs-macos-shell`、`jobs-markdown-docs` 维护脚本结构、运行时自述、交互、日志和就近 README。
- 用户目前只有 MacOS 电脑，会自行测试 MacOS；WindowsOS 侧仍须交付对应实现，语法／隔离验证与 WindowsOS 原生实机验收分别表述，不能互相替代。
- 工具目标是集中 Cloudflare 常用能力，减少反复在网页寻找功能；最初的域名接入和 Worker 绑定应成为可复用流程，不只完成一次临时操作。

## 二、<span id="browser-terminal-handoff">网页与终端的人工交接</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 状态：confirmed；创建／更新：2026-11-05；适用范围：本 Cloudflare 工具。
- 能用已有命令行授权完成的步骤直接由工具编排；需要用户在网页干预时，先准备所需资料和明确目标页面，再打开浏览器等待用户操作。
- 用户完成网页操作后，回到终端／CMD 显式确认，工具再继续后续步骤。确认是流程继续信号，实际完成状态仍需从 API、DNS 或目标服务读回验证。
- 遇到权限不足应说明具体欠缺与所需网页动作，不让用户自己猜入口或重复抄写已可读取的账号、域名和名称服务器资料。
- 本记忆不保存 Token、Cookie、密码或其它认证内容；临时网络现象、域名是否被封和第三方代码是否恶意等未经验证判断不落库。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
