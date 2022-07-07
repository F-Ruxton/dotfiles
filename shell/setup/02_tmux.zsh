
alias tms="python $HOME/dotfiles/tmux/sessions/dev.py"

function ttm() {
    tower="$1"
    session="${2:-$tower}"

    if [[ -z "$tower" ]] ; then
        echo "Must give tower name"
    else
        ssh "$tower" -t tmux new -A -s "$session"
    fi
}

function tmux_pick_session() {
    session=$(tl | awk -F ':' '{ print $1 }' | fzf)
    echo "$session"
}

function taf() {
    session="$1"

    if [[ -z "$session" ]] ; then
        session=$(tmux_pick_session)
    fi

    ta "$session"
}

