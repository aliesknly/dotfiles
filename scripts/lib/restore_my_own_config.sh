#! /usr/bin/env bash
use_stow_to_restore() {
  stow -d "$DOT_FOLDER" -t "$HOME" "$1"
}

restore_my_own_config() {
  local list_app=("${LIST_APPS[@]}")

  for pkg in "${list_app[@]}"; do
    use_stow_to_restore "$pkg"
    log_info "Restore: $pkg"
  done

}
