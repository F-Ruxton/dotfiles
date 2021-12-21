#!/usr/bin/env bash

# This file is WIP and needs to be finished on a linux os

# Install command-line tools using apt

# Make sure we’re using the latest apt
apt update

# Upgrade any already-installed packages
apt upgrade

# Install GNU core utilities 
apt install coreutils
apt install moreutils  # other useful utilities like sponge
apt install findutils  # GNU find, locate, updatedb, and xargs, g-prefixed
apt install wget
apt install gnupg # Install GnuPG to enable PGP-signing commits
apt install vim
apt install neovim
apt install grep
apt install openssh
apt install screen
apt install gmp

# Install font tools.
apt tap bramstein/webfonttools
apt install sfnt2woff
apt install sfnt2woff-zopfli
apt install woff2

# Install nerdfonts - https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0
#apt tap homeapt/cask-fonts
#apt install --cask font-hack-nerd-font
#apt install font-jetbrains-mono-nerd-font

# Install other useful binaries.
apt install ack
apt install bat
apt install exa
apt install fd
apt install fzf
apt install git
apt install git-lfs
apt install gh
apt install httpie
apt install imagemagick
apt install lua
apt install pigz
apt install pv
apt install rename
apt install ripgrep
apt install rlwrap
apt install ssh-copy-id
apt install tree
apt install vbindiff
apt install z
apt install zopfli

# zsh and plugin manager
apt install zsh
apt install zplug
