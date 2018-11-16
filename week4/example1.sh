#!/bin/bash
#
# i won't write the documentation for this code, since I don't know what it does!

fatal() {
# fatal: output an error message and a synopsis message to standard error.
# then exit with an error.
local prog=$(basename "$0")
echo "$prog: ERROR - $*" >&2
echo "usage: $(basename "$0") { -a | -b } inputfile" >&2
exit 1
}

# First, check the number of arguments
# I will use && for the first error message and if statements for the rest

[ $# -ne 2 ] && fatal "exactly two arguments required."

# There is only one option, and it must be one of two possibilities.
# When you have two possibilities for a test, you can write
# the test in one of two ways
# 1. if its not the first possibility and it's not the second
# possibility, then there's an error.
# 2. if not (it's the first possibility or the second), then
# there's an error.
# Here's how to write it the first way:

if [ "$1" != '-a' -a "$1" != '-b' ]; then
 fatal "first argument ('$1') must be -a or -b"
fi

# Here's how to write it the second way:

if ! [ "$1" = '-a' -o "$1" = '-b' ]; then ...

# Last, the path argument must be readable and be a file.
# Again, the test has two required attributes: BOTH must be satisfied.
# there are two ways to write this:
# - if it doesn't have the first attribute or it doesn't have
# the second, there's an error.
# - if not (it has both attributes), there's an error.
# Again, we'll write it the first way, then show the second:

if [ ! -f "$2" -o ! -r "$2" ]; then
 fatal "'$2' is not a readable file"
fi

# if ! [ -f "$2" -a -r "$2" ]; then ...