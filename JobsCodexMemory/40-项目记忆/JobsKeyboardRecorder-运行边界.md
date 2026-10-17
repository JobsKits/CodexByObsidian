---
type: project-memory
status: active
scope: JobsKeyboardRecorder
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others
source: 用户于 2026-10-17 明确要求仅程序运行期间允许创建下载目录中的 JobsKeyboardRecorder
created: 2026-10-17
updated: 2026-10-17
tags:
  - codex-memory
  - project
---

# JobsKeyboardRecorder 运行边界

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 记录键盘记录脚本的用户确认边界，避免后续恢复为关闭入口后继续驻留的行为。

## 一、项目范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 仓库路径：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others`。
- 脚本包路径：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@Others/【MacOS】JobsKeyboardRecorder.command`，主脚本与 `README.md` 同级维护。

## 二、已确认约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 来源：用户于 2026-10-17 反馈脚本未运行时，键盘输入仍会创建下载目录中的 `JobsKeyboardRecorder`；状态：confirmed；适用范围：本脚本及其缓存原生记录器。
- 只有主动运行程序的有效会话期间才允许创建或重建记录路径。启动脚本退出、启动终端关闭或记录停止后，不能由残留后台记录器继续监听、写入或重建路径。
- 启动入口必须保持会话归属；即使强制结束入口、来不及清理票据，原生记录器也要识别失效并停止。退出保存不得再次创建已删除的记录路径。
- 此约束取代旧实现中“启动成功后可以关闭终端并继续后台记录”的行为；历史记录内容不属于本约束授权的删除范围。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
