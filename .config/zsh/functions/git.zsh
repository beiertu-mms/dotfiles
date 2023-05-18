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
  if ! command -v git status &>/dev/null; then
    echo -e "${RED:-}not a git working directory${NC:-}"
    return
  fi

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
  if ! command -v git status &>/dev/null; then
    echo -e "${RED:-}not a git working directory${NC:-}"
    return
  fi

  local selected=$(_fzf_git_files --no-multi)
  [ -n "$selected" ] && $EDITOR "$selected"
}

# Usage:       gbase
# Description: Output the base branch frow where the current branch has been created.
# Link:        https://gist.github.com/joechrysler/6073741
function gbase() {
  if ! command -v git status &>/dev/null; then
    echo -e "${RED:-}not a git working directory${NC:-}"
    return
  fi

  git show-branch -a 2>/dev/null \
    | grep '\*' \
    | grep -v "$(git rev-parse --abbrev-ref HEAD)" \
    | head -n1 \
    | sed 's/.*\[\(.*\)\].*/\1/' \
    | sed 's/[\^~].*//'
}
