#!/usr/bin/env bash

machine="$1"

echo "Install common tools (machine = $machine)"

if [ "$machine" == Linux ] ; then
  # Kitty terminal emulator
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  # https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux
  # Create a symbolic link to add kitty to PATH
  ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
  # Place the kitty.desktop file somewhere it can be found by the OS
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  # Update the path to the kitty icon in the kitty.desktop file
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
fi

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 14  # Required for vim-coc

echo "Finished installing"
