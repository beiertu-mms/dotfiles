#!/usr/bin/env bash
#===============================================================================
#
#          FILE: bashtemplate
#
#         USAGE: ./bashtemplate [OPTION]
#
#   DESCRIPTION: Print predefined comment for bash scripting
#
#       OPTIONS: - header: print the shebang and predefined file description
#                - function: print a comment to describe a function
#  REQUIREMENTS: bash
#         NOTES: Inspired by vim bash-support plugin
#        AUTHOR: tung beier
#       CREATED: 25 June 2019 21:36 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: _print_header
#   DESCRIPTION: print the shebang and predefined comment to describe the script
#-------------------------------------------------------------------------------
_print_header() {
  cat <<EOF
#!/usr/bin/env bash
#===============================================================================
#
#          FILE: test.sh
#
#         USAGE: ./test.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#         NOTES: ---
#        AUTHOR: tung beier
#       CREATED: $(date '+%d %B %Y %H:%M %Z')
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

EOF
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: _print_function
#   DESCRIPTION: comment uses to describe a function
#-------------------------------------------------------------------------------
_print_function() {
  cat <<EOF
#---  FUNCTION  ----------------------------------------------------------------
#          NAME:
#   DESCRIPTION:
#    PARAMETERS:
#       RETURNS:
#-------------------------------------------------------------------------------
_function() {
}
EOF
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME: _print_usage
#   DESCRIPTION: print usage information for this script
#-------------------------------------------------------------------------------
_print_usage() {
  cat <<EOF
Usage: bashtemplate [OPTION]
Print predefined template to use in bash scripts.
Options:
  -h, --header    print script header template
  -f, --function  print function template
EOF
}

#---  SCRIPT LOGIC  ------------------------------------------------------------
if [[ "$#" -eq 0 ]]; then
  cat <<EOF
bashtemplate: missing argument
Try 'bashtemplate --help' for more information
EOF
  exit 1
fi

if [[ "$#" -gt 1 ]]; then
  cat <<EOF
bashtemplate: too many arguments
Try 'bashtemplate --help' for more information
EOF
  exit 1
fi

case $1 in
  -h|--header)
    _print_header
    ;;
  -f|--function)
    _print_function
    ;;
  --help)
    _print_usage
    ;;
  *)
    cat <<EOF
bashtemplate: unknown option
Try 'bashtemplate --help' for more information
EOF
    exit 1
    ;;
esac

