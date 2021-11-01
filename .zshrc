#
# Copyright (c) 2021-present Tung Beier
# License: MIT
#
#+++++++++++++++++++++++++++++++#
#     Environment Variables     #
#+++++++++++++++++++++++++++++++#
export TERMINAL="st"
export TERM="st-256color" # 256 color schemes support

export FLUX_FORWARD_NAMESPACE=gitops

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="
--info=inline
--multi
--preview-window=:hidden
--preview 'bat {-1} --color=always'
--prompt='$ ' --pointer='▶' --marker='✗'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
"

#+++++++++++++++++++#
#     Variables     #
#+++++++++++++++++++#
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=15"

HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.config/zsh/history

#+++++++++++++++++#
#     Options     #
#+++++++++++++++++#
# see zsh.sourceforge.net/Doc/Release/Options.html
setopt no_beep
setopt auto_cd
setopt pushd_ignore_dups
setopt append_history
setopt bang_hist
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history
setopt auto_menu
unsetopt menu_complete

#++++++++++++++++++++#
#     Completion     #
#++++++++++++++++++++#
autoload -U compinit && compinit -d ~/.config/zsh/zcompdump
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

#++++++++++++++++++++#
#     Keybinding     #
#++++++++++++++++++++#
bindkey -v # vi key binding
export KEYTIMEOUT=1 # minimize delay

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -v '^?' backward-delete-char # fix a bug for backward key when change mode

bindkey '^R' history-incremental-search-backward
bindkey '^ ' autosuggest-accept

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#++++++++++++++++#
#     ZStyle     #
#++++++++++++++++#
# ssh-agent
case `hostname` in
    node202)
        zstyle :omz:plugins:ssh-agent identities id_rsa-mms id_rsa-tungbeier
        ;;
    *)
        zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_github_mms
        zstyle :omz:plugins:ssh-agent lifetime 1h
        ;;
esac

#++++++++++++++++++#
#     Sourcing     #
#++++++++++++++++++#
local alias_dir=$HOME/.config/alias
if [ -d ${alias_dir} ]; then
    for f in ${alias_dir}/*; do
        source ${f}
    done
fi

local files_to_source=(
    "$HOME/.config/proxy"
    # Google Cloud SDK.
    "$HOME/.local/share/google-cloud-sdk/path.zsh.inc"
    "$HOME/.local/share/google-cloud-sdk/completion.zsh.inc"
    # Zsh plugins
    "$HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
    "$HOME/.local/share/zsh-completions/zsh-completions.plugin.zsh"
    "$HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    "$HOME/.local/share/zsh-ssh-agent/ssh-agent.plugin.zsh"
)
for file in ${files_to_source[@]}; do
    [ -f "${file}" ] && source "${file}"
done

#+++++++++++++++++++#
#     Functions     #
#+++++++++++++++++++#
sd() { cd $(fd -t d -E '.git/*' -E 'build/*' -E 'target/*' -H "$1" $HOME | fzf) ; }
sf() {
    local location=$(pwd)
    if [ -n "$2" ]; then
        location="$2"
    fi
    local selected=$(fd -t f -E '.git/*' -E 'build/*' -E 'target/*' -H "$1" $location | fzf)
    [[ -n "$selected" ]] && nvim $selected
}

#++++++++++++++#
#     Eval     #
#++++++++++++++#
# dircolors
[ -e "$HOME/.config/dir_colors" ] && eval $(dircolors $HOME/.config/dir_colors)

# z.lua
if [ -x $HOME/.local/share/z.lua/z.lua ]; then
    export _ZL_DATA=$HOME/.config/zluadata
    export _ZL_ADD_ONCE=1
    export _ZL_MATCH_MODE=1
    export _ZL_HYPHEN=1
    eval "$(lua $HOME/.local/share/z.lua/z.lua --init zsh)"
fi

# Starship prompt
eval "$(starship init zsh)"

