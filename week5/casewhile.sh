#! /bin/sh
#
# a copy of the ifwhile2.sh script but with the following modifications:
# - replace the if statements with a case statement
# - displays a menu of selections
# - executes the chosen selection as implemented in week2's script

# synopsis:
#   casewhile [-t] [-v] [-f] [-z] [-p] [-o [file]]

# menu:
# Please Select:
# 1. Host
# 2. Last log in
# 3. Variables
# 4. Path

# Enter selection [1-4] >

# algorithm:
# - for each option in the list of options
#     if the option is in the set {-t, -v, -f, -z, -p}
# 		  indicate the option was seen
# 	  if the option is -o [file]
# 		  assign any value in file to the variable ofile
#		  otherwise display an error message
# - menu
#   display the list of selections
#   read the user's response
#   if the user's response is in the listed selections
#     execute the corresponding selection

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

# - menu
#   - display the list of selections
#     print the following text:
#     "Please Select:
#     1. Host
#     2. Last log in
#     3. Variables
#     4. Path"

# - read the user's response
#   print the prompt "Enter selection [1-4] >"
#   read sel

# - if the user's response is in the listed selections, execute the selection
#     case sel in
#       1) execute 1 ;;
#       2) execute 2 ;;
#       3) execute 3 ;;
#       4) execute 4 ;;
#       *) igore ;;
#     end case

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
[ -n "$ofile" ] && echo "ofile is $ofile"

echo "
Please Select:
1. Host
2. Last log in
3. Variables
4. Path
"
read -p "Enter selection [1-4] > " sel

case $sel in
1)
	echo "You are logged in to host $HOSTNAME"
	;;
2) 
  sessions="$(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)"
  count=$(echo "$sessions" | wc -l)
  login_date=$(echo "$sessions" | sed -n "${count}p")
  echo "You last logged in on $login_date"
  ;;
3) 
  count_env=$(env | wc -l | tr -d "[:blank:]")
  count_all=$(set | wc -l | tr -d "[:blank:]")
  count_non=$(( $count_all - $count_env ))
  echo "Your session currently has $count_env environment variables and $count_non non-environment variables."
  ;;
4) 
  echo "These are the directories in your \$PATH"
  dirs=$(echo $PATH | tr ":" " ")
  for dir in $dirs; do echo $dir; done
  ;;
*) echo "no selection" ;;
esac
