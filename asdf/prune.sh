#!/usr/bin/env bash

declare -i checked=0 failed=0

while IFS= read -r name; do
  (( checked+=1 ))
  asdf list "$name" \
      | sed -e '/^\s*\*/d' \
      | xargs -rt -I@ -- asdf uninstall "$name" @ \
    || (( failed+=1 ))
done < <(awk '{print $1}' .tool-versions | sort -u)

echo "checked: ${checked}"
echo " failed: ${failed}"
