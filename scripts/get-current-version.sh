#!/usr/bin/env bash

set -eu

CURRENT_VERSION="$(gh release list --limit 1 --exclude-drafts --exclude-pre-releases)"

if [[ -z "${CURRENT_VERSION}" ]]; then
    CURRENT_VERSION="v0.0.0"
fi

echo $CURRENT_VERSION
echo "current_version=$CURRENT_VERSION" >> $GITHUB_OUTPUT