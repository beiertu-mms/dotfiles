#-------------------------------------------------------------------------------
# Search and register a command to pet.
# https://github.com/knqyf263/pet#register-the-previous-command-easily
#-------------------------------------------------------------------------------
function pet-add-prev() {
  PREV=$(fc -lrn | fzf)
  sh -c "pet new `printf %q "$PREV"`"
}

#-------------------------------------------------------------------------------
# Select a snippet from pet and output it on the shell.
# https://github.com/knqyf263/pet#select-snippets-at-the-current-line-like-c-r
#-------------------------------------------------------------------------------
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

