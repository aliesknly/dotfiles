#! /usr/bin/dev bash
original_backup_config_menu() {
  echo "================================="
  echo "     Backup Original Config      "
  echo "================================="
  echo "1) \$HOME"
  echo "2) .config"
  echo "0) Go back"
  echo "---------------------------------"
}

read_menu_option() {
  read -rp "Select root folder: " -a destiny
}

backup_function() {

  #  list of app to backup
  local list_app_folder=("${LIST_APPS[@]}")
  # Folder where going to save
  local backup_directory="$BACKUP_DIR"

  # Create the backup folder if not exist
  if ! check_folder_exist "$backup_directory"; then
    mkdir -p $backup_directory
  fi

  do_backup() {
    # $1 -> Root config
    for app in "${list_app_folder[@]}"; do
      if ! check_folder_exist "${1}/${app}"; then
        log_warn "The folder \"${1}/${app}\" folder not exist."
      else
        cp -r "${1}/${app}" "$backup_directory"
        log_info "The backup \"${app}\": success."
      fi
    done
  }

  while true; do
    original_backup_config_menu
    read_menu_option

    case $destiny in
    1) do_backup "$HOME" ;;
    2) do_backup "$HOME/.config" ;;
    0) break ;;
    esac
    echo
  done

}
