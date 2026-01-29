#! /usr/bin/env bash

if ! require_command "git"; then
  install_command "git"
fi

git config --global user.name "Aliesky Perez"
git config --global user.email aliesky.perez@gmail.com
git config --global core.editor nvim
git config --global init.defaultBranch main
