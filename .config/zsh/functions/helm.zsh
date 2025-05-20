#-------------------------------------------------------------------------------
# Render a helm chart templates locally
#-------------------------------------------------------------------------------
function render-helm-template() {
  RELEASE=$(fd -t f -E 'yaml' '' ./releases | fzf)
  CHARTS=$(fd -t d -d 1 '' ./charts | fzf)
  local release_file="${RELEASE##*/}"

  yq '.spec.values' "$RELEASE" |
    helm template "${release_file%.yaml}" "$CHARTS" -f -
}
