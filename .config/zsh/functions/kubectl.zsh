#-------------------------------------------------------------------------------
# Select a service to decode all its secrets.
#-------------------------------------------------------------------------------
function un-kubeseal() {

  TEMPLATE=$(cat <<-EOM
{{ range \$key, \$value := .data }}
  {{- \$key }}: {{ \$value | base64decode }}
{{ end }}
EOM
)

  kubectl get secrets "$@" -o template="$TEMPLATE"
}

#-------------------------------------------------------------------------------
# Select a service to decode all its secrets.
#-------------------------------------------------------------------------------
function un-kubeseal-fzf() {
  un-kubeseal $(kubectl get service "$@" | tail -n +2 | cut -d' ' -f1 | fzf)
}

