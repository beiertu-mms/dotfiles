#                           __ _ _
#      _____ __  _ __ ___  / _(_) | ___
#     |_  / '_ \| '__/ _ \| |_| | |/ _ \
#      / /| |_) | | | (_) |  _| | |  __/
#     /___| .__/|_|  \___/|_| |_|_|\___|
#         |_|

export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERMINAL="kitty"
export BROWSER="vivaldi-stable"
export READER="zathura"
export FILE="lf"
export DELTA_PAGER="bat"
export PAGER="bat --plain"
export DIFFPROG="nvim -d"
export GNUPGHOME="$HOME/.config/gnupg"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep"
# export CLOUDSDK_PYTHON="/usr/bin/python3" # set python execuable for gcloud
export TFENV_CONFIG_DIR="$HOME/.config/tfenv"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

MAVEN_HOME=/user/share/java/maven
M2_HOME=/user/share/java/maven
export MAVEN_HOME
export M2_HOME

MAVEN_DAEMON_HOME="$HOME/.local/share/mvnd"
export MAVEN_DAEMON_HOME

JAVA_HOME=/usr/lib/jvm/default
export JAVA_HOME

GOPATH=$HOME/data/go
GOBIN=$GOPATH/bin
export GOBIN
export GOPATH

CARGO_HOME=$HOME/.local/share/cargo
export CARGO_HOME

KREW_ROOT=$HOME/.local/share/krew
export KREW_ROOT

PATH=$PATH:$MAVEN_HOME/bin:$M2_HOME/bin:$MAVEN_DAEMON_HOME/bin
PATH=$PATH:$GOBIN
PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$CARGO_HOME/bin
PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.local/share/npm/bin
export PATH

export RAM_DISK_PATH="$HOME/downloads"
export BACK_UP_PATH="$HOME/data/backup"

# See also https://git.zx2c4.com/password-store/about/
export PASSWORD_STORE_DIR="$HOME/data/github.com/beiertu-mms/pass"
export PASSWORD_STORE_GENERATED_LENGTH=21
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C

# Terminal colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export NC='\033[0m'

export XMLLINT_INDENT="    "

# Start graphical server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

