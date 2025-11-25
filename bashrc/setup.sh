#!/bin/bash

set -eufCo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! grep -q ".bashrc.user" ~/.bashrc; then
  echo >> ~/.bashrc
  echo "[ -r ~/.bashrc.user ] && . ~/.bashrc.user" >> ~/.bashrc
fi

pushd ~/ &> /dev/null
for file in "${SCRIPT_DIR}/.bashrc.user" "${SCRIPT_DIR}/.bash_aliases"; do
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
popd &> /dev/null
