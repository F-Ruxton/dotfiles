# ==============================================================================
# ZSH Setup

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_CUSTOM="$HOME/.zsh-custom"
ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
    common-aliases
    debian
    docker
    docker-compose
    fzf
    git
    wd
    zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# zsh-autocomplete
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select
zstyle ':autocomplete:*' fzf-completion yes

# Uncomment the following lines to disable live history search:
# zle -A {.,}history-incremental-search-forward
# zle -A {.,}history-incremental-search-backward

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/freddieruxton/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "$HOME/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
