# Bash template
Use this bash template for your next script for clean output and better error handling.
This script is based on the rules of 
[Googles Styleguide](https://google.github.io/styleguide/shell.xml)
and 
[bahamas10's Styguide](https://github.com/bahamas10/bash-style-guide)

Output example:
<p align="center">
  <img src="https://s18.directupload.net/images/190518/92au6td4.png">
</p>

There are the following output classes: info, warn, success, debug and error.
The classes are structured as follows (info function as example):
```bash
info() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][INFO]: $1 "
} 
```

So you can easily filter the output your script produces.
Example usage:
```bash
info " I am some random info."
warn "This is not normal!"
succ "Finished without errors!"
debug "I'm some info just for the devs!"
err "Error, something is wrong!"
err_die "Error, exiting now!"
```

In addition, some functions have more features than just clean output.
### Debug function
The debug() funktion will only show up if boolean 'is_debug' is true. This is made by the -d parameter. So devs can just execute the script with -d to view all debug messages.
```bash
$ bash /usr/local/bin/script.sh -d
```
### Err-Die function
The err_die() funktion redirects the message to STDERR, 
starts the cleanup function and then exits.
You can call err_die() with "1" as argument to show the help before exiting.
```bash
err_die "Please use parameter." 1
```
You can call normal errors without exiting the script by just 
```bash
err "This is an error but I can continue anyway."
```

### Traps
The following traps are builtin:
```bash
trap exit_EXIT EXIT
trap exit_CTRL QUIT
trap exit_CTRL SIGINT
```
So the script catches when the user pressed ctrl+c or the it got interrupted by other ways.
This way you can call the cleanup function even if the script dies while running.

## Changing Colors
Just change the color pallet values at the top of the script as you whish.
```bash
readonly cf="\\033[0m"
readonly red="\\033[0;31m"
readonly green="\\033[0;32m"
readonly yellow="\\033[0;33m"
readonly purple="\\033[0;35m"
```

## Quick Start:
Just download the script
```bash
wget -O mynewscript.sh https://raw.githubusercontent.com/lfkdev/bashtemplate/master/template_script.bash
chmod +x mynewscript.sh
```

Fill in your info in the metabox
```bash
####################################################
# Author:                                          #
# Info:                                            #
# License:                                         #
####################################################
```

Now start creating your code with the output functions and write every function in the main one! Have fun

If you have any problems or whishes let me now.
