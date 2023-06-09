#!/usr/bin/env bash

set -eu

BUMP_LEVEL=$1
CURRENT_VERSION="$(gh release list --limit 1 --exclude-drafts --exclude-pre-releases)"

if [[ "${CURRENT_VERSION}" == "" ]]; then
    CURRENT_VERSION="v0.0.0"
fi
echo $CURRENT_VERSION
semver bump $1 $CURRENT_VERSION