# ==============================================================================
# Python

# pipx
# enable autocompletion: requires
#   autoload -U bashcompinit
#   bashcompinit
eval "$(register-python-argcomplete pipx)"

# export PATH="$HOME/.poetry/bin:$PATH"

# for pipx
export PATH="$PATH:/Users/freddieruxton/.local/bin"

alias pyc='python -c'

function py() {
  if ! command -v ipython &> /dev/null
  then
    python
  else
    ipython
  fi
}

## poetry
alias p="poetry"
alias pa="poetry add"
alias pad="poetry add --dev"
alias prp="poetry run python"

## conda
alias c='conda'
alias cdeactivate='conda deactivate'
alias ci='conda install'
alias cs='conda search'

alias m='mamba'
alias mdeactivate='mamba deactivate'
alias mi='mamba install'

function pick_env() {
  local _env=$(conda env list | fzf | awk '{ print $1 }')
  echo "$_env"
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

function cce() {
  # create and activate a new conda environment
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

  echo "Creating conda environment $_env_name (python=$_python_version, MAC_ARCH=$MAC_ARCH)"

  if [ "$MAC_ARCH" = "M1" ] ; then
    conda create --name "$_env_name" python="$_python_version" "${@:3}" -y
  else
    CONDA_SUBDIR=osx-64 conda create --name "$_env_name" python="$_python_version" "${@:3}" -y
  fi

  echo "Activating environment $_env_name"

  if [ "$MAC_ARCH" = "M1" ] ; then
    conda activate "$_env_name"
  else
    conda activate "$_env_name"
    conda env config vars set CONDA_SUBDIR=osx-64
    conda deactivate
    conda activate "$_env_name"

    echo "Running OS checks..."
    python -c "import platform;print(platform.machine())"
    echo "CONDA_SUBDIR: $CONDA_SUBDIR"
  fi
}

function conda-nb-kernel-from-env() {
  # create a notebook kernel from a conda enironment
  conda activate "$1"
  conda install ipykernel
  ipython kernel install --user --name="$2"
  conda deactivate "$1"
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

