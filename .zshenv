# XDG https://wiki.archlinux.org/title/XDG_Base_Directory
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_HOME

XDG_CACHE_HOME="$HOME/.cache"
export XDG_CACHE_HOME

XDG_STATE_HOME="$HOME/.local/state"
export XDG_STATE_HOME

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Android https://developer.android.com/studio/command-line/variables
ANDROID_USER_HOME="$HOME/.local/share/android"
export ANDROID_USER_HOME
export ANDROID_SDK_HOME="$ANDROID_USER_HOME"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Java
JAVA_USERROOT_OPT=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
JAVA_OPENJFX_OPT=-Djavafx.cachedir="$XDG_CACHE_HOME"/openjfx
_JAVA_OPTIONS="$JAVA_USERROOT_OPT $JAVA_OPENJFX_OPT"
export _JAVA_OPTIONS

# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# NVM
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Term Info
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# X11
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Less
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

