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
  file=$(fd -t f -E "(\.git|build|target|\.cache)" -H "$@" \
    | fzf --preview-window right:50% --preview 'bat --color=always --line-range :500 {}')
  [[ -n "$file" ]] && nvim "$file"
}

