#                           __ _ _
#      _____ __  _ __ ___  / _(_) | ___
#     |_  / '_ \| '__/ _ \| |_| | |/ _ \
#      / /| |_) | | | (_) |  _| | |  __/
#     /___| .__/|_|  \___/|_| |_|_|\___|
#         |_|

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(find "$HOME/.local/bin" -type d | tr '\n' ':' | sed 's/:$//')"

export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export FILE="lf"
export PAGER="bat --plain"
export DIFFPROG="nvim -d"
export GNUPGHOME="$HOME/.config/gnupg"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep"
# export CLOUDSDK_PYTHON="/usr/bin/python3" # set python execuable for gcloud

M2_HOME=/opt/maven
export M2_HOME

JAVA_HOME=/usr/lib/jvm/default
export JAVA_HOME

GOPATH=$HOME/data/go
GOBIN=$GOPATH/bin
export GOBIN
export GOPATH

CARGO_HOME=$HOME/.local/share/cargo
export CARGO_HOME

PATH=$PATH:$HOME/.local/bin:$M2_HOME/bin:$GOBIN:$JAVA_HOME/bin:$CARGO_HOME/bin
export PATH

export RAM_DISK_PATH="$HOME/downloads"
export BACK_UP_PATH="$HOME/data/backup"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C

# Start graphical server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

