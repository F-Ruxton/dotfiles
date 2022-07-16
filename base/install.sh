#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

run_pre="${1:-true}"
run_main="${2:-true}"
run_post="${3:-true}"

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

if [ "$run_pre" = "true" ] ; then
    echo "Running common_pre.sh"
    . "$SCRIPT_DIR/_common_pre.sh" "$machine"
fi

if [ "$run_pre" = "true" ] ; then
    case "$machine" in
        Mac) script=_brew.sh;;
        Linux) script=_apt.sh;;
        *)
    esac
    echo "Running $script"
    . "$SCRIPT_DIR/$script"
fi

if [ "$run_pre" = "true" ] ; then
    echo "Running common_post.sh"
    . "$SCRIPT_DIR/_common_post.sh" "$SCRIPT_DIR"
fi

echo
echo "Finished"
