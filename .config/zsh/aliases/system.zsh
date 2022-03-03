alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cl='clear'

alias ls='ls -X --color'
alias ll='ls -vAlhF'
alias la='ls -vAhF'
alias ld='ls -vlhF'

alias vi='nvim'
alias nv='nvim'
alias vim="vim -u $HOME/.config/vimrc"

alias -g L='| bat --show-all --plain'
alias -g C='| bat --show-all --paging=never'
alias -g B='| bat --show-all'
alias -g F="| fzf"

alias -s {txt,sh,md}='nvim'
alias -s {pdf,PDF}='zathura'

alias cp='cp --interactive --verbose --preserve'
alias mv='mv --verbose --interactive'
alias rm='rm -I --verbose --preserve-root'
alias mkdir='mkdir -v'
alias mkd='mkdir -pv'

alias gotop='gotop -l custom'

alias wget="wget --hsts-file $HOME/.config/wget-hsts"

