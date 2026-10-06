#!/usr/bin/env zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：同步Obsidian自动任务.command
# - 核心用途：在本机 Codex 自动任务与本目录备份之间选择同步方向。
# - 影响范围：只处理 automations/<ID>/automation.toml；不删除任何文件。
# - 运行提示：选择方向后先预览；恢复时逐个处理冲突并备份将被覆盖的本机文件。

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

# 展示双向同步范围并等待用户确认。
show_script_intro_and_wait() {
  printf '\n============================== 脚本自述 ==============================\n' | jobs_intro_style title
  printf '核心用途：在本机 Codex 自动任务与本目录备份间双向同步。\n' | jobs_intro_style body
  printf '方向一：以本机自动任务为准，备份到本目录。\n' | jobs_intro_style body
  printf '方向二：以本目录备份为准，恢复到本机自动任务。\n' | jobs_intro_style body
  printf '冲突规则：恢复时遇到内容不同的本机文件，可保留本机或用备份覆盖；覆盖前会留快照。\n' | jobs_intro_style body
  printf '影响范围：只处理 automations/<ID>/automation.toml，不删除文件。\n' | jobs_intro_style body
  printf '取消方式：按 Ctrl+C 取消；日志保存在系统临时目录。\n' | jobs_intro_style body
  printf '=======================================================================\n\n' | jobs_intro_style title
  if [[ ! -t 0 ]]; then
    printf '✖ 请在终端交互运行此脚本。\n' >&2
    return 1
  fi
  read -r '?👉 已了解脚本用途，按回车继续；按 Ctrl+C 取消：' _
}

# 初始化相对目标目录和本机 Codex 自动任务目录。
initialize_paths() {
  setopt NO_NOMATCH
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd -P)" || return 1
  SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
  LOG_FILE="${TMPDIR:-.}/${SCRIPT_BASENAME}.log"
  : > "$LOG_FILE" || return 1
  BACKUP_ROOT="${SCRIPT_DIR}/automations"
  HISTORY_ROOT="${SCRIPT_DIR}/覆盖前快照"
  LOCAL_ROOT="${HOME}/.codex/automations"
  SNAPSHOT_TAG="$(date '+%Y.%m.%d_%H-%M-%S')"
}

# 检查同步依赖和需要访问的目录。
check_environment() {
  local command_name
  for command_name in find mkdir cp cmp tee date dirname basename sed; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
      error_echo "缺少命令：$command_name"
      return 1
    fi
  done
  if [[ ! -d "$BACKUP_ROOT" ]]; then
    mkdir -p "$BACKUP_ROOT" || return 1
  fi
}

# 让用户选择本机到备份或备份到本机的方向。
choose_sync_direction() {
  printf '本机自动任务目录：%s\n' "$LOCAL_ROOT"
  printf '备份目录：%s\n\n' "$BACKUP_ROOT"
  printf '1、以本机为准 → 同步到本文件夹\n'
  printf '2、以本文件夹为准 → 同步到本机\n'
  local direction
  read -r 'direction?请选择同步方向（1/2，其他输入取消）：'
  case "$direction" in
    1)
      sync_local_to_backup
      ;;
    2)
      sync_backup_to_local
      ;;
    *)
      printf '已取消，没有同步文件。\n' | tee -a "$LOG_FILE"
      ;;
  esac
}

# 以本机自动任务为准备份，并为被替换的旧备份保留快照。
sync_local_to_backup() {
  local source_file relative_path destination_file snapshot_file
  local found=0 copied=0 unchanged=0
  if [[ ! -d "$LOCAL_ROOT" ]]; then
    printf '✖ 本机 Codex 自动任务目录不存在：%s\n' "$LOCAL_ROOT" | tee -a "$LOG_FILE" >&2
    return 1
  fi
  while IFS= read -r -d '' source_file; do
    found=1
    relative_path="${source_file#"${LOCAL_ROOT}/"}"
    destination_file="${BACKUP_ROOT}/${relative_path}"
    if [[ -f "$destination_file" ]] && cmp -s "$source_file" "$destination_file"; then
      unchanged=$(( unchanged + 1 ))
      continue
    fi
    if [[ -f "$destination_file" ]]; then
      snapshot_file="${HISTORY_ROOT}/${SNAPSHOT_TAG}/${relative_path}"
      mkdir -p "$(dirname "$snapshot_file")" || return 1
      cp -p "$destination_file" "$snapshot_file" || return 1
      printf '已保留旧备份快照：%s\n' "$snapshot_file" | tee -a "$LOG_FILE"
    fi
    mkdir -p "$(dirname "$destination_file")" || return 1
    cp -p "$source_file" "$destination_file" || return 1
    copied=$(( copied + 1 ))
    printf '已备份：%s\n' "$relative_path" | tee -a "$LOG_FILE"
  done < <(find "$LOCAL_ROOT" -type f -name automation.toml -print0)

  if (( ! found )); then
    printf '✖ 本机没有找到 automation.toml 文件。\n' | tee -a "$LOG_FILE" >&2
    return 1
  fi
  success_echo "本机 → 备份完成：复制或更新 $copied 个，未变化 $unchanged 个；没有删除文件。日志：$LOG_FILE"
}

# 以备份为准恢复；每个冲突文件由用户决定，并在覆盖前备份本机版本。
sync_backup_to_local() {
  local source_file relative_path destination_file choice snapshot_file
  local found=0 copied=0 unchanged=0 kept=0
  while IFS= read -r -d '' source_file; do
    found=1
    relative_path="${source_file#"${BACKUP_ROOT}/"}"
    destination_file="${LOCAL_ROOT}/${relative_path}"
    if [[ ! -f "$destination_file" ]]; then
      mkdir -p "$(dirname "$destination_file")" || return 1
      cp -p "$source_file" "$destination_file" || return 1
      copied=$(( copied + 1 ))
      printf '已恢复新文件：%s\n' "$relative_path" | tee -a "$LOG_FILE"
      continue
    fi
    if cmp -s "$source_file" "$destination_file"; then
      unchanged=$(( unchanged + 1 ))
      printf '内容相同，跳过：%s\n' "$relative_path" | tee -a "$LOG_FILE"
      continue
    fi

    printf '\n本机文件与备份内容不同：%s\n' "$relative_path"
    printf '1、保留本机记录\n'
    printf '2、使用备份覆盖本机（覆盖前会保存本机快照）\n'
    printf 'q、取消剩余恢复\n'
    read -r 'choice?请选择（1/2/q）：'
    case "$choice" in
      1)
        kept=$(( kept + 1 ))
        printf '保留本机记录：%s\n' "$relative_path" | tee -a "$LOG_FILE"
        ;;
      2)
        snapshot_file="${HISTORY_ROOT}/${SNAPSHOT_TAG}/${relative_path}"
        mkdir -p "$(dirname "$snapshot_file")" || return 1
        cp -p "$destination_file" "$snapshot_file" || return 1
        cp -p "$source_file" "$destination_file" || return 1
        copied=$(( copied + 1 ))
        printf '已覆盖本机文件；原文件快照：%s\n' "$snapshot_file" | tee -a "$LOG_FILE"
        ;;
      q|Q)
        printf '已停止后续恢复。\n' | tee -a "$LOG_FILE"
        break
        ;;
      *)
        printf '输入无效，保留本机文件：%s\n' "$relative_path" | tee -a "$LOG_FILE"
        kept=$(( kept + 1 ))
        ;;
    esac
  done < <(find "$BACKUP_ROOT" -type f -name automation.toml -print0)

  if (( ! found )); then
    printf '✖ 备份目录中没有找到 automation.toml 文件。\n' | tee -a "$LOG_FILE" >&2
    return 1
  fi
  success_echo "备份 → 本机处理完成：新增或覆盖 $copied 个，相同 $unchanged 个，保留本机 $kept 个。日志：$LOG_FILE"
}

# 编排确认、路径检查和双向同步菜单。
main() {
  show_script_intro_and_wait || return 1 # 先说明双向操作及覆盖保护。
  initialize_paths || return 1 # 计算备份目录相对路径并准备日志。
  check_environment || return 1 # 确认本机任务目录及所需工具可用。
  choose_sync_direction # 按用户选择执行对应同步方向。
}

main "$@"
