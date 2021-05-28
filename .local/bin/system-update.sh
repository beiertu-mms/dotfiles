#!/usr/bin/env bash
#===============================================================================
#
#          FILE: system-update.sh
#
#         USAGE: ./system-update.sh
#
#   DESCRIPTION: Run update commands.
#
#  REQUIREMENTS: figlet, yay
#        AUTHOR: tung beier
#       CREATED: 28 May 2021 20:29 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

figlet -w 500 "Arch update"
yay -Syyu

figlet -w 500 "gcloud update"
gcloud components update

figlet -w 500 "ccloud update"
ccloud update

