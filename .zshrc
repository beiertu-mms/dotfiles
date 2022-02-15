#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# Copyright (c) 2021-present Tung Beier
# License: MIT
#
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Environment Variables                                                    #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
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

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Variables                                                                #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.config/zsh/history

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Options                                                                  #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
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

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Completion                                                               #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
fpath=(~/.config/zsh/completion $fpath)

autoload -U compinit && compinit -d ~/.config/zsh/zcompdump
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Keybinding                                                               #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
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

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     SSH-Agent                                                                #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
zstyle :omz:plugins:ssh-agent lazy yes

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Files sourcing                                                           #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
function () {
  local SOURCES=(
    "$HOME/.config/zsh/aliases"
    "$HOME/.config/zsh/functions"
    "$HOME/.config/proxy"
    # Google Cloud SDK.
    "$HOME/.local/share/google-cloud-sdk/path.zsh.inc"
    "$HOME/.local/share/google-cloud-sdk/completion.zsh.inc"
    # Ssh agent from oh-my-zsh
    "$HOME/.local/share/zsh/plugins/ssh-agent/ssh-agent.plugin.zsh"
    )
  local SOURCE
  for SOURCE in "${SOURCES[@]}"; do
    [ -e "$SOURCE" ] || continue
    [ -f "$SOURCE" ] && source "$SOURCE" && continue
    [ -d "$SOURCE" ] && for FILE in "$SOURCE"/*.zsh; do source "$FILE"; done && continue
  done
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Plugins                                                                  #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
function () {
  local PLUGINS=(
    "skywind3000/z.lua"
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
    "zsh-users/zsh-completions"
    )
  local PLUGIN
  for PLUGIN in "${PLUGINS[@]}"; do
    local PLUGIN_NAME=$(echo "$PLUGIN" | cut -d"/" -f2)
    local PLUGIN_DIR="${HOME}/.local/share/zsh/plugins/${PLUGIN_NAME}"

    if [ -d "$PLUGIN_DIR" ]; then 
      source "${PLUGIN_DIR}/${PLUGIN_NAME}.plugin.zsh" || \
        source "${PLUGIN_DIR}/${PLUGIN_NAME}.zsh"
    else
      git clone "https://github.com/${PLUGIN}.git" "$PLUGIN_DIR"
    fi
  done
}
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Z.lua                                                                    #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
function () {
  local ZLUA_EXE="$HOME"/.local/share/zsh/plugins/z.lua/z.lua
  if [ -x "$ZLUA_EXE" ]; then
    export _ZL_DATA="$HOME"/.config/zluadata
    export _ZL_ADD_ONCE=1
    export _ZL_MATCH_MODE=1
    export _ZL_HYPHEN=1
    eval "$(lua $ZLUA_EXE --init zsh)"
  fi
}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Dir colors                                                               #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
[ -e "$HOME/.config/dir_colors" ] && eval $(dircolors $HOME/.config/dir_colors)

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Starship prompt                                                          #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
eval "$(starship init zsh)"

