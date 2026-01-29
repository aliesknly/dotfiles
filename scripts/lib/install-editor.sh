#!/usr/bin/env bash

install_neovim() {
  if require_command "neovim"; then
    install_command "neovim"
  fi

  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
}
