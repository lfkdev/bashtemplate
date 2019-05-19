#!/usr/bin/env bash

########################################################
# Author:                                              #
# Info:                                                #
# License:                                             #
########################################################

# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"

is_debug=false # debugmode

main() {
  #function1
  #function2
  cleanup
}

# The err() function redirects output to STDERR
err() { 
  local _date
  _date=$(showdate)
  echo -e "[$_date][${red}ERROR${cf}]: $1 -> use -h parameter for help." 1>&2
}

# The die() function redirects the message to STDERR, 
# starts the cleanup function and then exits.
# You can call die() with "1" as argument to show the help before exiting.
die() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${red}ERROR${cf}]: $1 -> use -h parameter for help." 1>&2
  echo -e "[$_date][${red}ERROR${cf}]: Cleaning & Exiting."
  cleanup
  if [[ "$2" == "1" ]]; then
    showhelp
  fi
  exit 1
}

# The following function warn, info, succ and debug are for
# output information, use warn for warnings, succ for success etc.
# You can change the colors at the top.
warn() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${yellow}WARNING${cf}]: $1"
}

info() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][INFO]: $1 "
} 

succ() {
  local _date
  _date=$(showdate)
  echo -e "[$_date][${green}SUCCESS${cf}]: $1"
}

showdate() {
  local _date
  _date=$(date +%d-%H.%M)
  printf "$_date"
}

# The debug() funktion will only show up if boolean 'is_debug' is true
debug () {
  local _date
  _date=$(showdate)
  if [[ "$is_debug" == "true" ]]; then
    echo -e "[$_date][${purple}DEBUG${cf}]: $1"
  fi
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
            exit 1
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
