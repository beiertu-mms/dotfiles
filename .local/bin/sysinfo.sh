#!/usr/bin/env bash
#===============================================================================
#
#          FILE: sysinfo.sh
#
#         USAGE: ./sysinfo.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#         NOTES: ---
#        AUTHOR: tung beier
#       CREATED: 17 November 2020 17:49 CET
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

CYAN="\e[0;36m"
RESET="\e[0m"

OS_INFO=$(hostnamectl | grep 'Operating System' | cut -d ':' -f 2 | xargs)
CPU_INFO=$(< /proc/cpuinfo grep 'model name' | sort -u | cut -d ':' -f 2 | xargs | cut -d ' ' -f '1 2 3 4')
GPU_INFO=$(lspci | grep 'VGA' | cut -d ':' -f 3 | xargs | cut -d ' ' -f '1 4 5 6 7' | sed "s/[][]//g")
MEM_INFO=$(($(< /proc/meminfo grep 'MemTotal' | cut -d ':' -f 2 | xargs | cut -d ' ' -f 1) / 1024))

echo -e "$CYAN       /\\         OS:       $RESET$OS_INFO"
echo -e "$CYAN      /  \\        Host:     $RESET$(cat /sys/devices/virtual/dmi/id/product_name)"
echo -e "$CYAN     /    \\       Kernel:   $RESET$(uname -r)"
echo -e "$CYAN    /      \\      Packages: $RESET$(pacman -Qq | wc -l)"
echo -e "$CYAN   /   ,,   \\     CPU:      $RESET$CPU_INFO"
echo -e "$CYAN  /   |  |  -\\    GPU:      $RESET$GPU_INFO"
echo -e "$CYAN /_-''    ''-_\\   Mem:      $RESET$MEM_INFO MiB"
echo ""

