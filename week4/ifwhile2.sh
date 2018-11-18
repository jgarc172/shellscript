#! /bin/sh
#
# a shell script with a set of options -t -v -f -z and -p. The options, of course,
# can appear in any order. Write a sequence of commands for this shell script to examine the
# command line arguments. For each, set a flag to indicate whether the option was seen.
# Another argument is of the form: -o outfile. Leave $1 positioned at the first nonoption argument
# and a variable ofile set to the path given as outfile.
# (Hint: you cannot use a for loop. Use a while loop)

# synopsis:
#   ifwhile2 [-t] [-v] [-f] [-z] [-p] [-o [file]]

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
#			if      option is -t then tflag=true
#     else if option is -v then vflag=true
#     else if option is -f then fflag=true
#     else if option is -z then zflag=true
#     else if option is -p then pflag=true
#     else option is not in the set
#     end if

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
	if   [ "$1" = '-t' ]; then tflag=true
	elif [ "$1" = '-v' ]; then vflag=true
	elif [ "$1" = '-f' ]; then fflag=true
	elif [ "$1" = '-z' ]; then zflag=true
	elif [ "$1" = '-p' ]; then pflag=true
	elif [ "$1" = '-o' ]; then 
		(echo "$2" | grep -q '^-') || ofile="$2" && shift
	else
		echo "option $1 is not allowed" 
	fi
	shift
done
echo "ofile is $ofile"
