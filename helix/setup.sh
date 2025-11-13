#!/bin/bash

set -eufCo pipefail

TOOL="$( basename "$(dirname "$0")" )"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

pushd ~/.config/ &> /dev/null
ln -s "${SCRIPT_DIR}/.config/${TOOL}"
popd &> /dev/null
