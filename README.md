# bashtemplate
Use this bash template for clean output and better error handling

![output preview](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png)

The following functions are included:

There are the following output classes: info, warn, success, debug and error.
The classes are structured as follows (info function as example):
```bash
info() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][INFO]: $1 "
} 
```
