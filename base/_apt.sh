#!/usr/bin/env bash

# Install command-line tools using apt
function ai() {
  # -qq makes install less noisy
  sudo apt install -y -qq "$@"
}

# Make sure we’re using the latest apt
sudo apt -qq update

# Upgrade any already-installed packages
sudo apt upgrade

ai coreutils # install GNU core utilities
ai moreutils  # other useful utilities like sponge
ai findutils  # GNU find, locate, updatedb, and xargs, g-prefixed
ai wget
ai gnupg # install GnuPG to enable PGP-signing commits
ai grep
ai screen
ai libgmp3-dev
ai ack
ai bat
ai exa

# Install, link fdfind as fd
ai fd-find
ln -s $(which fdfind) ~/.local/bin/fd

ai fzf
ai git

# git-delta, a syntax-highlighting pager for git and diff output; TODO watch for update: https://github.com/dandavison/delta#installation
arch=$([[ $(uname -m) == "x86_64" ]] && echo "amd64" || echo "armhf")
musl=$([[ $(lsb_release -r | cut -f2) == "20.04" ]] && echo "" || echo "-musl") # https://github.com/dandavison/delta/issues/504
curl -fsSL https://github.com/dandavison/delta/releases/download/0.11.0/git-delta${musl}_0.11.0_$arch.deb -o /tmp/git-delta_$arch.deb && sudo dpkg -i /tmp/git-delta_$arch.deb

ai git-lfs
ai gh
ai httpie
ai imagemagick
ai lua5.4
ai pigz
ai pv
ai rename
ai ripgrep
ai rlwrap
ai tree
ai vbindiff
ai zopfli

# install up-to-date neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# zsh and plugin manager
ai zsh
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install fonts
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# Cleanup
sudo apt autoclean
