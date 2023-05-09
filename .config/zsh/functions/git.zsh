# Usage:       gen-gitignore $1
# Description: Outputs a .gitignore file for `lang` from gitignore.io to stdout.
# Params:
#   - $1: can be one language name or a list of languages separated by comma.
#         If not given, a list of available languages will be returned instead.
function gen-gitignore() {
  if [[ $# == 0 ]]; then
    curl --location --silent "https://www.gitignore.io/api/list"
  else
    curl --location --silent "https://www.gitignore.io/api/$1"
  fi
}

# Usage:       gco
# Description: Use the function from fzf-git plugin to checkout branch.
function gco() {
  [[ $(git rev-parse --is-inside-work-tree) == 'false' ]] && return

  if [[ $# > 0 ]]; then
    git checkout "$@"
  else
    local selected=$(_fzf_git_each_ref --no-multi)
    [ -z "$selected" ] && return

    [[ "$selected" =~ '^origin/.*$' ]] \
        && git checkout --track "$selected" \
        || git checkout "$selected"
  fi
}

# Usage:       gedit
# Description: Use the function from fzf-git plugin to find and edit file.
function gedit() {
  local selected=$(_fzf_git_files --no-multi)
  [ -n "$selected" ] && $EDITOR "$selected"
}

