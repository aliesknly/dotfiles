#!/usr/bin/env bash
log() {
  local level="${1}"
  local message="{$2}"
  local log_dir
  log_dir="$(dirname "$LOG_FILE")"
  mkdir -p "$log_dir"
  echo "$(date '+%F %T') [$level] $message" >>"$LOG_FILE"
}

log_info() { log "INFO" "$1"; }
log_warn() { log "WARN" "$1"; }
log_error() { log "ERROR" "$1"; }
