#!/usr/bin/env bash
# Script Name : mybshfunlib
# Description : Collection of various functions.
# Author      : Madhusudhan D Desai
# Email       : mddnix@gmail.com


###############################################################################
# Checks if file exists.
# Arguments:
#   #1: Filename
# Return:
#   2, if file does not exist.
###############################################################################
_is_file() {
	if [[ ! -f "$1" ]] ; then
		echo "I/O ERROR: File '$1' does not exist."
		exit 2
	fi
}


###############################################################################
# Change case to lower.
# Arguments:
#   #1: Variable content.
# Return:
#   echo content of #1 in lower case.
###############################################################################
_to_lower() {
	local input="$1"
	local output="$(echo $1 | tr [A-Z] [a-z])"
	echo "${output}"
}


###############################################################################
# Change case to upper.
# Arguments:
#   #1: Variable content.
# Return:
#   echo content of #1 in upper case.
###############################################################################
_to_upper() {
	local input="$1"
	local output="$(echo $1 | tr [a-z] [A-Z])"
	echo "${output}"
}
