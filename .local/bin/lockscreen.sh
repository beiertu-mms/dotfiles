#!/usr/bin/env bash
#===============================================================================
#
#          FILE: lockscreen.sh
#
#         USAGE: ./lockscreen.sh
#
#   DESCRIPTION: Used by i3 to lock the workspace.
#
#  REQUIREMENTS: i3lock-color(AUR) - https://github.com/Raymo111/i3lock-color
#        AUTHOR: tung beier
#       CREATED: 21 August 2019 20:29 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails


#---  SCRIPT LOGIC  ------------------------------------------------------------
readonly BLANK='#00000000'
readonly CLEAR='#ffffff22'
readonly DEFAULT='#ff00ffcc'
readonly TEXT='#ee00eeee'
readonly WRONG='#880000bb'
readonly VERIFYING='#bb00bbbb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 10                    \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
