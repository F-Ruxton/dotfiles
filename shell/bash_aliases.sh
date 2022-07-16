# ==============================================================================
# General
alias rm="rm -i"
alias falias="alias | fzf"
alias v="vim"
alias fd="fdfind"

# ==============================================================================
# Python

alias py="python"
alias ipy="ipython"
alias pyc="python -c"

# conda
alias c="conda"
alias cdeactivate="conda deactivate"
alias ci="conda install"
alias cicf="conda install -c conda-forge"
alias cs="conda search"

alias m="mamba"
alias mi="mamba install"
alias micf="mamba install -c conda-forge"

function pick_env() {
  local env
  env=$(conda env list | fzf | awk '{ print $1 }')
  echo "$env"
}

function execute_with_env() {
  local command="$1"
  local env="$2"

  if [ -z "$env" ] ; then
    env=$(pick_env)
  fi

  eval "$command" "$env"
}

function caf() {
  execute_with_env "conda activate" "$1"
}

function maf() {
  execute_with_env "mamba activate" "$1"
}

function cer() {
  execute_with_env "conda env remove -n" "$1"
}

function ceu() {
  _file="${1:-environment.yml}"
  echo "Updating conda environment from file $_file..."
  conda env update -n "$CONDA_DEFAULT_ENV" -f "$_file"
}

function meu() {
  _file="${1:-environment.yml}"
  echo "Updating mamba environment from file $_file..."
  mamba env update -n "$CONDA_DEFAULT_ENV" -f "$_file"
}

function cec() {
  local env_name
  local python_version
  local env_file
  # create and activate a new conda environment
  if [ -z "$1" ] ; then
    echo "No name given, exiting"
    return 1
  elif [ "$1" = "-f" ] && [ -n "$2" ] ; then
    env_file="$2"
  else
    env_name="$1"
  fi

  if [ -z "$env_file" ] && [ -z "$2" ] ; then
    echo "No python version given, exiting"
    return 1
  else
    python_version="$2"
  fi

  if [ -n "$env_file" ] ; then
    echo "Creating conda environment from file: $env_file"
    conda env create -f "$env_file" "${@:3}"
  else
    echo "Creating conda environment $env_name (python=$python_version)"
    conda create --name "$env_name" python="$python_version" "${@:3}" -y
  fi

  echo "Activating environment $env_name"
  conda activate "$env_name"
}

