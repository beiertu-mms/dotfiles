#!/usr/bin/env bash
#===============================================================================
#
#          FILE: change-keymap.sh
#
#         USAGE: ./change-keymap.sh
#
#   DESCRIPTION: Make Caps_Lock a second Escape and Pause a second Insert.
#
#        AUTHOR: tung beier
#       CREATED: 01 April 2021 17:40 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

key_configs=(
    "clear lock"
    "keysym Caps_Lock = Escape"
    "keysym Pause = Insert"
    )

for config in "${key_configs[@]}"; do
    xmodmap -e "$config"
done

