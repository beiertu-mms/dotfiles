#-------------------------------------------------------------------------------
# Select a secret from a service and decode its value.
#-------------------------------------------------------------------------------
function decode-secret() {
    SERVICE=$(kubectl get service | tail -n +2 | cut -d' ' -f1 | fzf)
    SECRET=$(kubectl get secret "$SERVICE" -o json | jq -r '.data | keys | .[]' | fzf)
    kubectl get secrets "$SERVICE" -o template="{{.data.$SECRET | base64decode}}"
}
