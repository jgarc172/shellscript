#! /bin/sh
#
# a shell script with a set of options -t -v -f -z and -p. The options, of course,
# can appear in any order. Write a sequence of commands for this shell script to examine the
# command line arguments. For each, set a flag to indicate whether the option was seen.
# Another argument is of the form: -o outfile. Leave $1 positioned at the first nonoption argument
# and a variable ofile set to the path given as outfile.
# (Hint: you cannot use a for loop. Use a while loop)

# synopsis:
#   ifwhile1 [-t] [-v] [-f] [-z] [-p] [-o [file]]

# algorithm:
# for each option in the list of options
# 	if the option is in the set {-t, -v, -f, -z, -p}
# 		indicate whether the option was seen
# 	if the option is -o [file]
# 		assign any value in file to the variable ofile
#		otherwise display an error message

# pseudocode:
# - for each option in the list of options
#     while # of options > 0 do
#       shift
#     done

# - if the option is in the set {-t, -v, -f, -z, -p}, set a flag
#     case option in
#       -t) tflag=true ;;
#       -v) vflag=true ;;
#       -f) fflag=true ;;
#       -z) zflag=true ;;
#       -p) pflag=true ;;
#       *)  ;;
#     end case

# - if the option is -o [file],	assign any value in file to the variable ofile
# if option is -o
# 	ofile=""
# 	if the next option doesn't start with '-'
# 		ofile= next option
#			shift

# - display an error message
#     echo "option is not allowed"

# code implementation

ofile=""
while [ "$#" -gt 0 ]; do
	case "$1" in
	-t) tflag=true ;;
	-v) vflag=true ;;
	-f) fflag=true ;;
	-z) zflag=true ;;
	-p) pflag=true ;;
	-o)
		(echo "$2" | grep -q '^-') || ofile="$2" && shift
		;;
	*) echo "option $1 is not allowed" ;;
	esac
	shift
done
echo "ofile is $ofile"
