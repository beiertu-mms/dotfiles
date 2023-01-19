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

# Usage:       git-auto-rebase $1
# Description: Fetch and start an interactive rebase from HEAD relative to the base_branch.
# Params:
#   - $1: the base_branch or if not given, will default to 'master'.
function git-auto-rebase() {
  git fetch
  local ref=$(git merge-base HEAD "${1:-master}")
  git rebase --interactive --autosquash --autostash "$ref"
}
