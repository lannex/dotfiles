#!/usr/bin/env bash
set -euo pipefail

# 1) 모든 플러그인 순회
for plugin in $(asdf plugin list); do
  echo "▶️ 처리 중: $plugin"

  # 2) 설치된 모든 버전: '*' 제거, 앞뒤 공백 제거
  mapfile -t installed < <(asdf list "$plugin" \
    | sed -E 's/^\*//;s/^[[:space:]]+//;s/[[:space:]]+$//')

  # 3) 사용 중인 버전: asdf current 결과의 마지막 필드를 가져와 공백으로 분리
  mapfile -t used < <(asdf current "$plugin" \
    | awk '{print $NF}' \
    | tr ' ' '\n' \
    | sed -E 's/^\*//;s/^[[:space:]]+//;s/[[:space:]]+$//')

  # 4) 미사용 버전만 삭제
  for version in "${installed[@]}"; do
    # 빈 문자열 스킵
    [[ -z "$version" ]] && continue
    if [[ ! " ${used[*]} " =~ " $version " ]]; then
      echo "   • 삭제: $version"
      asdf uninstall "$plugin" "$version" || \
        echo "     ❗️ 삭제 실패(현재 버전): $version"
    fi
  done
done
