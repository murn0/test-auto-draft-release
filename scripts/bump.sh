#!/usr/bin/env bash

set -eu

input_string="$1"

# 引数として渡された文字列が空の場合、デフォルトとして "patch" を設定する
if [ -z "$input_string" ]; then
    exit 1
else
    # 文字列内にキーワードが存在するかチェックし、該当する優先度を設定する
    if echo "$input_string" | grep -q "breaking-change"; then
        priority="major"
    elif echo "$input_string" | grep -qE "enhancement|feature"; then
        priority="minor"
    elif echo "$input_string" | grep -q "fix"; then
        priority="patch"
    else
        priority="patch"  # どのキーワードも含まれなかった場合のデフォルト
    fi
fi

echo "$priority"
