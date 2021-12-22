# ================================================================
# Brew

function  brew-update-all() {
    brew update
    brew upgrade
    brew cleanup
    brew doctor
}

# ==============================================================================
# General

alias vim="nvim"
alias mux="tmuxinator"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias ag="sag"
alias cat="bat"

# Open vim with z argument
v() {
    if [ -n "$1" ]; then
        z $1
    fi

    nvim
}

alias ls='exa'                # ls
alias l='exa -lbF --git'      # list, size, type, git
alias ll='exa -lbGF --git'    # long list
alias llm='exa -lbGd --git --sort=modified'  # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                 # one column, just names
alias lt='exa --tree --level=2'   # tree

# ================================================================
# Git
# alias gpf='git push -f'
# alias gps='git push -o ci.skip'
# alias gpfs='git push -f -o ci.skip'
# alias gpsups='gpsup -o ci.skip'
# alias gcom='gco master'
# alias gcoml='gco master && gl'
# alias gcos='gco staging'
# alias gcosl='gco staging && gl'
# alias gbm='git branch -m'
# alias gcob='git checkout -b'
# alias gbg='git branch | grep'
# alias gcan='gc! --no-edit'
# alias gcff='gc --fixup'

# function glgo() {
#   local n=${1:-10}
#   git log --oneline -n "$n"
# }

# function gbrr() {
#   local n=${1:-10}
#   local colorize=${2:-true}
#   local current_branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
#   local normal_text=$(echo -e '\e[0m')
#   local yellow_text=$(echo -e '\e[0;33m')
#   local yellow_bg=$(echo -e '\e[7;33m')

#   if [ $colorize = true ] ; then
#     git for-each-ref --count="$n" \
#                     --sort=-committerdate refs/heads \
#                     --format=$'%(refname:short)\t%(committerdate:relative)\t%(authorname)\t%(objectname:short)' \
#         | grep "$GIT_AUTHOR_FIRST_NAME" \
#         | column -t -s $'\t' \
#         | sed -E "s:^(${current_branch}) :* ${yellow_bg}\1${normal_text} :" \
#         | sed -E "s:^([^ ]+):  ${yellow_text}\1${normal_text}:"
#   else
#     git for-each-ref --count="$n" \
#                     --sort=-committerdate refs/heads \
#                     --format=$'%(refname:short)\t%(committerdate:relative)\t%(authorname)\t%(objectname:short)' \
#         | grep "$GIT_AUTHOR_FIRST_NAME" \
#         | column -t -s $'\t' \
#         | sed -E "s:^(${current_branch}) :* \1${normal_text} :" \
#         | sed -E "s:^([^ ]+):  \1${normal_text}:"
#   fi
# }

# function gcor {
#   local n=${1:-200}
#   local branch=$(gbrr $n false | perl -pe 's/\[0m//g' | fzf | awk '{ print $1 }' | tr -cd '[:alnum:]._-')
#   gco "$branch"
# }

# function gwa {
#   if [ -z "$1" ] ; then
#     echo "Argument required"
#   else
#     cd $projectroot
#     git worktree add "../$1" "$1"
#     cd "../$1"
#     pwd
#   fi
# }

# ================================================================
# Docker

alias d="docker"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
dceas () {
    docker-compose exec app su app -c "$*"
}
alias docker-reclaim-space='docker run --privileged --pid=host docker/desktop-reclaim-space'
alias docker-raw-size='ls -lh ~/Library/Containers/com.docker.docker/Data/vms/0/Docker.raw'

# ================================================================
# Kubernetes
# alias k='kubectl'

# ==============================================================================
# Python

# ipython
alias ipy='ipython'

# poetry
# alias p="poetry"
# alias prp="poetry run python"

# conda
alias ca='conda activate'
alias cdeactivate='conda deactivate'
alias ci='conda install'
alias ce='conda env'
alias cre='conda env remove -n'
alias cl='conda list'
alias cs='conda search'
alias cce='conda-create-env'
alias cee='conda-export-env'
alias ceep='conda-export-env-pip'

function caf() {
  _env=$(cel | fzf | awk '{ print $1 }')
  ca "$_env"
}

function cel() {
  if [ -z "$1" ] ; then
    conda env list
  else
    conda env list | grep "$1" | awk -v n=1 '{print $n}'
  fi
}

# Jupyter
alias jl='jupyter lab'
alias jupyter-scaffold=". $projectroot/utils/jupyter-scaffold/scaffold.sh"
alias js="jupyter-scaffold"
alias jsa="jupyter-scaffold true true"

# ==========================
# Shell startup python config

# Enable completion for pipx
# eval "$(register-python-argcomplete pipx)"

# Enable pyenv python virtual manager
# export PATH="/Users/freddieruxton/.pyenv/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   # eval "$(pyenv virtualenv-init -)"
#   eval "$(pyenv init -)"
# fi

# export PATH="$HOME/.poetry/bin:$PATH"

# ==============================================================================
# Localstack
alias awslocal="aws --endpoint-url http://localhost:4566"
alias s3local="awslocal s3"

function s3local-sync-up() {
  s3local sync "s3-local/$1" "s3://$1"
}

function s3local-sync-down() {
  s3local sync "s3://$1" "s3-local/$1"
}

# ==============================================================================
# R
# alias Rv403="/Library/Frameworks/R.framework/Resources/bin/R"

# ==============================================================================
# Zeppelin
# alias zeppelin="$HOME/zeppelin-0.8.2-bin-all/bin/zeppelin-daemon.sh"
# alias z=zeppelin
# alias zs='z start && open http://127.0.0.1:8080'

# ================================================================
# JavaScript

# # nvm
# export NVM_DIR="$HOME/.nvm"
# # This loads nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# # This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# yarn
# alias ysd='wd fe && yarn start:dev'
# alias ytf='wd fe && yarn test-frontend'
# alias ytfw='wd fe && yarn test-frontend:watch'

# ================================================================
# Scala

export SDKMAN_DIR="/Users/freddieruxton/.sdkman"
[[ -s "/Users/freddieruxton/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/freddieruxton/.sdkman/bin/sdkman-init.sh"
