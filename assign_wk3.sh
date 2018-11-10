#!/bin/bash
# Display a welcome message indicating your name (the user).
echo "Welcome $USER"

# Display the host computer you are logged in.
echo "You are logged in to host $HOSTNAME"

# Display the date and time you last logged in, not including this time.
(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)
sessions="$(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)"
count=$(echo "$sessions" | wc -l)
login_date=$(echo "$sessions" | sed -n "${count}p")
echo "You last logged in on $login_date"
line1=$(echo "$tmp" | sed -n '1p')
line2=$(echo "$tmp" | sed -n '2p')

# Displays how many local (non-environment) and environment variables you have defined.

count_env=$(env | wc -l | tr -d "[:blank:]")
count_all=$(set | wc -l | tr -d "[:blank:]")
count_non=$(( $count_all - $count_env ))
echo "Your session currently has $count_env environment variables and $count_non non-environment variables."

# Displays the directories in your search path, in the order they are searched, one-per-line.

echo "These are the directories in your \$PATH"
dirs=$(echo $PATH | tr ":" " ")
for dir in $dirs; do echo $dir; done

# 2. Takes three valid integers from the user. Make sure they are valid.

echo "enter three integers separated by a space"
read int1 int2 int3
if [[ ! ("$int1" =~ ^-?[[:digit:]]+$) ]]; then echo "$int1 is not a digit"; fi
if [[ ! ("$int2" =~ ^-?[[:digit:]]+$) ]]; then echo "$int2 is not a digit"; fi
if [[ ! ("$int3" =~ ^-?[[:digit:]]+$) ]]; then echo "$int3 is not a digit"; fi

# 3. Finds the largest and smallest number of the three integers.

min=$int1
max=$int1
if [[ $int2 -lt $min ]]; then min=$int2; fi
if [[ $int2 -gt $max ]]; then max=$int2; fi
if [[ $int3 -lt $min ]]; then min=$int3; fi
if [[ $int3 -gt $max ]]; then max=$int3; fi
echo "The largest value is $max and the smallest value is $min"


# 4. Performs the following on each combination of two from the three numbers and display the results; Addition, subtraction, multiplication and division.

# 5. Reports that the script is done and exits.