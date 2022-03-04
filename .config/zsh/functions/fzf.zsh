#-------------------------------------------------------------------------------
# Search for a folder and cd into it.
# Required:
# - arg 1 = search pattern
# - arg 2 = location
#-------------------------------------------------------------------------------
function sd() {
  local directory
  directory=$(fd -t d -E "(\.git|build|target|\.cache)" -H "$@" | fzf)
  cd "$directory" || return
}

#-------------------------------------------------------------------------------
# Search for a file and open it in nvim.
# Required:
# - arg 1 = search pattern
# - arg 2 = location
#-------------------------------------------------------------------------------
function sf() {
  local file
  file=$(fd -t f -E "(\.git|build|target|\.cache)" -H "$@" | fzf)
  [[ -n "$file" ]] && nvim "$file"
}

#-------------------------------------------------------------------------------
# Get all git branches and select one of them to check it out.
#-------------------------------------------------------------------------------
function gco-fzf() {
  git rev-parse HEAD > /dev/null 2>&1 || return

  local branch=$(git branch --color=always --all | grep -v HEAD \
    | fzf --ansi --no-multi | sed "s/.* //")

  [[ -n "$branch" ]] || return 0

  if [[ "$branch" = 'remotes/'* ]]; then
    git checkout --track "$branch"
  else
    git checkout "$branch"
  fi
}
