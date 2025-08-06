#!/bin/bash

dotfiles_dir=~/dotfiles

create_config_symlinks() {
  local target_dir=~/.config
  local config_list=(
    # nvim/lua/custom
    nvim
    wezterm
    zed
    zellij
    ghostty
    mise
    )

  for item in "${config_list[@]}"; do
    rm -r "$target_dir/$item"
    ln -fs "$dotfiles_dir/.config/$item" "$target_dir/$item"
  done
}

create_root_symlinks() {
  local target_dir=~
  local root_list=(.atamanrc.config .ideavimrc .zshrc .terraformrc)

  for item in "${root_list[@]}"; do
    ln -fs "$dotfiles_dir/$item" "$target_dir/$item"
  done
}

create_dropbox_symlink() {
  local target_dir=~
  local dropbox_list=(
    .cursor
  )

  for item in "${dropbox_list[@]}"; do
    rm -r "$target_dir/$item"
    ln -fs "$HOME/Dropbox/$item" "$target_dir/$item"
  done
}

create_config_symlinks
create_root_symlinks
create_dropbox_symlink
