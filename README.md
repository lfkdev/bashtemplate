# bashtemplate
Use this bash template for clean output and better error handling

![output preview](https://raw.githubusercontent.com/username/projectname/branch/path/to/img.png)

The following functions are included:

To get the info Output:
```bash
info() {
  local _date
  _date=$(date +%d-%H.%M)
  echo -e "[$_date][INFO]: $1 "
} 
```
Usage: info "this is a text"
