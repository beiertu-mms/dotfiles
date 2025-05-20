function testregex() {
  [ "$#" -eq 1 ] || return 1
  while IFS= read -r line; do
    printf '%s\n' "$1" | grep -Eoe "$line"
  done
}
