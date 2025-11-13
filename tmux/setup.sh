#!/bin/bash

set -eufCo pipefail

TOOL="$( basename "$(dirname "$0")" )"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/tmux
pushd ~/.config/tmux/ &> /dev/null

ln -s "${SCRIPT_DIR}/.config/tmux/tmux.conf"

git clone https://github.com/tmux-plugins/tpm ./plugins/tpm
tmux source tmux.conf

popd &> /dev/null
