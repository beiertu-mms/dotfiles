#-------------------------------------------------------------------------------
# Render a helm chart templates locally
#-------------------------------------------------------------------------------
function render-helm-template() {
  RELEASE=$(fd -t f -E 'yaml' '' ./releases | fzf)
  CHARTS=$(fd -t d -d 1 '' ./charts | fzf)
  vared -p 'Service name (template): ' NAME

  yq '.spec.values' "$RELEASE" | helm template "${NAME:-template}" "$CHARTS" -f -
}
