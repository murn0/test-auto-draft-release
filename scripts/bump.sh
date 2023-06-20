#!/usr/bin/env bash

set -eu

input_string="$1"

# 引数として渡された文字列が空の場合、デフォルトとして "patch" を設定する
if [ -z "$input_string" ]; then
    exit 1
else
    output_string=$(echo "$input_string" | tr '\n' ' ')
    # 文字列内にキーワードが存在するかチェックし、該当する優先度を設定する
    if [[ $output_string =~ "breaking-change" ]]; then
        priority="major"
    elif [[ $output_string =~ "enhancement" || $output_string =~ "feature" ]]; then
        priority="minor"
    elif [[ $output_string =~ "fix" ]]; then
        priority="patch"
    else
        priority="patch"  # どのキーワードも含まれなかった場合のデフォルト
    fi
fi

echo "$priority"
