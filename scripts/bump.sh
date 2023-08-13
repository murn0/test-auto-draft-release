#!/usr/bin/env bash

set -eu

markdown_text="$1"
search_features="## 🚀 Features"
search_breaking_changes="## ⚠️ Breaking Changes"

if [[ "$markdown_text" == *"$search_features"* ]]; then
    echo "minor update"
elif [[ "$markdown_text" == *"$search_breaking_changes"* ]]; then
    echo "major update"
else
    echo "patch update"
fi
