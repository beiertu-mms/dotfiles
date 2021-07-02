#!/usr/bin/env bash
#===============================================================================
#
#          FILE: combine-prs.sh
#
#         USAGE: ./combine-prs.sh
#
#   DESCRIPTION: Combine multiple braches, which match the search criteria
#                into one new brach.
#
#  REQUIREMENTS: gh (github-cli), git
#        AUTHOR: tung beier
#       CREATED: 01 July 2021 23:16 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

#===============================================================================
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

#===============================================================================
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

#===============================================================================
git stash
git checkout "$base_branch"
git pull --ff-only
git checkout -b "$combine_branch_name"

#===============================================================================
gh pr list | grep "$search_branch_name" | while read -r pr ; do
    id=$(echo "$pr" | cut -f1 | xargs)
    msg=$(echo "$pr" | cut -f2 | xargs)

    gh pr diff "$id" | git apply -v
    git add .
    git commit --no-verify --message "$msg"
done

echo "done"

