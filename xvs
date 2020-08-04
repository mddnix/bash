#!/bin/bash
# Script Name : xvs
# Description : Provides various functions to manipulate a video file.
# Args        : Refer HELP section for usage.
# Author      : Madhusudhan D Desai
# Email       : mddnix@gmail.com

# Bash shell options
# ------------------
set -o nounset # Exit when script tries to use undeclared variables.
set -o errexit # Exit script when command fails. Add '|| true' to allow fail.

# Constant variables
# ------------------
readonly CURRENT_DIR="$PWD"


###############################################################################
# Delete temp files from the directory where the script has been executed.
# Globals/Constants:
#   CURRENT_DIR
###############################################################################
_trap_cleanup() {
	echo "Oops! $(basename $(0)) ($$) has terminated."
	echo "Cleaning temporary files..."
	find "${CURRENT_DIR}" -type f -name "tmp_xvs_*.mp4" -print -delete
	echo "Done"
	exit 2
}
trap '_trap_cleanup' SIGHUP SIGINT SIGQUIT SIGQUIT SIGTERM


###############################################################################
# Checks if file exists.
# Arguments:
#   $1: Filename
###############################################################################
_is_file() {
	if [[ ! -f "$1" ]] ; then
		echo "ERROR: '$1' does not exist"
		exit 2
	fi
}

