#!/bin/bash
echo "Welcome $USER"
echo "You are logged in to $HOSTNAME"

- The date and time you last logged in, not including this time. (Try last -2 $LOGNAME (If this is the first time 
  you have logged in to this system, it is acceptable for the output to indicate the last login is the current login session.))

algorithm:
    . identify the date and time the user last logged in
    . if this is the first login session identify the date and time of this loggin session
    . display the date and time
pseudocode:
    . set login_date = last login date
    . if login_date is null or empty, set login_date = current login date
    . set msg = "You last logged in on login_date"
    . print msg

- Displays how many local (non-environment) and environment variables you have defined. (This requires arithmetic.)
- Displays the directories in your search path, in the order they are searched, one-per-line.
2. Takes three valid integers from the user. Make sure they are valid.

3. Finds the largest and smallest number of the three integers.

4. Performs the following on each combination of two from the three numbers and display the results; Addition, subtraction, multiplication and division.

5. Reports that the script is done and exits.