#! /bin/sh

quit() {
    local prog=$(basename "$0")
    echo "$prog: $*" >&2
    echo "usage: $prog { -a | -b } file" >&2
    exit 1
}

[ $# -ne 2 ] && quit "requires two arguments"

opt="$1" file="$2"

! [ "$opt" == '-a' -o "$opt" == '-b' ] && quit "invalid option"
! [ -f "$file" -a -r "$file" ] && quit " $file is not a readable file"
exit 0