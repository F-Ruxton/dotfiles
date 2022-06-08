#!/usr/bin/env bash

SCRIPT_DIR="$1"

# install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
mv ~/.config/lvim  "$SCRIPT_DIR/../lvim"

