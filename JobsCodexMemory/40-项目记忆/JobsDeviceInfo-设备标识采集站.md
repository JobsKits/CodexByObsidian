---
type: project-memory
status: active
scope: JobsDeviceInfo
repository: /Users/jobs/Documents/Github/JobsDeviceInfo
source: 2026-10-28 至 2026-10-29 用户确认、本机验证与线上发布核验
created: 2026-10-28
updated: 2026-10-29
tags:
  - codex-memory
  - project
  - device-info
---

# JobsDeviceInfo 设备标识采集站

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

> 用户要求网站、后端与 macOS 一键部署脚本组成独立文件夹放在桌面，并在电脑页面提供二维码；手机按系统提示确认后自动上传，再由页面自动显示结果。

## 一、项目边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前项目路径：`/Users/jobs/Documents/Github/JobsDeviceInfo`，2026-10-29 实查已是独立 Git 工作树，远端为 GitHub `JobsKits/JobsDeviceInfo` 与 Gitee `JobsGo/JobsDeviceInfo`；替代 2026-10-28 桌面独立文件夹、尚未建库的状态。原始桌面交付要求保留为来源，不继续作为当前工作路径。
- 目录规范（2026-10-29，用户明确要求 / 本机 verified）：六份项目 README 及 `.jobs-markdown-toc/README.md` 共七份精确接入标准过滤器，本地保留 `[toc]`、整文件暂存生成折叠目录；本机已注册上述双远端的 12 个精确 URL 变体。字节往返、临时索引、两个来源的首次克隆及真实快进拉取通过；克隆用进程内本地 bare 重定向，未向托管远端发布。源码、真实 HEAD 和暂存内容保持；首次发布仍须正常整文件暂存全部清单文档、属性和工具后检查，不把本地接入当成远端已更新。审计与备份位于 `/Users/jobs/.codex/backups/JobsDeviceInfo-toc-2026-10-29-S1byQQ`。
- 当前线上入口：[设备采集站](https://jobs-device-info-pages.pages.dev/)。采用 [**Cloudflare Pages**](https://developers.cloudflare.com/pages/) 专属项目 `jobs-device-info-pages`，通过 Service Binding 原样调用 `jobs-device-info` Worker；数据库仍为原独立 [**D1**](https://developers.cloudflare.com/d1/)，不复制业务或迁移数据，原 Worker Cron 继续清理。
- 桌面入口为 `【MacOS】🚀部署到Cloudflare.command`（后端与网页）、`【MacOS】🌐部署Pages入口.command`（薄入口）、`【MacOS】🧪本地预览.command` 和 `打开线上采集站.webloc`。修改后端或网页先部署 Worker，再执行 Pages 入口脚本以更新本地预览默认地址；只发布 Pages 不更新原 Worker 的业务源码或网页资源。
- 自定义域名仅绑定配置中的完整主机名；绑定前核对冲突，禁止覆盖已有 DNS 或其它 Worker。部署沿用本机既有授权，不把凭据打包。

## 二、已确认的采集流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 用户于 2026-10-28 明确要求二维码扫码、手机系统确认后自动上传后端并返显；电脑与手机共享同次短期结果。二维码使用一次性随机 fragment 凭据，不放硬件编号；手机同意后认领，各端持独立 HttpOnly Cookie。
- 当前实现为 [**Apple Profile Service**](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/iPhoneOTAConfiguration/profile-service/profile-service.html)：手机 [**Safari**](https://www.apple.com/safari/) 下载描述文件，用户在设置中确认后系统回传。普通网页不能直接读取 UDID / IMEI；不注册 MDM，也不配置 VPN、代理或根证书。
- 苹果系统确认以 UDID 为主要采集结果；IMEI 可缺失，提供手工补录并显示来源。Android、鸿蒙不适用苹果描述文件，使用下述浏览器基础信息流程。
- 三端范围（2026-10-29，用户明确 confirmed）：iPhone / iPad、Android、鸿蒙（至少含 HarmonyOS 3）均须支持扫码，页面标题、引导、同意项、结果和缺值说明均按三端能力组织；不能继续仅给苹果设备显示采集入口。
- 浏览器基础信息流程（2026-10-29，实现 verified / 三端新版真机待验）：沿用一次性二维码与双端 Cookie，通过 `POST /api/session/browser` 在明确同意后提交白名单 UA、可用 UA-CH、语言与屏幕信息；系统、型号和版本按实际可见线索提供，标注浏览器报告、浏览器提示或用户选择。鸿蒙 3 可能只暴露 Android 兼容 UA，允许手选鸿蒙，但不得将 Android 兼容版本作为真实鸿蒙版本；冻结 UA 的 Android 10 / K 不作为真实版本或机型。苹果 Safari 可选择原系统确认或浏览器基础信息；无法识别的桌面 UA 可手动进入本机浏览器采集。
- 缺值与补录（2026-10-29，本机 verified）：区分不适用、浏览器无读取权限、系统接口不提供、实际未回传、空值及格式异常。浏览器不能自动读取 UDID / IMEI / ICCID / 序列号等硬件编号；IMEI2、型号部件号、SEID 仍超出现有苹果接口可保证的范围，手工补录不能等同自动读取。系统原值只读，浏览器与资料映射可更正；版本补录支持 1–4 段数字，苹果 VERSION 的纯数字构建号仍不冒充系统版本。
- 服务端要求 CMS 内容签名并校验 Challenge，但尚未验证 Apple 签名者信任链，不能作为设备真实性或登录认证依据。
- 结果会话 15 分钟逻辑过期，访问时与每 15 分钟定时清理过期行；平台备份策略另计，不承诺立即物理抹除所有平台副本。
- 本地预览 `127.0.0.1:8787` 的二维码入口转到线上同源页面后生成；不能让手机认领仅存在本地 D1 的会话。

## 三、验证与网络边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 2026-10-28 已完成 11 项自动测试、55 项真实本地 HTTP / workerd / D1 / CMS 联调、Worker 发布；HTTPS 健康检查仅通过电脑现有系统代理。本地宽屏和窄屏排版已查看，不能将这些结果等同于手机 4G 直连或真机采集验收。
- 同日用户提供手机截图并确认“手机没有 VPN、电脑开了 VPN”；手机 4G 扫码后尚未加载网页。只读复测在本机未注入显式代理时，目标域名的 IPv4 / IPv6 均在 TLS 握手时被重置，父域也一样；同一 Cloudflare IP 上官方域名可正常 TLS / HTTP 访问，经现有代理访问目标则证书校验与健康接口均成功。证据强烈指向目标域名相关的访问路径干扰，具体主体未知；二维码编码、证书签发和业务逻辑未发现同类故障。
- 用户明确选择当前项目必须“手机不开 VPN 也能用”，并提供在 [**DNSHE**](https://my.dnshe.com/) 新建的 `jobsdevices.ccwu.cc`。因既有命令行授权缺少创建区域权限，用户在控制台创建新站点并于同日截图确认已将 DNSHE 的 NS 保存为该新区域实际分配的 `gigi.ns.cloudflare.com`、`tim.ns.cloudflare.com`；父区两台权威、递归解析及 Cloudflare 权威均已验证委派，Cloudflare API 区域状态为 `active`。
- 新域已安全绑定现有 Worker，部署配置、桌面快捷入口与本地预览公开 URL 已切换；沿用既有 D1，11 项自动测试再次通过。新域经当前系统代理严格 HTTPS 校验与健康接口 200 成功；无显式代理的 IPv4 / IPv6 仍在 TLS ClientHello 阶段重置，IPv4 按权威 A 做单进程 `--resolve` 检查也失败，不能仅归因于负缓存。同日用户按提示保持手机 VPN 关闭，用 Safari 直接打开新域，明确反馈仍提示网络连接丢失；新入口手机访问已实测失败，真实描述文件安装与 IMEI 回传尚未验证。用户另确认目前没有其它域名或公网服务器；两个域共用 `ccwu.cc` 后缀，但不能据此直接断定整个后缀被阻断。
- 本机默认 `workers.dev` 直连解析异常；用户当前系统代理已启用。部署入口可选 `JOBS_DEVICE_HEALTH_NETWORK=system-proxy`，只把动态读取的代理交给健康检查与域名 API 的 curl 子进程，不持久化、不修改系统配置、不固定端口；也可显式选择 `direct`。
- 用户确认暂无其它域名或公网服务器后，已在同账户创建专属 Pages 默认域；本机显式无代理 HTTPS 与 20 项真实线上页面、资源、配对、Cookie、描述文件、同源回调、私有诊断及空测试会话清除均通过，未向生产提交测试硬件编号。用户确认手机能打开新页面并到达系统安装；截图显示 Wi-Fi，不能标记 4G 已验收。Pages 使用全路径代理，保留 Request URL、正文和 Response，系统回调仍落 Pages 同源地址。`pages/wrangler.json` 不允许 account_id，Pages 脚本从根设置给每条 Wrangler 进程传账户；本机归属记录为 `.pages-deployment.json`，不打包。
- 真机安装曾返回 HTTP 400。已新增迁移 `0003_callback_diagnostics.sql`，仅随15分钟会话记录固定 code/stage、白名单算法分类与时间；Cookie 客户端只见 code/stage/at，不存原始 CMS、XML、异常原文或硬件字段。用户重试后只读聚合确认 `invalid_imei` / `device`，即 CMS、Challenge 和 UDID 校验已通过。已修复可选 IMEI 阻断整份数据的问题：只对明确的15位数字或合法ASCII空格/连字符分组归一化；其它非空值不保存，标记 `unrecognized_format`，保留有效UDID；16位IMEISV不冒充IMEI，手工IMEI仍严格15位。15项自动测试通过，修复已发布，正等待真机再次验收。
- 用户后续截图显示系统端“无效的描述文件”，但只读非识别元数据确认该次配对回传已received且IMEI合法。用户说明原标签页已关闭，重新打开同一Chrome生产域首页后，明确确认电脑已显示UDID、IMEI。因此真机回传与电脑返显已验证，不能再记录为未取得数据；没有读取或记忆编号原值。
- 成功回调已从303调整为301加绝对同源首页、no-store且不携设备值或会话秘密；依据是作者项目iOS-UDID-Safari的实际PHP/Java源，不能当作Apple对当前iOS终态的保证，系统安装提示仍待新版真机复验。`#start-pair`入口遇到received会话时先恢复结果，避免意外重建删除已收到的会话；普通首页不创建新配对。
- 用户追加要求显示关于本机的IMEI、IMEI2、ICCID、MEID、系统版本、型号名称、序列号、型号号码和SEID，且名称/数值点击复制后弹对话框。已实现12项展示（上述9项加UDID、PRODUCT、VERSION）、来源标签、复制全部和9项白名单补录；系统值只读，映射可更正，空值不伪造或复制假编号。复制成功/失败使用真正dialog，支持关闭/Esc与焦点恢复。
- ProfileService请求仅新增Apple官方示例支持的ICCID、MEID，不盲目请求未证实的IMEI2/SEID等属性。系统未返回时留空并支持手填；osVersion不使用浏览器版本或构建号冒充。型号名称使用本地DeviceKit固定提交映射（167个iPhone/iPad标识、MIT许可和来源在data目录），命中标derived，未知留空。
- 迁移0004增加manual_details_json；POST /api/session/details使用同源+Cookie+有效期+9字段白名单，实际profile值拒绝覆盖，手工JSON补丁原子合并、双端同步，IMEI共用原manual_imei。当前20项自动测试、75项真实本地HTTP/D1/CMS联调、21项线上API联调通过；无硬件测试夹具已验证文字复制dialog、来源、补录与390px无横向溢出。线上脚本IPv4/IPv6直连下载与源码一致，未向生产提交测试硬件编号。完整系统安装终态与手机4G仍单独验收。
- 用户进一步明确：问题是希望“未返回”项目自动取得，复制本身无故障，不能以手动补录等同自动读取。已接入Apple公开Software Lookup Service的本地构建号版本表（data/apple-os-versions.json，44个无冲突构建号），只按原始VERSION+PRODUCT精确匹配推导系统版本并标记“版本映射”；已用Apple发布记录核实24A446对应27.0.1，此为公开版本事实、不含真实设备编号。未知/产品不匹配不猜测，实际系统值优先。新增ICCID固定可用性分类区分未回传、空、未知类型和未识别格式，不保存原始内容。22项自动测试通过，更新已发布。
- 能力边界已核实：目前仅有ProfileService请求UDID/IMEI/ICCID/MEID/PRODUCT/VERSION/SERIAL的可靠官方依据；IMEI2等的MDM ServiceSubscriptions权限不能当作现有扫码流程权限。Apple官方Configurator可通过USB及用户正常信任报告双SIM IMEI/ICCID，但SEID、完整型号号码仍无必定取得的保证，EID绝不能冒充SEID。当前正向用户询问是否接受安装官方Configurator并USB补采；未得到同意前不得安装、配对、读取设备或改为MDM。
- 硬件标识、Cookie、配对码、回调 Token、原始 CMS、私钥与账户认证凭据均不得写入永久记忆。
- 三端新版验证与发布（2026-10-29，verified）：35 项自动测试、109 项真实本地 workerd / D1 / CMS 联调、Worker 与 Pages 构建通过；本地浏览器采集、用户选择来源、复制对话框、390px 无横向溢出及无控制台错误已核验。已仅更新现有 Worker，沿用 Pages 内部绑定与原 D1，无新迁移、DNS 变更、Git 提交或推送；Pages 线上首页、app.js、device-capabilities.js、styles.css 与源码逐字节一致，健康接口成功，新增接口拒绝无会话写入。未向生产提交硬件测试夹具；Android / 鸿蒙及新版苹果流程的真机扫码仍待用户复验。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
