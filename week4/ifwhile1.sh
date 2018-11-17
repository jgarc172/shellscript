#! /bin/sh
#
# a shell script with a set of options -t -v -f -z and -p. The options, of course,
# can appear in any order. Write a sequence of commands for this shell script to examine the
# command line arguments and output an error message for each argument that is not -t -v -f -z or -p.

# synopsis:
#   ifwhile1 [-t] [-v] [-f] [-z] [-p]

# algorithm:
# for each option in the list of option
#     if the option is not in the set {-t, -v, -f, -z, -p}
#         display an error message

# pseudocode:
# - for each option in the list of option
#     while # of options > 0 do
#       shift
#     done

# - if the option is not in the set {-t, -v, -f, -z, -p}
#     inSet=false
#     case option in
#       -t) inSet=true ;;
#       -v) inSet=true ;;
#       -f) inSet=true ;;
#       -z) inSet=true ;;
#       -p) inSet=true ;;
#       *) inSet=false ;;
#     end case

# - display an error message
#     echo "option is not allowed"

# code implementation

while [ "$#" -gt 0 ]; do
	case "$1" in
	-t) ;;
	-v) ;;
	-f) ;;
	-z) ;;
	-p) ;;
	*) echo "option $1 is not allowed" ;;
	esac
	shift
done
