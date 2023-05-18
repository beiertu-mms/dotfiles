# Usage:       gen-gitignore $1
# Description: Outputs a .gitignore for given `lang` from gitignore.io to stdout.
# Params:
#   - $1: can be one language name or a list of languages separated by comma.
#         If not given, a list of available languages will be shown in fzf
#         and multiple entries can be selected with Tab or Shift-Tab.
function gen-gitignore() {
  local -r url="https://www.toptal.com/developers/gitignore/api"
  local selected
  if [[ $# == 0 ]]; then
    selected=$(curl --location --silent "$url/list" \
      | tr ',' '\n' \
      | fzf --multi \
      | tr '\n' ',' \
      | sed 's/,$//')
  else
    selected="$1"
  fi

  [[ -n "$selected" ]] && curl --location --silent "$url/$selected"
}

# Usage:       _git_check
# Description: Verify whether the current directory is a git repository.
function _git_check() {
  git rev-parse HEAD > /dev/null 2>&1 && return

  echo -e "${RED:-}Not in a git repository${NC:-}"
  return 1
}

# Usage:       gcoi
# Description: Use the function from fzf-git plugin to checkout branch.
function gcoi() {
  _git_check || return

  [[ $# > 0 ]] && echo -e "${YELLOW:-}No parameters required.${NC:-} Parameter(s) '$@' will be ignored."

  local selected=$(_fzf_git_each_ref --no-multi)
  [ -z "$selected" ] && return

  [[ "$selected" =~ '^origin/.*$' ]] \
      && git checkout --track "$selected" \
      || git checkout "$selected"
}

# Usage:       gedit
# Description: Use the function from fzf-git plugin to find and edit file.
function gedit() {
  _git_check || return

  local selected=$(_fzf_git_files --no-multi)
  [ -n "$selected" ] && $EDITOR "$selected"
}

# Usage:       gbase
# Description: Output the base branch frow where the current branch has been created.
# Link:        https://gist.github.com/joechrysler/6073741
function gbase() {
  _git_check && git show-branch -a 2>/dev/null \
    | grep '\*' \
    | grep -v "$(git rev-parse --abbrev-ref HEAD)" \
    | head -n1 \
    | sed 's/.*\[\(.*\)\].*/\1/' \
    | sed 's/[\^~].*//'
}
