# ================================================================
# Brew

# Change brew path if running on Rosetta
# See also p10k.zsh function prompt_arch
if [ "$MAC_ARCH" = "M1" ] ; then
  alias brew="/opt/homebrew/bin/brew"
else
  alias brew="/usr/local/bin/brew"
fi

function  brew-update-all() {
    brew update
    brew upgrade
    brew cleanup
    brew doctor
}

# ==============================================================================
# General

alias lkm=". ~/.config/xkb/.xprofile"
alias vim="nvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias cat="bat"

# Open vim with z argument
v() {
    if [ -n "$1" ]; then
        z $1
    fi

    vim .
}

# git flag currently disabled in ubuntu https://github.com/ogham/exa/issues/761
if exa --git > /dev/null 2>&1 ; then
  alias l='exa -lbF --git'      # list, size, type, git
  alias ll='exa -lbGF --git'    # long list
  alias llm='exa -lbGd --git --sort=modified'  # long list, modified date sort
  alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
  alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
else
  alias l='exa -lbF'      # list, size, type, git
  alias ll='exa -lbGF'    # long list
  alias llm='exa -lbGd --sort=modified'  # long list, modified date sort
  alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'  # all list
  alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale' # all + extended list
fi
alias ls='exa'                # ls
alias lS='exa -1'                 # one column, just names
alias lt='exa --tree --level=2'   # tree

alias t="task"
alias todo="conda activate vit && vit"

# ==============================================================================
# GluoNNet

# GN_SSH_USERNAME="fruxton"
# GN_SSH_IP="81.28.198.16"
# GN_SSH_DETAILS="${GN_SSH_USERNAME}@${GN_SSH_IP}"
# alias gnssh="sshpass -f ~/Documents/Credentials/GN/GNServer"
# alias gnssh-sh="gnssh ssh ${GN_SSH_DETAILS}"
# alias gnssh-jl="gnssh ssh -NL 8889:localhost:8889 ${GN_SSH_DETAILS}"

# function gnssh-cp-from() {
#   if [ -z "$2" ] ; then
#     gnssh scp "$GN_SSH_DETAILS:$1" .
#   else ;
#     gnssh scp "$GN_SSH_DETAILS:$1" "$2"
#   fi
# }
# function gnssh-cp-to() {
#   if [ -z "$1" ] ; then
#     echo "No first argument given"
#   elif [ -z "$2" ] ; then
#     gnssh scp "$1" "$GN_SSH_DETAILS:/mnt/gluoNNet-02/data/home/fruxton"
#   else ;
#     gnssh scp "$1" "$GN_SSH_DETAILS:/mnt/gluoNNet-02/data/home/fruxton/$2"
#   fi
# }

# ==============================================================================
# Sylvera
