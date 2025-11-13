#!/bin/bash

set -eufCo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

pushd ~/ &> /dev/null
ln -s "${SCRIPT_DIR}/Brewfile"
brew bundle
popd &> /dev/null
