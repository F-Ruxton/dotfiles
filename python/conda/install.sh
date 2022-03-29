#!/usr/bin/env bash

function install-conda() {
  os_name_raw="$(uname -s)"
  machine_name="$(uname -m)"

  case "${os_name_raw}" in
      Linux*)  os_name=Linux;;
      Darwin*) os_name=MacOSX;;
      *)       os_name="UNKNOWN"
  esac

  if [ "$os_name" == "UNKNOWN" ] ; then
      echo "Unknown machine: ${os_name_raw}"
      echo "Exiting"
      exit
  fi

  url_base=https://repo.anaconda.com/miniconda
  script_complete="Miniconda3-latest-$os_name-$machine_name.sh"
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

