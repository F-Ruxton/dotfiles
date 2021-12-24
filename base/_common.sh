#!/usr/bin/env bash

echo "Install common tools"

# Kitty terminal emulator
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 14  # Required for vim-coc

echo "Finished installing"
