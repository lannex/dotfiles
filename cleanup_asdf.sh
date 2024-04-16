#!/usr/bin/env bash

read -p "Enter the name of the tool to clean up: " tool_name

current_version=$(asdf current $tool_name | awk '{print $2}')
installed_versions=$(asdf list $tool_name)

for version in $installed_versions; do
    if [ "$version" != "$current_version" ]; then
        asdf uninstall $tool_name $version
    fi
done

echo "Cleanup complete."

