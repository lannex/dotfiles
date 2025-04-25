#!/usr/bin/env bash

set -e

if [ ! -f .tool-versions ]; then
  echo "[ERROR] .tool-versions not found"
  exit 1
fi

url=""

while IFS= read -r line; do
  if [[ $line =~ ^#[[:space:]]*(https?://[^[:space:]]+) ]]; then
    url="${BASH_REMATCH[1]}"
    continue
  fi

  if [[ -n "$line" && ! "$line" =~ ^# ]]; then
    plugin="$(echo "$line" | awk '{print $1}')"

    if ! asdf plugin list | grep -xq "$plugin"; then
      if [ -n "$url" ]; then
        echo "[INFO] Installing missing plugin: $plugin (from $url)"
        asdf plugin add "$plugin" "$url"
      else
        echo "[INFO] Installing missing plugin: $plugin"
        asdf plugin add "$plugin"
      fi
    fi

    url=""
  fi

done < .tool-versions

echo "[INFO] Installing all specified versions from .tool-versions"
asdf install

