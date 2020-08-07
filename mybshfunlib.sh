#!/usr/bin/env bash
# Script Name : mybshfunlib
# Description : Collection of various functions.
# Author      : Madhusudhan D Desai
# Email       : mddnix@gmail.com


###################################################################################################
# Checks if file exists.
# Arguments:
#   $1: Filename
# Return:
#   2, if file does not exist.
###################################################################################################
_is_file() {
	if [[ ! -f "$1" ]] ; then
		echo "I/O ERROR: File '$1' does not exist."
		exit 2
	fi
}

###################################################################################################
# Change case to lower.
# Arguments:
#   $1: Variable content.
# Return:
#   echo content of $1 to lower case.
###################################################################################################
_to_lower() {
	local input="$1"
	local output="$(echo $1 | tr [A-Z] [a-z])"
	echo "${output}"
}

###################################################################################################
# Change case to upper.
# Arguments:
#   $1: Variable content.
# Return:
#   echo content of $1 to upper case.
###################################################################################################
_to_upper() {
	local input="$1"
	local output="$(echo $1 | tr [a-z] [A-Z])"
	echo "${output}"
}

###################################################################################################
# Change case to pascal.
# Arguments:
#   $1: Variable content.
# Return:
#   echo content of $1 to pascal case.
###################################################################################################
_to_pascal() {
	local input="$1"
	local to_lower="$(_to_lower "$1")"
	local output="$(echo ${to_lower} \
		| sed 's/\([a-z]\)\([a-zA-Z0-9]*\)/\u\1\2/g')"
	echo "${output}"
}

###################################################################################################
# Draws a line based on use selected character.
# Arguments:
#   $1: Symbol type.
#   $2: (optional) length to print.
# Return:
#   echo repeated characters by specified length.
###################################################################################################
_draw_line() {
	local symbol="$1"
	local length=${2:-$(tput cols)}
	printf "%${length}s\n"|tr " " "${symbol}"
}

###################################################################################################
# Checks if the package is installed.
# Arguments:
#   $1: Command name.
# Return:
#   echo command installed status.
###################################################################################################
_is_cmd() {
	local cmd_name="$1"
	if [[ ! $(command -v "${cmd_name}") ]]  ; then
		echo "Error: '${cmd_name}' not installed. Try again after installing it."
		exit 1
	fi
}

###################################################################################################
# Draw a Title Header in center of the screen.
# Arguments:
#   $1: Title Header.
#   $2: (Optional) Symbol for both left and right sides.
#   $3: (Optional) Symbol for right side.
# Return:
#   echo title header
###################################################################################################
_title_header() {
	# if only arg $1 is given, fill left and right lines with empty space.                              
	if [[ $# -eq 1 ]] ; then                                                                            
	    str_title=" $1 "                                                                                
	    str_lefty=" "                                                                                   
	    str_right=" "                                                                                   
	                                                                                                    
	# if args $1 and $2 are given, fill left and right lines with $2 symbol.                            
	elif [[ $# -eq 2 ]] ; then                                                                          
	    str_title=" $1 "                                                                                
	    str_lefty="$2"                                                                                  
	    str_right="$str_lefty"                                                                          
	                                                                                                    
	# if all args $1,$2 and $3 are given, fill left line with $2 and right line with $3 symbol.            
	elif [[ $# -eq 3 ]] ; then                                                                          
	    str_title=" $1 "                                                                                
	    str_lefty="$2"                                                                                  
	    str_right="$3"                                                                                  
	else                                                                                                
	    echo "Error: Number of parameters incorrect."                                                   
	    exit 1                                                                                          
	fi                                                                                                  
	                                                                                                    
	len_screen=$(tput cols) # Length of screen width.                                                      
	len_title=${#str_title} # Length of Title.                                                          
	len_lefty=$(( (len_screen - len_title) / 2 )) # Length of left part.                                
	len_right=$(( len_screen - (len_title + len_lefty) )) # Length of right part.                       
	                                                                                                    
	var_left=$(printf "%${len_lefty}s"|tr " " "${str_lefty}") # Repeat symbols at left.                    
	var_cent=$(printf "%s" "${str_title}") # Title at middle.                                              
	var_right=$(printf "%${len_right}s\n"|tr " " "${str_right}") # Repeat symbols at right.                
	                                                                                                       
	echo "${var_left}${var_cent}${var_right}" # Print total header line                              
}
