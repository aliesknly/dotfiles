#!/usr/bin/env bash

run_ui() {
  show_menu() {
    echo "================================="
    echo "            MAIN MENU            "
    echo "================================="
    echo "1) Install neovim editor"
    echo "2) Create a backup original apps"
    echo "3) Restore my own config"
    echo "4) Update Archlinux"
    echo "5) Add config app(s) to my config"
    echo "6) Install nerd font (IosevkaTerm)"
    echo "0) Exit"
    echo "---------------------------------"
  }

  read_option() {
    read -rp "Select (1-7) or 0 to exit: " option
  }

  while true; do
    show_menu
    read_option

    case $option in
    1) install_neovim ;;
    2) backup_function ;;
    3) restore_my_own_config ;;
    4) sudo pacman -Suy --noconfirm ;;
    5) add_config_to_my_dots ;;
    6) install_nerd_fonts ;;
    0)
      echo "Good bye"
      break
      ;;
    *) echo "Invalid option" ;;
    esac
    echo
  done
}
