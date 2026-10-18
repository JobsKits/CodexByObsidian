# <span id="前言">📒CodexByObsidian</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [一、目录结构](#repository-layout)
- [二、同步脚本](#repository-script-flows)
  - [同步Obsidian记忆.command](#jobs-toc-heading-3)
  - [同步Obsidian自动任务.command](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

[目录结构](#repository-layout) · [同步脚本流程](#repository-script-flows)

本仓保存跨项目永久记忆 Vault，以及记忆和 Codex 自动任务配置的同步入口。

## 一、<span id="repository-layout">目录结构</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
📒CodexByObsidian/
├── README.md
├── 同步Obsidian记忆.command
├── JobsCodexMemory/                        # 永久记忆 Vault，内容独立维护
│   ├── .obsidian/                          # 本机 Obsidian 设置
│   ├── 00-记忆入口.md
│   ├── 10-用户画像/ / 20-长期规划/ / 30-工作流决策/
│   ├── 40-项目记忆/ / 50-每日复盘/ / 60-收集箱/
│   └── 90-系统/ / 99-归档/ / 99-附件/
└── Obsidian自动任务备份/
    ├── 同步Obsidian自动任务.command
    └── automations/                        # 按任务 ID 保存 automation.toml
```

记忆正文由 Vault 的入口和分类管理；根目录只说明仓库职责及同步入口。自动任务备份与永久记忆分开存放。

## 二、<span id="repository-script-flows">同步脚本</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### <span id="jobs-toc-heading-3" data-jobs-toc="v2">[同步Obsidian记忆.command](./同步Obsidian记忆.command)</span><!-- jobs-toc:heading-end -->

> **目的：** 把 Obsidian 当前打开 Vault 的记忆内容同步到本仓固定 Vault。

* 阅读说明并确认，检查 Python，定位脚本旁的 `JobsCodexMemory` 和 Obsidian 当前打开的唯一 Vault。
* 比对源与目标并生成 rsync 预览。
  * 两者实际为同一目录或没有差异时直接结束；排除 `.obsidian`、`.git` 和 `.DS_Store`。
* 检查预览后再按回车确认，复制新增和变化文件。
* 保留目标独有文件，不做删除同步，最后输出日志和同步结果。

### <span id="jobs-toc-heading-4" data-jobs-toc="v2">[同步Obsidian自动任务.command](./Obsidian自动任务备份/同步Obsidian自动任务.command)</span><!-- jobs-toc:heading-end -->

> **目的：** 在本机 Codex 与本仓备份目录之间同步自动任务配置。

* 阅读说明，定位本机自动任务目录和脚本旁 `automations`，只处理各任务 ID 下的 `automation.toml`。
* 选择“本机到备份”或“备份到本机”，先查看待处理项目。
* 按所选方向复制配置。
  * 备份已有同名文件时先保留快照；恢复冲突时逐项选择保留本机、覆盖或取消，覆盖前备份本机文件；相同内容跳过。
* 显示新增、覆盖、跳过及失败统计和日志；不删除未匹配任务，不调用调度接口。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
