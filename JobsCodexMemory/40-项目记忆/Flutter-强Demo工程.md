---
type: project-memory
status: active
scope: flutter-demo-hub
repository: /Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo
source: 用户于 2026-11-14 明确提出的工程长期建设要求
created: 2026-11-14
updated: 2026-11-14
tags:
  - codex-memory
  - project
  - flutter
---

# Flutter 强 Demo 工程

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 用户希望 Flutter 工程长期平行于 OC／Swift 原生强 Demo；需求 confirmed；功能实现与编译／交互验证见下方当前基线，真实硬件验收单独记录。

## 一、确认的工程要求 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- App 进入先开屏，结束移除开屏，再进入首页。首页是按功能分组的列表，每个 cell 对应实际可观摩功能，支持搜索。
- 首页左向右滑出菜单，半开／全开可设置；其它能力以 OC 新旧／Swift 工程实际功能为蓝本，保留所有 Flutter 既有功能再补缺项。
- 公共能力按用途拆到 `JobsByPubs`，类似 iOS 的 JobsByPods；不要把业务 Demo 全堆进公共包。
- 每个功能统一放中文命名文件夹，不论一个还是多个 Dart 文件；尽量单文件，同时优先解耦。页面提供独立 main 入口，便于 VS Code 直接运行并观察效果，主 App 复用同一 Widget。
- Flutter 使用最新官方稳定 SDK；每次修改核对版本和真实编译结果，避免升级后 API 漂移。编译、静态分析、交互、硬件验收分别记录，不把某一项代替其余。

## 二、实现定位与边界 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 主入口 `lib/main.dart`，目录框架 `lib/demo_hub`，中文功能入口 `lib/demos`，公共基础包 `JobsByPubs/JobsDemoFoundationByPub`；旧 `lib/JobsDemoTools` 保留兼容转发，实际 Demo 与专属依赖集中在中文目录。
- 原 `main.dart` 异形按钮已完整保留到 `lib/demos/异形按钮/异形按钮.dart`，回归测试引用功能文件而不是假定它仍是默认入口。
- 原生实际入口清单为 `docs/native_feature_inventory.json`，对照见 `docs/原生功能对照.md`；385 个跨工程注册条目含大量重复及条件编译，不等于385种独立能力。ARKit、BLE、直播、Widget、Runtime、播放器及Unity有实际原生实现，平台条件、编译通过与实体设备验收分开记录，不用说明页替代设备功能。
- 2026-11-14 当前基线 Flutter 3.50.0／Dart3.14.0；.fvmrc与CI已对齐。Material／Cupertino新独立包与历史GetX类型体系需成组迁移，不能局部替换造成Theme或Navigator类型分裂。

## 三、当前实现与验证基线 <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 创建／更新：2026-11-14；来源为本任务用户要求继续完成及实际本机验证，状态 implemented-and-scoped-verified。仓库 `/Users/jobs/Documents/GitHub/JobsBaseConfig/JobsBaseConfig@JobsFlutterBaseConfigDemo`。
- 首页281个功能入口：189个旧能力／配置、14个平行交互、7个算法基础、16个数据／微应用、7个补充实验、34个UI、13个平台、1个真实iOS双引擎往返。原生385条注册记录对应245个独立类型，完整映射保存在工程JSON与对照文档。
- 175个旧main及85个专属依赖已归并；119个旧例目录使用具体中文功能名。旧路径保留兼容导出；操作控件十语与主题响应、局部路由、取消和生命周期有回归覆盖。
- 公共包：`JobsDemoFoundationByPub` 承接主题／十语／菜单／空态／输入／双向刷新／文字／队列／缓存／球形点选／冻结表格；`JobsLabRuntimeByPub` 承接隔离存储、白名单、编码加密、数据记录、计时；`JobsPlatformLabByPub` 承接原生硬件、媒体、Runtime／IMP回滚及引擎桥接。
- Flutter3.50.0／Dart3.14.0基线；主工程545测试与公共菜单5测试（共550）通过。全仓分析无error／warning，保留SDK弃用info；旧路径3个孤立生成part副本仅只读排除，中文目录活动生成库仍检查。Web release JavaScript、Android debug APK、iOS Simulator debug和iOS真机arm64无签名构建通过；模拟器安装启动到281项首页、原生宿主打开第二引擎、插件读写、回传与销毁均已实测（2个isolate恢复为1个）。
- 长按录制3–60秒与iOS滤镜真正写入带声成片、原生宿主打开第二FlutterEngine传参／回传、方法IMP替换与回滚、蓝牙／AR／传感器／录音／RTMP／PDF／PiP／Widget／动态图标／多窗口为实际实现。Unity只对iphoneos嵌入原生arm64 Framework和匹配Data。真实BLE外设、AR真机与推流服务的设备条件不以单测或编译冒充跑通；Web为JavaScript，不宣称旧依赖支持Wasm。
- 用户明确要求完成全量工作后再交付，不能把中间阶段完成当作本任务终点；若需要报告限制，区分实现缺口与实体设备／签名／服务条件。

<a id="🔚" href="#前言">返回首页</a>
