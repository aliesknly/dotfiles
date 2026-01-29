require_command() {
  command -v "$1" >/dev/null 2>&1 || {
    log_error "Command is required: $1"
    exit 1
  }
}

install_command() {
  sudo pacman -S --noconfirm "$1" || {
    log_error "Command is required: $1"
    exit 1
  }
}

check_folder_exist() {
  [[ -d "$1" ]]
}

check_last_proccess() {
  [[ $? -eq 0 ]]
}
