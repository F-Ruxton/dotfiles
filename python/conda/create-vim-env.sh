#!/bin/zsh

# https://github.com/conda/conda/issues/7980
source ~/miniconda3/etc/profile.d/conda.sh

function create_nvim_env() {
  conda activate base
  version="$1"
  name="nvim-$version"
  conda create -n "$name" python=$version
  conda activate "$name"
  pip install neovim
  conda deactivate
}

create_nvim_env 2.7
create_nvim_env 3.10

