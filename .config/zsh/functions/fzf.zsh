#-------------------------------------------------------------------------------
# Search with fd and return the selected value from fzf.
#-------------------------------------------------------------------------------
_search_with_fzf() {
  local -r selected=$(fd --color=always \
      -E .git -E target -E build -E out -E .cache \
      -H "$@" | fzf --ansi)
  echo "$selected"
}

#-------------------------------------------------------------------------------
# Search for a folder and cd into it.
#-------------------------------------------------------------------------------
function sd() {
  local -r selected=$(_search_with_fzf -t d "$@")
  [[ -n "$selected" ]] && cd "$selected" || return 0
}

#-------------------------------------------------------------------------------
# Search for a file and open it with $EDITOR.
#-------------------------------------------------------------------------------
function sf() {
  local -r selected=$(_search_with_fzf -t f "$@")
  [[ -n "$selected" ]] && $EDITOR "$selected" || return 0
}

