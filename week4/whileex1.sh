#!/bin/bash
#
error() {
	echo "$(basename "$0"): ERROR - $*" >&2
	echo "syntax: $(basename "$0") [-x] [-y] directory" >&2
	exit 1
}
xflag=false
yflag=false
while [ $# -gt 0 ]; do
	if [ "$1" = '-x' ]; then
		xflag=true
	elif [ "$1" = '-y' ]; then
		yflag=true
	else
		# assume it's the filename
		[ ! -d "$1" -o ! -w "$1" ] && error "'$1' is not a writable directory"
		[ $# -ne 1 ] && error "the directory must be the last argument"
		file="$1"
	fi
	shift
done
[ -z "$file" ] && error "required writable directory argument missing"

error() {
	echo "$(basename "$0"): ERROR - $*" >&2
	echo "syntax: $(basename "$0") [-x] [-y] directory" >&2
	exit 1
}

dir=
xflag=false
yflag=false
while [ $# -gt 0 ]; do
	if [ "$1" = '-x' ]; then
		xflag=true
	elif [ "$1" = '-y' ]; then
		yflag=true
	elif echo "$1" | grep -q '^-'; then
		error "illegal option '$1'"
	else
		# assume it's the filename
		[ ! -d "$1" -o ! -w "$1" ] && error "'$1' is not a writable directory"
		[ $# -ne 1 ] && error "the directory must be the last argument"
		file="$1"
	fi
	shift
done
[ -z "$file" ] && error "required writable directory argument
missing"

error() {
	#
	# modifies the global variable errors
	#
	echo "$(basename "$0"): ERROR - $*" >&2
	echo "syntax: $(basename "$0") [-x] [-y] directory" >&2
	errors=true
}
dir=
xflag=false
yflag=false
errors=false
while [ $# -gt 0 ]; do
	if [ "$1" = '-x' ]; then
		xflag=true
	elif [ "$1" = '-y' ]; then
		yflag=true
	elif echo "$1" | grep -v '^-'; then
		error "illegal option '$1'"
	else
		# assume it's the filename
		[ ! -d "$1" -o ! -w "$1" ] && error "'$1' is not a writable directory"
		[ $# -ne 1 ] && error "the directory must be the last argument"
		file="$1"
	fi
	shift
done
[ -z "$file" ] && error "required writable directory argument missing"
if [ "$errors" = true ]; then
	echo "failed" >&2
	exit 1
fi

error() {
	#
	# modifies the global variable errors
	#
	echo "$(basename "$0"): ERROR - $*" >&2
	echo "syntax: $(basename "$0") [-x] [-y] directory" >&2
	errors=true
}
dir=
xflag=false
yflag=false
errors=false
while [ $# -gt 0 ]; do
	case "$1" in
	-x) xflag=true ;;
	-y) yflag=true ;;
	-*) error "illegal option '$1'" ;;
	*) # assume it's the filename
		[ ! -d "$1" -o ! -w "$1" ] && error "'$1' is not a writable directory"
		[ $# -ne 1 ] && error "the directory must be the last argument"
		file="$1"
		;;
	esac
	shift
done
[ -z "$file" ] && error "required writable directory argument
missing"
if [ "$errors" = true ]; then
	echo "failed" >&2
	exit 1
fi
