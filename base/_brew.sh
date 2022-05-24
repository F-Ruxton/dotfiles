#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install moreutils  # other useful utilities like sponge
brew install findutils  # GNU find, locate, updatedb, and xargs, g-prefixed
brew install gnu-sed  # overwriting the built-in `sed`

# GNU "sed" has been installed as "gsed".
# If you need to use it as "sed", you can add a "gnubin" directory
# to your PATH from your bashrc like:
#     PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

brew install wget
brew install gnupg # Install GnuPG to enable PGP-signing commits
# Install more recent versions of some macOS tools
brew install vim
brew install neovim
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install bat
brew install exa
brew install fd
brew install fzf
brew install git
brew install git-lfs
brew install gh
brew install git-delta
brew install httpie
brew install imagemagick
brew install lua
brew install midnight-commander
brew install pigz
brew install pv
brew install rename
brew install ripgrep
brew install rlwrap
brew install ssh-copy-id
brew install tmux
brew install tree
brew install vbindiff
brew install z
brew install zopfli

# install pipx: in apt version must install using pip
brew install pipx
pipx ensurepath

# Install nerdfonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font

# zsh and plugin manager
brew install zsh
brew install zplug
ln -s "$(brew --prefix zplug)" "$HOME/.zplug"

# Remove outdated versions from the cellar.
brew cleanup
