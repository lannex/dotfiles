#!/usr/bin/env bash

function log() {
    printf "%s %s\n" "->" "$1"
}

function update_plugins() {
    log "Updating all asdf-plugin remotes..."
    asdf plugin update --all
}

function update_tool_versions() {
    log "Updating each plugin reference to the latest revision..."
    local temp_file=".tool-versions.new"
    local backup_file=".tool-versions.bk"

    while read -r plugin; do
        echo "$plugin $(asdf latest $plugin)"
    done < <(awk '{print $1}' .tool-versions) > "$temp_file"

    cp .tool-versions "$backup_file"
    mv "$temp_file" .tool-versions
}

function print_diff() {
    log "Old revision versions:"
    cat .tool-versions.bk
    log "New revision versions:"
    cat .tool-versions
}

function prompt_install() {
    while true; do
        read -p "Do you wish to install all new revisions?" yn
        case $yn in
            [Yy]* ) asdf install; break;;
            [Nn]* ) exit;;
            * ) log "Please answer Yes or No.";;
        esac
    done
}

function main() {
    update_plugins
    update_tool_versions
    print_diff
    prompt_install

    rm -rf .tool-versions.bk
    log "Done, bye! 👋"
}

main

