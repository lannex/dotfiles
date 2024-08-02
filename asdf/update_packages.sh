#!/usr/bin/env bash

function log() {
    printf "%s %s\n" "->" "$1"
}

function update_plugins() {
    log "Updating all asdf-plugin remotes..."
    asdf plugin update --all
}

function update_tool() {
    local tool=$1
    local current_version=$2
    local latest_version=$(asdf latest $tool)
  
    echo "${tool} current version :: ${current_version}"
    echo "${tool} latest version :: ${latest_version}"

    if [[ $current_version == $latest_version ]]; then
        log "${tool} is already up-to-date."
        return
    fi

    read -p "Do you want to update ${tool}? (Y/n): " response
    if [[ $response =~ ^[Yy]$ ]]; then\
        asdf install $tool $latest_version
        asdf global $tool $latest_version
    else
        log "Skipping ${tool} update..."
    fi
}

function main() {
    update_plugins

    declare -A tools
    while IFS=" " read -r tool version; do
      tools[$tool]=$version
    done < .tool-versions

    for tool in "${!tools[@]}"; do
      update_tool "$tool" "${tools[$tool]}"
    done

    log "Done, bye! 👋"
}

main

