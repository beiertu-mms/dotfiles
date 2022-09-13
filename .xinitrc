#!/usr/bin/env bash

if [ -x "$HOME/.xprofile" ]; then
    # shellcheck disable=SC1091
    source "$HOME"/.xprofile
fi

[ -x "$HOME/.local/bin/change-keymap.sh" ] && "$HOME"/.local/bin/change-keymap.sh &
[ -x "$HOME/.local/bin/generate-git-aliases.sh" ] && "$HOME"/.local/bin/generate-git-aliases.sh &

[ -e "$HOME/.Xresources" ] && xrdb "$HOME"/.Xresources &

numlockx &

[ ! -d "$HOME/data/git/work" ] && mkdir -p "$HOME"/data/git/work &
[ ! -d "$HOME/data/git/private" ] && mkdir -p "$HOME"/data/git/private &

compton -CGb &

# Screen layout and wallpaper
"$HOME"/.local/bin/screenlayout.sh && \
    feh --no-fehbg \
    --bg-fill "$HOME"/.config/wallpapers/bg2.jpg \
    --bg-fill "$HOME"/.config/wallpapers/bg.jpg &

if [[ $(hostname) == "t480" ]]; then
  amixer sset 'Master' 0% &
  amixer sset 'Capture' 0% &

  exec i3
else
  amixer sset 'Master' 100% &
  amixer sset 'Capture' 100% &

  # Workaround for jvm app to be correctly display in DWM
  export _JAVA_AWT_WM_NONREPARENTING=1
  export AWT_TOOLKIT=MToolkit
  wmname LG3D

  dwmblocks > /dev/null 2>&1 &
  exec dwm
fi

