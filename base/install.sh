#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)  machine=Linux;;
    Darwin*) machine=Mac;;
    *)       machine="UNKNOWN"
esac

if [ "$machine" == "UNKNOWN" ] ; then
    echo "Unknown machine: ${unameOut}"
    echo "Exiting"
    exit
fi

echo "Machine OS = ${machine}"

. "$SCRIPT_DIR/_common.sh" "$machine"

case "$machine" in
    Mac) script=_brew.sh;;
    Linux) script=_apt.sh;;
    *)
esac

. "$SCRIPT_DIR/$script"

echo
echo "Finished"
