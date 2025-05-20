# https://nickjanetakis.com/blog/docker-tip-81-searching-the-docker-hub-on-the-command-line
function dtags() {
  local image="${1}"
  curl --silent \
    "https://registry.hub.docker.com/v2/repositories/library/${image}/tags?page_size=1000" |
    jq -r ".results[].name" |
    sort --version-sort
}
