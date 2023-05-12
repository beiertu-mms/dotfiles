#!/usr/bin/env bash
#===============================================================================
#
#          FILE: webcam-setting.sh
#
#         USAGE: ./webcam-setting.sh
#
#   DESCRIPTION: Adjust the webcam setttings.
#
#  REQUIREMENTS: v4l2-ctl
#         NOTES: ---
#        AUTHOR: tung beier
#       CREATED: 18 March 2021 21:18 CET
#===============================================================================

set -o errexit # Exit when a command fails
# Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

OPTIONS=(
	"focus_auto=0"
	"focus_absolute=250"
	"sharpness=4"
	"brightness=10"
	"contrast=1"
	"saturation=60"
	"white_balance_temperature_auto=1"
	"backlight_compensation=1"
)

for OPTION in "${OPTIONS[@]}"; do
	v4l2-ctl -d0 -c "${OPTION}"
done
