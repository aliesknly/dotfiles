#! /usr/bin/env bash
add_config_menu() {
  echo "================================="
  echo "      Add config to my dots      "
  echo "================================="
  echo "1) \$HOME"
  echo "2) .config"
  echo "0) Go back"
  echo "---------------------------------"
}

read_add_menu_option() {
  read -rp "Where is the config(1 or 2): " -a option
}

add_config_to_my_dots() {

  local destiny=()

  run_add_config_to_my_dots() {

    read -p "Config folder (space separated): " -a destiny
    local my_array=("${destiny[@]}")

    local stow_folder="$DOT_FOLDER"

    for pkg in "${my_array[@]}"; do

      local inverse_path="$stow_folder/${pkg}/${1}"
      local convined_path_app="$HOME/$1/$pkg"

      if [[ -n "$1" ]]; then
        if ! check_folder_exist "$convined_path_app"; then
          log_error "$convined_path_app not exist"
        else
          mkdir -p "$inverse_path"
          log_info "Created folder: ${inverse_path}"

          if check_folder_exist "${inverse_path}"; then
            mv "$convined_path_app" "$inverse_path"
            log_info "Moved folder: ${inverse_path}"

            if check_folder_exist "$stow_folder/$pkg"; then
              use_stow_to_restore "$pkg"
              log_info "Linked: ${pkg}"
            else
              log_error "Stow $pkg"
            fi
          else
            log_error "Moved folder: ${inverse_path}"
          fi
        fi
      fi

    done
  }

  while true; do
    add_config_menu
    read_add_menu_option

    case $option in
    1) run_add_config_to_my_dots "" ;;
    2) run_add_config_to_my_dots ".config" ;;
    0) break ;;
    esac
    echo
  done

}
