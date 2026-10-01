---
type: project-memory
status: active
scope: JobsEnglishWordBook
source: 用户于 2026-09-28 提出需求，2026-09-29 明确继续；工程事实经本机验证
created: 2026-09-29
updated: 2026-10-01
---

# JobsEnglishWordBook 分级英语词典

- 用户于 2026-10-01 确认英语词本统一命名为 `JobsEnglishWordBook`，目录、包名、脚本、界面与打包名称同步。

## 一、已确认需求

- 工程放在系统桌面，使用 Python，可分别在 macOS 和 Windows 打包。
- 初中、高中、CET4、CET6、专八及雅思 1～7 分难度；按字母分区，单词固定在行左上角，右侧列出多义解释。
- 点击单词发音；点击释义进入二级例句页；标题单词与每个英文句子都可点读。

- 用户于 2026-10-01 要求侧栏标题完整显示，并提供白天、黑夜、跟随系统主题切换；主题选择持久化，系统模式响应外观变化。

## 二、工程事实

- 工程路径：`/Users/jobs/Documents/Github/JobsGenesis/JobsPythonTools.py/语言学习.py/JobsEnglishWordBook.py`，内层 `JobsEnglishWordBook`。
- 实现：PySide6 原生界面、SQLite 离线词库、QTextToSpeech 系统英语语音、PyInstaller 分平台打包。
- 当前语料：九本公开备考词书合并为 13,430 个词条、25,832 条例句；844 个词条缺例句，且原数据未提供逐义例句关联。不得把当前版本描述成所有义项、逐义例句已经完整覆盖。
- 雅思档位为 wordfreq 词频排序的自定义学习分级，非官方逐分词表；其他档位覆盖指定词书合集，非已核验的官方最新教学大纲。
- 语料来源 kajweb/dict 未提供清晰再分发授权，公开发行前需要授权资料替换。
- 已验证 macOS Apple Silicon 构建和系统发音；Windows 入口已提供但未在 Windows 真机运行。具体产物路径见工程 dist 时间戳目录。

## 三、维护入口

- 总说明：外层 README.md。
- 语料来源、SHA-256、各难度数量和缺例句数量：内层 src/jobs_english_wordbook/assets/coverage.json。
- 后续应优先解决授权完整词表和逐义例句语料，再声称达到全量学习内容要求。

- 用户于 2026-10-01 确认：语言学习各独立子仓统一保留根目录 `showMeNow.mp4`，README 提供本地视频链接；GitHub 内嵌播放器使用上传后生成的独立附件 URL，不使用相对路径 `<video>`。上传附件不等于提交或推送 README。

- 用户于 2026-10-01 确认：附件上传使用 JobsPythonTools.py 根目录 `【MacOS】🎬上传GitHub视频附件.command`，只需仓库地址和本地视频两个业务参数，返回 URL 后本地替换 README 再推送；脚本需注明单独删除附件联系 GitHub Support，删除本地目录无效，远端仓库删除清理存在延迟。

- 用户于 2026-10-01 要求并已关联：JobsPythonTools.py 父仓通过 `.gitmodules` 和 gitlink 管理 `语言学习.py/JobsEnglishWordBook.py`、`语言学习.py/JobsKanjiByJap.py`、`语言学习.py/JobsRussianTrainer.py`，均使用各自 origin 和 main 分支；俄语旧根目录 gitlink 已迁移移除。
