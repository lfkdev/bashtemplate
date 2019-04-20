#!/usr/bin/env bash

####################################################
# Author:                                          #
# Info:                                            #
# License:                                         #
####################################################

# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"

is_debug=false # debugmode

main() {
  #funktion1
  #funktion2
  cleanup
}

# The following functions warn, info, succ and debug are for
# output information. Use
#   'info' for simple information/status messages
#   'warn' for warnings messages - not for script-breaking failures, just warnings,
#   'succ' for success messages,
#   'err' for error messages (more details are above the err function)
#   'debug' for debug messages which will only show up if debug mode is enabled.
#   for the debug mode switch "is_debug" to "true" in your script.
# You can change the colors at the top.
# usage: warn "This is a warning!"
info() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][INFO]: $1 "
} 

warn() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][${yellow}WARNING${cf}]: $1 "
}


succ() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][${green}SUCCESS${cf}]: $1 "
}

# The debug() funktion will only show up if boolean 'is_debug' is true
debug () {
  _date=$(date +%d-%H.%M)
  if [[ "$is_debug" == "true" ]]; then
    echo -e "[$_date][${purple}DEBUG${cf}]: $1 "
  fi
}

# The err() funktion redirects the Message to STDERR, 
# starts the cleanup function and then exits.
# You can call err() with "1" as argument to show the help before exiting.
err() { 
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][${red}ERROR${cf}]: $1 -> use -h parameter for help." 1>&2
  echo -e "[$_date][${red}ERROR${cf}]: Cleaning & Exiting."
  cleanup
  if [[ "$2" == "1" ]]; then
    showhelp
  fi
  exit 1
}

cleanup() {
  echo "cleanup.."
  # cleanup tmp files, kill process etc.
}

showhelp() {
  echo " Help:"
  echo "  Usage: $0 [-d] / [-h]"
  echo "  Where:"
  echo "    -d: For optional debug messages."
  echo "    -h: Shows this help text."
  echo ""
  echo "  Example:"
  echo "  Info:"
  echo ""
}

# Add all the parameter you whish, -h will show help and -d will
# trigger debug messages to show up
while getopts ":hd" o; do
    case "${o}" in
        h)
            showhelp
            exit 0
            ;;
        d)
            is_debug=true
            ;;
        *)
            err "No valid option choosed."
            ;;
    esac
done

main
