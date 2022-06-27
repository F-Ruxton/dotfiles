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

alias falias="alias | fzf"
alias regex101="open https://regex101.com/"

alias lkm=". ~/.config/xkb/.xprofile"
alias v="lvim"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias cat="bat"

function weather() {
  local location="${1:-london}"
  curl "https://wttr.in/$location"
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

alias lg="lazygit"
alias ldc="lazydocker"

# ==============================================================================
# Sylvera
PROJECTS_DIR="$HOME/Documents/projects"
SYL_PROJECTS_DIR="$HOME/Documents/projects/sylvera"

alias tms="python $HOME/dotfiles/tmux/sessions/dev.py"

function ttm() {
    tower="$1"
    session="${2:-$tower}"

    if [[ -z "$tower" ]] ; then
        echo "Must give tower name"
    else
        ssh "$tower" -t tmux new -A -s "$session"
    fi
}

if [ -f "$SYL_PROJECTS_DIR/bash_utils/entrypoint.sh" ] ; then
    source "$SYL_PROJECTS_DIR/bash_utils/entrypoint.sh"
fi

alias tt="sync_to_tower"
alias ft="sync_from_tower"
alias rt="run_on_tower"

function lj() {
    list_jobs_on_tower $1 freddie
}

function lja() {
    echo 1: $( list_jobs_on_tower 1 freddie )
    echo 2: $( list_jobs_on_tower 2 freddie )
    echo 3: $( list_jobs_on_tower 3 freddie )
    echo 4: $( list_jobs_on_tower 4 freddie )
}
