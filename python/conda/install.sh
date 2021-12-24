#!/usr/bin/env bash

function install-conda() {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)  script=Linux;;
      Darwin*) script=MacOSX;;
      *)       script="UNKNOWN"
  esac

  if [ "$script" == "UNKNOWN" ] ; then
      echo "Unknown machine: ${unameOut}"
      echo "Exiting"
      exit
  fi

  url_base=https://repo.anaconda.com/miniconda
  script_complete="Miniconda3-latest-$script-x86_64.sh"
  url_complete="$url_base/$script_complete"
  script_dir=~/miniconda3
  script_path="$script_dir/miniconda.sh"

  pwd
  echo "Script URL = $url_complete"
  echo

  mkdir "$script_dir"
  wget "$url_complete" -O "$script_path"
  bash "$script_path" -b -u -p "$script_dir"
  "$script_dir/bin/conda" init bash
  "$script_dir/bin/conda" init zsh
}

install-conda

