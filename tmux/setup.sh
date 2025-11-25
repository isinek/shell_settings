#!/bin/bash

set -eufCo pipefail

TOOL="$( basename "$(dirname "$0")" )"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v "${TOOL}" >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    echo "Installing ${TOOL} using brew..."
    brew install "${TOOL}"
  else
    echo "Install ${TOOL} manually"
    exit
  fi
fi

mkdir -p ~/.config/tmux
pushd ~/.config/tmux/ &> /dev/null

for file in "${SCRIPT_DIR}/.config/tmux/tmux.conf"; do
  conf_file="$( basename "${file}" )"
  if [[ -e "${conf_file}" || -L "${conf_file}" ]]; then
    read -p "File already exists. Make a backup and replace it? (y/n): " answer
    if [[ "${answer}" =~ ^[Yy] ]]; then
      mv "${conf_file}" "${conf_file}.bak"
      ln -s "${file}"
    fi
  else
    ln -s "${file}"
  fi
done

git clone https://github.com/tmux-plugins/tpm ./plugins/tpm
tmux source tmux.conf

popd &> /dev/null
