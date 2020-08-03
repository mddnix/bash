#!/bin/bash
# Script Name : xvs.sh
# Description : Provides various functions to manipulate a video file.
# Args        : Refer HELP section for usage.
# Author      : Madhusudhan D Desai
# Email       : mddnix@gmail.com


##################################################################################
# Cleans up temporary files from the directory where the script has been executed.
# Globals:
#   none
# Arguments:
#   none
##################################################################################
_trap_cleanup() {
	echo "Oops! $(basename $(0)) ($$) has terminated."
	echo "Cleaning temporary files..."
	find "$PWD" -type f -name "tmp_xvs_*.mp4" -delete
	exit 2
}
trap '_trap_cleanup' SIGHUP SIGINT SIGQUIT SIGQUIT SIGTERM

