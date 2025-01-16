#!/bin/bash

source_dir=~/dotfiles

create_config_symlinks() {
  local target_dir=~/.config
  local config_list=(nvim/lua/custom wezterm zed zellij ghostty)

  for item in "${config_list[@]}"; do
    rm -r "$target_dir/$item"
    ln -fs "$source_dir/.config/$item" "$target_dir/$item"
  done
}

create_root_symlinks() {
  local target_dir=~
  local root_list=(.atamanrc.config .ideavimrc .zshrc)

  for item in "${root_list[@]}"; do
    ln -fs "$source_dir/$item" "$target_dir/$item"
  done
}

create_asdf_symlink() {
  local dir=asdf
  local file=.tool-versions
  rm -r "$HOME/$file"
  ln -fs "$source_dir/$dir/$file" "$HOME/$file"
}

create_hammerspoon_symlink() {
  local dir=.hammerspoon
  rm -r "$HOME/$dir"
  ln -fs "$source_dir/$dir" "$HOME/$dir"
}

create_config_symlinks
create_root_symlinks
create_asdf_symlink
create_hammerspoon_symlink
