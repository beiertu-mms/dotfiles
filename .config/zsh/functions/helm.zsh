#-------------------------------------------------------------------------------
# Render a helm chart templates locally
#-------------------------------------------------------------------------------
function render-helm-template() {
    RELEASE=$(fd -t f -E 'yaml' '' ./releases | fzf)
    CHARTS=$(fd -t d -d 1 '' ./charts | fzf)
    vared -p 'Service name: ' -c NAME
    cat "$RELEASE" | yq .spec.values | helm template "$NAME" "$CHARTS" -f -
}
