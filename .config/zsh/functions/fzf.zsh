#-------------------------------------------------------------------------------
# Search for a folder and cd into it.
#-------------------------------------------------------------------------------
sd() {
    cd $(fd -t d -E '.git/*' -E 'build/*' -E 'target/*' -E '.cache/*' -H "$1" $HOME | fzf)
}

#-------------------------------------------------------------------------------
# Search for a file and open it in nvim.
#-------------------------------------------------------------------------------
sf() {
    local location=$(pwd)
    if [ -n "$2" ]; then
        location="$2"
    fi
    local selected=$(fd -t f -E '.git/*' -E 'build/*' -E 'target/*' -H "$1" $location | fzf)
    [[ -n "$selected" ]] && nvim $selected
}

