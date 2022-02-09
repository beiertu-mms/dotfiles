#-------------------------------------------------------------------------------
# Search for a folder and cd into it.
# Required:
# - arg 1 = search pattern
# - arg 2 = location
#-------------------------------------------------------------------------------
function sd() {
  local selected=$(fd -t d -E "(\.git|build|target|\.cache)" -H "$@" | fzf)
  cd "$selected" || return
}

#-------------------------------------------------------------------------------
# Search for a file and open it in nvim.
# Required:
# - arg 1 = search pattern
# - arg 2 = location
#-------------------------------------------------------------------------------
function sf() {
  local selected=$(fd -t f -E "(\.git|build|target|\.cache)" -H "$@" | fzf)
  [[ -n "$selected" ]] && nvim "$selected"
}

