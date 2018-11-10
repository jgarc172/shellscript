#!/bin/bash
# Display a welcome message indicating your name (the user).
echo "Welcome $USER"

# Display the host computer you are logged in.
echo "You are logged in to $HOSTNAME"

# Display the date and time you last logged in, not including this time.
(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)
sessions="$(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)"
count=$(echo "$sessions" | wc -l)
login_date=$(echo "$sessions" | sed -n "${count}p")
echo "You last logged in on $login_date"
line1=$(echo "$tmp" | sed -n '1p')
line2=$(echo "$tmp" | sed -n '2p')

# Displays how many local (non-environment) and environment variables you have defined.

count_env=$(env | wc -l)
count_all=$(set | wc -l)
count_non=$(( $count_all - $count_env ))
echo "Variables - non-environment: $count_non , environment: $count_env"

# Displays the directories in your search path, in the order they are searched, one-per-line.

dirs=$(echo $PATH | tr ":" " ")
for dir in $dirs; do echo $dir; done

2. Takes three valid integers from the user. Make sure they are valid.

3. Finds the largest and smallest number of the three integers.

4. Performs the following on each combination of two from the three numbers and display the results; Addition, subtraction, multiplication and division.

5. Reports that the script is done and exits.