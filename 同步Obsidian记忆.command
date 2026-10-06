#!/usr/bin/env zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：同步Obsidian记忆.command
# - 核心用途：将当前打开的 Obsidian Vault 内容同步到脚本旁的 JobsCodexMemory。
# - 影响范围：只新增或更新记忆文件；保留目标端独有文件和 Obsidian 配置。
# - 运行提示：先显示同步预览并等待回车；按 Ctrl+C 取消。

# 将屏幕信息和日志同步输出。
# 仅渲染自述：标题红色加粗，编号正文蓝色常规字重；非彩色终端输出纯文本。
jobs_intro_style() {
  local intro_color=0
  if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
     [ -z "${NO_COLOR+x}" ] && [ "${PLAIN_OUTPUT:-0}" != 1 ] &&
     [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]; then
    intro_color=1
  fi
  /usr/bin/awk -v color="$intro_color" -v role="${1:-body}" '
    BEGIN { esc = sprintf("%c", 27) }
    {
      gsub(esc "\\[[0-9;]*m", "")
      gsub(/\\(033|e|x1[bB])\[[0-9;]*m/, "")
      if (!color || $0 ~ /^[[:space:]]*$/) { print; next }
      numbered = ($0 ~ /^[[:space:]➤ℹ🔹✔⚠]*([0-9]+[、.)）]|[0-9]+️⃣|[-•])/)
      heading = ($0 ~ /^[[:space:]]*#{1,6}[[:space:]]/ || $0 ~ /[：:][[:space:]]*$/ || $0 ~ /^[[:space:]]*[=━─-]{3}/)
      title = (!numbered && (role == "title" || heading))
      if (role == "auto" && !seen && !numbered) title = 1
      if ($0 !~ /^[[:space:]]*[=━─-]+[[:space:]]*$/) seen = 1
      printf "%s%s%s\n", esc (title ? "[1;31m" : "[0;34m"), $0, esc "[0m"
    }
  '
}
log() {
  printf '%b\n' "$1" | tee -a "$LOG_FILE"
}

# 输出标准颜色日志。
color_echo() { log "\033[1;32m$1\033[0m"; }

# 输出状态信息。
info_echo() { log "\033[1;34mℹ $1\033[0m"; }

# 输出成功状态。
success_echo() { log "\033[1;32m✔ $1\033[0m"; }

# 输出警告状态。
warn_echo() { log "\033[1;33m⚠ $1\033[0m"; }

# 输出温馨提示。
warm_echo() { log "\033[1;33m$1\033[0m"; }

# 输出说明提示。
note_echo() { log "\033[1;35m➤ $1\033[0m"; }

# 输出错误状态。
error_echo() { log "\033[1;31m✖ $1\033[0m"; }

# 输出纯文本错误。
err_echo() { log "$1"; }

# 输出调试信息。
debug_echo() { log "\033[1;35m🐞 $1\033[0m"; }

# 输出高亮信息。
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }

# 输出次要说明。
gray_echo() { log "\033[0;90m$1\033[0m"; }

# 输出加粗文字。
bold_echo() { log "\033[1m$1\033[0m"; }

# 输出下划线文字。
underline_echo() { log "\033[4m$1\033[0m"; }

# 展示同步范围并等待用户确认。
show_script_intro_and_wait() {
  printf '\n============================== 脚本自述 ==============================\n' | jobs_intro_style title
  printf '脚本名称：同步Obsidian记忆.command\n' | jobs_intro_style title
  printf '核心用途：把本机当前打开的 Obsidian Vault 同步到脚本旁的 JobsCodexMemory。\n' | jobs_intro_style body
  printf '路径规则：目标目录相对脚本位置计算；源目录从 Obsidian 本机配置动态读取。\n' | jobs_intro_style body
  printf '影响范围：新增或更新文件，不删除目标端文件，不复制 .obsidian 设置。\n' | jobs_intro_style body
  printf '取消方式：按 Ctrl+C 取消；确认后会先显示变更预览。\n' | jobs_intro_style body
  printf '日志位置：系统临时目录中的“同步Obsidian记忆.log”。\n' | jobs_intro_style body
  printf '=======================================================================\n\n' | jobs_intro_style title
  if [[ ! -t 0 ]]; then
    printf '✖ 请在终端交互运行此脚本。\n' >&2
    return 1
  fi
  read -r '?👉 已了解同步范围，按回车继续；按 Ctrl+C 取消：' _
}

# 初始化脚本位置和运行日志。
initialize_paths() {
  setopt NO_NOMATCH
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd -P)" || return 1
  SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
  LOG_FILE="${TMPDIR:-.}/${SCRIPT_BASENAME}.log"
  : > "$LOG_FILE" || return 1
  TARGET_DIR="${SCRIPT_DIR}/JobsCodexMemory"
  OBSIDIAN_CONFIG="${HOME}/Library/Application Support/obsidian/obsidian.json"
}

# 检查配置文件、目标目录和同步命令。
check_environment() {
  if ! command -v python3 >/dev/null 2>&1 || ! command -v rsync >/dev/null 2>&1; then
    error_echo "缺少 python3 或 rsync；请安装或修复后重试。"
    return 1
  fi
  if [[ ! -f "$OBSIDIAN_CONFIG" ]]; then
    printf '✖ 找不到 Obsidian Vault 配置：%s\n' "$OBSIDIAN_CONFIG" | tee -a "$LOG_FILE" >&2
    return 1
  fi
  if [[ ! -d "$TARGET_DIR" ]]; then
    printf '✖ 目标目录不存在：%s\n' "$TARGET_DIR" | tee -a "$LOG_FILE" >&2
    return 1
  fi
}

# 从 Obsidian 配置中解析唯一的当前打开 Vault。
resolve_source_vault() {
  SOURCE_DIR="$(python3 -c '
import json
import sys
from pathlib import Path

config = json.loads(Path(sys.argv[1]).read_text())
opened = [item["path"] for item in config.get("vaults", {}).values() if item.get("open") is True]
if len(opened) != 1:
    raise SystemExit(f"需要唯一一个 open Vault，当前找到 {len(opened)} 个")
print(opened[0])
' "$OBSIDIAN_CONFIG" 2>>"$LOG_FILE")" || {
    printf '✖ 无法从 Obsidian 配置中唯一确定当前 Vault；详情见日志。\n' | tee -a "$LOG_FILE" >&2
    return 1
  }
  if [[ ! -d "$SOURCE_DIR" ]]; then
    printf '✖ 当前 Obsidian Vault 不存在：%s\n' "$SOURCE_DIR" | tee -a "$LOG_FILE" >&2
    return 1
  fi
  SOURCE_DIR="$(cd "$SOURCE_DIR" && pwd -P)" || return 1
  TARGET_DIR="$(cd "$TARGET_DIR" && pwd -P)" || return 1
}

# 预览并执行不删除文件的单向同步。
sync_vault_memory() {
  if [[ "$SOURCE_DIR" == "$TARGET_DIR" ]]; then
    success_echo "当前打开的 Obsidian Vault 已经是目标目录，无需复制。"
    return 0
  fi

  local preview
  preview="$(rsync --archive --dry-run --itemize-changes --out-format='%i %n%L' \
    --exclude='/.obsidian/***' \
    --exclude='/.git/***' \
    --exclude='/.DS_Store' \
    "${SOURCE_DIR}/" "${TARGET_DIR}/" 2>>"$LOG_FILE")" || {
    printf '✖ 同步预览失败；详情见日志：%s\n' "$LOG_FILE" | tee -a "$LOG_FILE" >&2
    return 1
  }

  if [[ -z "$preview" ]]; then
    success_echo "目标目录已是最新，无需复制。"
    return 0
  fi

  printf '源目录：%s\n目标目录：%s\n\n变更预览：\n%s\n' \
    "$SOURCE_DIR" "$TARGET_DIR" "$preview" | tee -a "$LOG_FILE"
  read -r '?👉 按回车执行同步；按 Ctrl+C 取消：' _

  rsync --archive \
    --exclude='/.obsidian/***' \
    --exclude='/.git/***' \
    --exclude='/.DS_Store' \
    "${SOURCE_DIR}/" "${TARGET_DIR}/" 2>&1 | tee -a "$LOG_FILE"
  local exit_code=${pipestatus[1]}
  if (( exit_code != 0 )); then
    printf '✖ 同步失败，rsync 退出码：%s；日志：%s\n' "$exit_code" "$LOG_FILE" | tee -a "$LOG_FILE" >&2
    return "$exit_code"
  fi
  success_echo "同步完成；未删除目标端独有文件。日志：$LOG_FILE"
}

# 编排确认、路径解析、环境检查和同步。
main() {
  show_script_intro_and_wait || return 1 # 先说明范围并等待明确确认。
  initialize_paths || return 1 # 将目标锚定到脚本所在目录。
  check_environment || return 1 # 检查解析器、rsync、Obsidian 配置和目标目录。
  resolve_source_vault || return 1 # 动态读取当前打开的 Obsidian Vault。
  sync_vault_memory # 预览后同步，不删除目标端独有文件。
}

main "$@"
