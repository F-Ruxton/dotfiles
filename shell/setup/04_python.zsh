# ==============================================================================
# Python

# pipx
# enable autocompletion
# eval "$(register-python-argcomplete pipx)"

# ipython
alias py='python'
alias pyc='python -c'
alias ipy='ipython'

# ## poetry
# alias p="poetry"
# alias prp="poetry run python"

## conda
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

alias m='mamba'
alias ma='mamba activate'
alias mdeactivate='mamba deactivate'
alias mi='mamba install'
alias mee='mamba-export-env'

function caf() {
  _env=$(cel | fzf | awk '{ print $1 }')
  ca "$_env"
}

function maf() {
  _env=$(mamba env list | fzf | awk '{ print $1 }')
  mamba activate "$_env"
}

function cel() {
  if [ -z "$1" ] ; then
    conda env list
  else
    conda env list | grep "$1" | awk -v n=1 '{print $n}'
  fi
}


function conda-create-env() {
  # create and actiate a new conda environment
  if [ -z "$1" ] ; then
    echo "No name given, exiting"
    return 1
  else
    env_name="$1"
  fi

  echo "Creating conda environment $env_name..."
  conda create --name "$env_name" python=3.9 "${@:2}" -y
  echo "Activating environment $env_name..."
  conda activate "$env_name"
}

function conda-nb-kernel-from-env() {
  # create a notebook kernel from a conda enironment
  conda activate "$1"
  conda install ipykernel
  ipython kernel install --user --name="$2"
  conda deactivate "$1"
}

function conda-export-env() {
  # export in conda's native format
  env_name=$(conda info --envs | grep "\*" | awk '{print $3}' | xargs basename)
  echo "Exporting current environment $env_name"
  conda env export -f environment.yml
  pip freeze
}

function mamba-export-env() {
  # export in mamba's native format
  env_name=$(mamba info --envs | grep "\*" | awk '{print $3}' | xargs basename)
  echo "Exporting current environment $env_name"
  mamba env export -f environment.yml
}

function conda-export-env-pip() {
  # export in format compatible with pip-based installs
  env_name=$(conda info --envs | grep "\*" | awk '{print $3}' | xargs basename)
  echo "Exporting current environment $env_name in pip format"
  conda install pip
  pip freeze > requirements.txt
}

function conda-rename-env() {
  conda create --name "$2" --clone "$1"
  conda env remove --name "$1"
  conda activate "$2"
}

# Jupyter
alias jl='jupyter lab'
# alias jupyter-scaffold=". $projectroot/utils/jupyter-scaffold/scaffold.sh"
# alias js="jupyter-scaffold"
# alias jsa="jupyter-scaffold true true"

# ===================================================================
# Python Virtual Env Managers

# Enable pyenv python virtual manager
# export PATH="/Users/freddieruxton/.pyenv/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   # eval "$(pyenv virtualenv-init -)"
#   eval "$(pyenv init -)"
# fi

# export PATH="$HOME/.poetry/bin:$PATH"
