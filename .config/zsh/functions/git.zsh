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

