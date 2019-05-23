#!/usr/bin/env bash

########################################################
# Author: lfkdev                                       #
# Info: example usage script                           #
# License: MIT (c)                                     #
########################################################

# color pallet
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"

is_debug=false # debugmode

trap exit_EXIT EXIT
trap exit_CTRL QUIT
trap exit_CTRL SIGINT

main() {
  example
}

example() {
  info "Information"
  warn "Warning!"
  succ "Success!"
  debug "Debug"
}

err() { 
  local _date
  _date=$(showdate)
  echo -e "[$_date][${red}ERROR${cf}]: $1" 1>&2
}

err_die() {
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
  printf "%s" "$_date"
}

debug () {
  local _date
  _date=$(showdate)
  if [[ "$is_debug" == "true" ]]; then
    echo -e "[$_date][${purple}DEBUG${cf}]: $1"
  fi
}

exit_EXIT() {
  info "Script ended! Cleanup & Exit."
  cleanup
  exit 1
}

exit_CTRL() {
  err "User pressed CTRL+C!"
  exit 1
}

cleanup() {
  info "cleanup.."
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
