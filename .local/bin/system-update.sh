#!/usr/bin/env bash
#===============================================================================
#
#          FILE: system-update.sh
#
#         USAGE: ./system-update.sh
#
#   DESCRIPTION: Run update commands.
#
#  REQUIREMENTS: yay
#        AUTHOR: tung beier
#       CREATED: 28 May 2021 20:29 CEST
#===============================================================================

set -o errexit # Exit when a command fails
# Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

GREEN='\033[0;32m'
NC='\033[0m' # No Color

function print() {
	echo -e "\n${GREEN}${1}${NC}\n"
}

if command -v gcloud &>/dev/null; then
	print "update gcloud"
	gcloud components update
fi

if command -v ccloud &>/dev/null; then
	print "update ccloud"
	ccloud update
fi

if command -v confluent &>/dev/null; then
	print "update confluent"
	confluent update
fi

if command -v cheatsheets &>/dev/null; then
	go install github.com/cheat/cheat/cmd/cheat@latest
	print "update cheatsheets"
	cheatsheets pull
fi

curl -LJO https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/ssh-agent/ssh-agent.plugin.zsh \
	--output-dir "$HOME/.local/share/zsh-ssh-agent/"

print "update arch"
yay -Syyu

print "done"
print "TODO update go installed packages"
