---
type: project-memory
status: active
scope: jobscommand-ios-packaging
repository: /Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS/打包相关
source: 2026-07-24 用户明确确认
created: 2026-07-25
updated: 2026-07-25
tags:
  - codex-memory
  - project
  - ios
  - shell
---

# JobsCommand iOS 打包脚本

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 记录 `【MacOS】📦双击自动生成ipa文件.command` 的现有边界、确认方向和后续升级约束；规划项不能表述为已经落盘。

## 一、项目边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 仓库路径：`/Users/jobs/Documents/Github/JobsGenesis/JobsCommand@iOS/打包相关`。
- 目标脚本：`【MacOS】📦双击自动生成ipa文件.command/【MacOS】📦双击自动生成ipa文件.command`。
- 配套文档：同目录 `README.md`；每次升级脚本都要按 `jobs-markdown-docs` 对账 README，`VS fastlane` 还要重新核对双方当前能力、版本和官方资料，但 README 内不重复写“强制维护规则”。

## 二、当前实现基线

- 当前脚本是“已有 `.app` → `Payload` → IPA”的封装工具：定位工程与 Scheme、查找既有真机 `.app`、复制后压缩并输出。
- 当前未实现源码 Archive、`xcodebuild -exportArchive`、证书与描述文件匹配、Entitlements 校验、多 Target 独立签名或 Apple Developer 后台管理。
- 后续升级必须保留现有快速封装模式和原业务逻辑，作为默认兼容入口；新增能力通过外层模式分发实现，不重写或破坏旧流程。

## 三、确认的长期方向

- 来源：用户于 2026-07-24 明确确认。脚本定位为专注 iOS 的 macOS 原生打包工具，目标是在不引入 [**fastlane**](https://fastlane.tools)、Ruby 或 Bundler 的前提下，逐步覆盖构建、签名、Archive 和 IPA 导出。
- 主入口、工程、Scheme、Configuration、Team、导出方式与描述文件统一通过 [**fzf**](https://formulae.brew.sh/formula/fzf) 选择，不使用编号或自由文本输入。
- 每次调用 `fzf` 前必须完成自检：依次检查当前命令、Apple Silicon [**Homebrew**](https://brew.sh/) 路径和 Intel Homebrew 路径，保存绝对路径并打印版本；缺失时引导安装，失败或取消则安全退出，不静默选择第一项。
- 规划按“签名环境只读体检 → Automatic / Manual Archive 与 Export → 有真实需求后再考虑设备注册、上传和版本号自动递增”分阶段推进；Bundle ID 与 Entitlements 第一阶段只检查、不自动改。

## 四、高风险签名边界

- `-allowProvisioningUpdates` 允许 [**Xcode**](https://developer.apple.com/xcode) 与 Apple Developer 服务通信，Automatic Signing 下可能创建或更新证书、App ID 和描述文件；Manual Signing 下可下载缺失或更新后的描述文件。
- 脚本启用前必须打印签名方式、Team、涉及的 Bundle ID、可能修改的后台对象和设备注册状态；先用 `fzf` 选择“关闭 / 开启 / 返回”，选择开启后仍要求手动输入完整 `YES`。
- `fzf` 负责普通选项，高风险确认不能被选择器替代。第一阶段不开放 `-allowProvisioningDeviceRegistration`，不读取或打印 Apple ID 密码、私钥、Token 或 `.p8` 内容。
- 完整导出应使用新的时间戳 Archive 目录，生成临时 `ExportOptions.plist`，验证主 App 与嵌套 Extension 的签名、Bundle ID、描述文件和 Entitlements，并输出 IPA、Archive、dSYM、日志、签名报告与 SHA-256；失败时保留 Archive 和日志。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➔点我回到首页</a>
