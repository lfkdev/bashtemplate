# bashtemplate
Use this bash template for clean output and better error handling

![output preview](https://s18.directupload.net/images/190518/92au6td4.png)

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
