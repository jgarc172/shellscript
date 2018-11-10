#!/bin/bash
# Display a welcome message indicating your name (the user).
echo "Welcome $USER"

# Display the host computer you are logged in.
echo "You are logged in to $HOSTNAME"

# Display the date and time you last logged in, not including this time.
(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)
tmp="$(last -2 $LOGNAME | grep $LOGNAME | tr -s " " | cut -d" " -f4-7)"
echo "$tmp"
count=$(echo "$tmp" | wc -l)
line1=$(echo "$tmp" | sed -n '1p')
line2=$(echo "$tmp" | sed -n '2p')

count=$(last -2 $LOGNAME | wc -l )
if [ $count -eq 2 ] 
then 
    line=$(sed )
else 
        echo "a is not equal" 
fi 

pseudocode:
    . set count = the number of lines in the command (last -2 $LOGNAME)
    . if count == 2
        set line = second line
      else
        set line = first line
    . set login_date = the range of columns 4-7
    . set msg = "You last logged in on login_date"
    . print msg

- Displays how many local (non-environment) and environment variables you have defined. (This requires arithmetic.)
- Displays the directories in your search path, in the order they are searched, one-per-line.
2. Takes three valid integers from the user. Make sure they are valid.

3. Finds the largest and smallest number of the three integers.

4. Performs the following on each combination of two from the three numbers and display the results; Addition, subtraction, multiplication and division.

5. Reports that the script is done and exits.