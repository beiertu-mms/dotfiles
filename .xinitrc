#!/bin/sh

if [ -x "$HOME/.xprofile" ]; then
    . $HOME/.xprofile
fi

xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"
xmodmap -e "keysym Pause = Insert"

[ -x "$HOME/.local/bin/generate-git-aliases.sh" ] && $HOME/.local/bin/generate-git-aliases.sh &
[ -x "$HOME/.local/bin/webcam-setting.sh" ] && $HOME/.local/bin/webcam-setting.sh &

[ -e "$HOME/.Xresources" ] && xrdb $HOME/.Xresources &

amixer sset 'Master' 60% && amixer sset 'Capture' 100% &

numlockx &

# Set fan speed for Nvidia
# see https://www.techticity.com/howto/how-to-control-nvidia-graphics-card-fan-speed-in-linux/
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=15" &

[ ! -d "$HOME/data/git/work" ] && mkdir -p $HOME/data/git/work &
[ ! -d "$HOME/data/git/private" ] && mkdir -p $HOME/data/git/private &

compton -CGb &

# Screen layout and wallpaper
$HOME/.local/bin/screenlayout.sh && \
    feh --no-fehbg \
    --bg-fill $HOME/.config/wallpapers/bg2.jpg \
    --bg-fill $HOME/.config/wallpapers/bg.jpg &

# ----- DWM -----
# Workaround for java app to be correctly display in DWM
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

dwmblocks 2>&1 >/dev/null &
exec dwm

# ----- I3wm -----
#$HOME/.local/bin/generate-i3-config
#$HOME/.local/bin/generate-i3blocks-config
#exec i3

