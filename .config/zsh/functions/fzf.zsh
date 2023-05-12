#-------------------------------------------------------------------------------
# Search for a folder and cd into it.
#-------------------------------------------------------------------------------
function sd() {
  local selected
  selected=$(fd -t d -E .git -E target -E build -E out -E .cache -H "$@" | fzf)
  [[ -n "$selected" ]] && cd "$selected" || return 0
}

#-------------------------------------------------------------------------------
# Search for a file and open it in nvim.
#-------------------------------------------------------------------------------
function sf() {
  local selected
  selected=$(fd -t f -E .git -E target -E build -E out -E .cache -H "$@" | fzf)
    # | fzf --preview-window right:50% --preview 'bat --color=always --line-range :500 {}')
  [[ -n "$selected" ]] && $EDITOR "$selected" || return 0
}

