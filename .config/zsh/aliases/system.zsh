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
alias vim="nvim"

alias -g L='| bat --show-all --plain'
alias -g C='| bat --show-all --paging=never'
alias -g B='| bat --show-all'
alias -g F="| fzf"

alias -s {txt,md}='nvim'
alias -s {pdf,PDF}='zathura'

alias cp='cp --interactive --verbose --preserve'
alias mv='mv --verbose --interactive'
alias rm='rm -I --verbose --preserve-root'
alias mkdir='mkdir -v'
alias mkd='mkdir -pv'

alias gotop='gotop -l custom'

alias ktlint='ktlint --relative'

alias wget="wget --hsts-file $XDG_CONFIG_HOME/wget-hsts"
alias sbt="sbt -ivy $XDG_DATA_HOME/ivy2 -sbt-dir $XDG_DATA_HOME/sbt"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
alias vscodium="vscodium --extensions-dir $XDG_DATA_HOME/vscodium"

