#!/usr/bin/env bash
#===============================================================================
#
#          FILE: lockscreen.sh
#
#         USAGE: ./lockscreen.sh
#
#   DESCRIPTION: Used by i3 to lock the workspace.
#
#  REQUIREMENTS: i3lock-color(AUR)
#                scrot
#                imagemagick
#        AUTHOR: tung beier
#       CREATED: 21 August 2019 20:29 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails


#---  SCRIPT LOGIC  ------------------------------------------------------------
readonly IMAGE="$HOME/.config/wallpapers/lockscreen.png"

# take the screenshot
#scrot --quality 25 --silent "$IMAGE"
# blur the image
#convert "$IMAGE" -blur 0x2 "$IMAGE"

readonly BLANK='#00000000'     # blank
readonly CLEAR_ISH='#ffffff22' # clear ish
readonly DEFAULT='#eee8d5ff'   # default
readonly TEXT='#002b36ff'      # text
readonly WRONG='#dc322fff'     # wrong
readonly VERIFYING='#b58900ff' # verifying

i3lock --image "$IMAGE" \
  --nofork \
  --tiling \
  --ignore-empty-password \
  --show-failed-attempts \
  --insidevercolor="$CLEAR_ISH" \
  --ringvercolor="$VERIFYING" \
  \
  --insidewrongcolor="$CLEAR_ISH" \
  --ringwrongcolor="$WRONG" \
  \
  --insidecolor="$BLANK" \
  --ringcolor="$DEFAULT" \
  --linecolor="$BLANK" \
  --separatorcolor="$DEFAULT" \
  \
  --verifcolor="$TEXT" \
  --wrongcolor="$TEXT" \
  --layoutcolor="$TEXT" \
  --keyhlcolor="$WRONG" \
  --bshlcolor="$WRONG" \
  \
  --radius=65 \
  --ring-width=40 \
  --veriftext="" \
  --wrongtext="" \
  --noinputtext="" \
  --screen 1 \

#rm -f /tmp/screen*.png
