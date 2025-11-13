#!/bin/bash

set -eufCo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ${#@} -eq 0 ]; then
  echo "usage: ${SCRIPT_DIR}/setup.sh <tool [tool [...]]>"
  echo "tools:"
  for tool_path in $( find "${SCRIPT_DIR}/" -maxdepth 1 -type d -exec basename {} \; | sort | grep -vP "^(dotfiles|\.)" ); do
    echo "  ${tool_path}"
  done
  exit
fi

TOOLS=($@)

for tool in "${TOOLS[@]}"; do
  if [ ! -d "${SCRIPT_DIR}/${tool}" ]; then
    echo "missing setup for '${tool}'"
    continue
  fi

  echo "setup ${tool}"
  ${SCRIPT_DIR}/${tool}/setup.sh
done
