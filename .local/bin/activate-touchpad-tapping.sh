#!/usr/bin/env bash
#===============================================================================
#
#          FILE: activate-touchpad-tapping.sh
#
#         USAGE: ./activate-touchpad-tapping.sh
#
#   DESCRIPTION: Enable tapping for the touchpad.
#
#        AUTHOR: tung beier
#       CREATED: 21 August 2019 19:15 CEST
#===============================================================================

set -o errexit # Exit when a command fails
# Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

#---  SCRIPT LOGIC  ------------------------------------------------------------
touchpad_id=$(xinput --list | grep -oP 'Synaptics.*id=\K.*?(?=\s)')

tapping_string=$(xinput list-props "$touchpad_id" | grep 'Tapping Enabled (')
is_tapping_enabled=$(echo "$tapping_string" | awk '{print $5}')

if [[ "$is_tapping_enabled" = "1" ]]; then
	echo 'Touchpad tapping is already enabled'
	exit 0
fi

tapping_id=$(echo "$tapping_string" | awk '{print $4}' | tr -dc '0-9')

xinput set-prop "$touchpad_id" "$tapping_id" 1
