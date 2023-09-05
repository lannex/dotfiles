#!/bin/bash

SOURCE_DIR=~/dotfiles

SOURCES=(nvim/lua/custom wezterm)

TARGET_DIR=~/.config

# 대상 파일 목록을 순회하며 심볼릭 링크 생성
for item in "${SOURCES[@]}"; do
  ln -s "$SOURCE_DIR/.config/$item" "$TARGET_DIR/$item"
done

