#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
echo "Installing bash-tools"

./update.sh

echo "bash-tools installed"

HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks
REPO_HOOKS_DIR=$SCRIPT_DIR/hooks
for hookfile in $REPO_HOOKS_DIR/*; do
  hookname=$(basename -- "$hookfile")
  ln -s $hookfile $HOOK_DIR/$hookname
done