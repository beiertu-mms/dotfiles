#!/usr/bin/env bash
#===============================================================================
#
#          FILE: combine-prs.sh
#
#         USAGE: ./combine-prs.sh
#
#   DESCRIPTION: Combine multiple braches, which match the search criteria
#                into one new brach.
#                This will try to apply the patches. If one fails, it will
#                continue with the next one.
#
#  REQUIREMENTS: gh (github-cli), git
#        AUTHOR: tung beier
#       CREATED: 01 July 2021 23:16 CEST
#===============================================================================

set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#===== Print the usage of this script ==========================================
usage() {
    cat << EOF
usage: ./combine-prs.sh [OPTIONS]

Options:
-b  default head branch to be checkout from. Default: master.
-c  feature branch name to be used. Default: Update-dependencies.
-s  earch criteria for branches to be considered in the combination. Default: dependabot.
*   show this usage.
EOF
    exit 1; 
}

#===== Parse arguments =========================================================
base_branch="master"
combine_branch_name="Update-dependencies"
search_branch_name="dependabot"

while getopts ":b:c:s:" option; do
    case "${option}" in
        b) base_branch=${OPTARG} ;;
        c) combine_branch_name=${OPTARG} ;;
        s) search_branch_name=${OPTARG} ;;
        *) usage ;;
    esac
done
shift $((OPTIND-1))

#===== Update and checkout to new branch =======================================
current_branch=$(git branch | grep '*' | cut -d' ' -f2)
if [[ "$current_branch" != "$combine_branch_name" ]]; then
    git stash
    git checkout "$base_branch"
    git pull --ff-only
    git branch -D "$combine_branch_name"
    git checkout -b "$combine_branch_name"
    echo ""
fi

#===== Search and apply patches ================================================
gh pr list | grep "$search_branch_name" | while read -r pr ; do
    id=$(echo "$pr" | cut -f1 | xargs)
    msg=$(echo "$pr" | cut -f2 | xargs)

    echo -e "try to apply pr #${id}..."
    if gh pr diff "$id" | git apply; then
        git commit --all --no-verify --message "$msg"
        echo -e "${GREEN}pr #${id}: '${msg}' apply successfully${NC}\n"
    else
        echo -e "${RED}failed to apply pr #${id}: '${msg}'${NC}\n"
    fi
done

echo "done"

