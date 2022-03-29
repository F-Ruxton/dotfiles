# ==============================================================================
# Python

# pipx
# enable autocompletion: requires
#   autoload -U bashcompinit
#   bashcompinit
eval "$(register-python-argcomplete pipx)"

# ipython
alias py='python'
alias pyc='python -c'
alias ipy='ipython'

## poetry
alias p="poetry"
alias pa="poetry add"
alias pad="poetry add --dev"
alias prp="poetry run python"

## conda
alias c='conda'
alias ca='conda activate'
alias cdeactivate='conda deactivate'
alias ci='conda install'
alias ce='conda env'
alias cre='conda env remove -n'
alias cl='conda list'
alias cs='conda search'
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

function cce() {
  # create and actiate a new conda environment
  if [ -z "$1" ] ; then
    echo "No name given, exiting"
    return 1
  else
    _env_name="$1"
  fi

  if [ -z "$2" ] ; then
    echo "No python version given, exiting"
    return 1
  else
    _python_version="$2"
  fi

  echo "Creating conda environment $env_name..."
  conda create --name "$_env_name" python="$_python_version" "${@:3}" -y
  echo "Activating environment $_env_name ($_python_version)..."
  cdeactivate
  conda activate "$_env_name"
}

function ceu() {
  _file="${1:-environment.yml}"
  echo "Updating conda environment from file $_file..."
  conda env update -f "$_file"
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

# ===================================================================
# Python Virtual Env Managers

# Enable pyenv python virtual manager
# export PATH="/Users/freddieruxton/.pyenv/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   # eval "$(pyenv virtualenv-init -)"
#   eval "$(pyenv init -)"
# fi

# export PATH="$HOME/.poetry/bin:$PATH"
