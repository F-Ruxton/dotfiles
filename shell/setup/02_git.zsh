# ================================================================
# Git
alias lg="lazygit"

function gbrr() {
  local n=${1:-10}
  local colorize=${2:-true}
  local current_branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
  local normal_text=$(echo -e '\e[0m')
  local yellow_text=$(echo -e '\e[0;33m')
  local yellow_bg=$(echo -e '\e[7;33m')

  if [ $colorize = true ] ; then
    git for-each-ref --count="$n" \
                    --sort=-committerdate refs/heads \
                    --format=$'%(refname:short)\t%(committerdate:relative)\t%(authorname)\t%(objectname:short)' \
        | grep "$GIT_AUTHOR_FIRST_NAME" \
        | column -t -s $'\t' \
        | sed -E "s:^(${current_branch}) :* ${yellow_bg}\1${normal_text} :" \
        | sed -E "s:^([^ ]+):  ${yellow_text}\1${normal_text}:"
  else
    git for-each-ref --count="$n" \
                    --sort=-committerdate refs/heads \
                    --format=$'%(refname:short)\t%(committerdate:relative)\t%(authorname)\t%(objectname:short)' \
        | grep "$GIT_AUTHOR_FIRST_NAME" \
        | column -t -s $'\t' \
        | sed -E "s:^(${current_branch}) :* \1${normal_text} :" \
        | sed -E "s:^([^ ]+):  \1${normal_text}:"
  fi
}

function gcor {
  local n=${1:-200}
  local branch=$(gbrr $n false | perl -pe 's/\[0m//g' | fzf | awk '{ print $1 }' | tr -cd '[:alnum:]._-')
  gco "$branch"
}

function gwa {
  if [ -z "$1" ] ; then
    echo "Argument required"
  else
    cd $projectroot
    git worktree add "../$1" "$1"
    cd "../$1"
    pwd
  fi
}
