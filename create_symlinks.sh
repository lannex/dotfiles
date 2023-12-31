#!/bin/bash


create_config_symlinks() {
  local source_dir=~/dotfiles
  local target_dir=~/.config
  local config_list=(nvim/lua/custom wezterm)

  for item in "${config_list[@]}"; do
    rm -r "$target_dir/$item"
    ln -fs "$source_dir/.config/$item" "$target_dir/$item"
  done
}

create_root_symlinks() {
  local source_dir=~/dotfiles
  local target_dir=~
  local root_list=(.tool-versions .atamanrc.config .ideavimrc .zshrc)

  for item in "${root_list[@]}"; do
    ln -fs "$source_dir/$item" "$target_dir/$item"
  done
}

create_config_symlinks
create_root_symlinks
