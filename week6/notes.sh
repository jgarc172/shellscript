
for file in ${PWD}/*; do
  [ -f "$file" ] && echo $file
done

for item in item1 item2 item3; do
  echo "$item"
done

# For generating lists, use wildcards instead of command substitiution.
# command substitution
for item in $(ls); do
  echo "$item"
done

# better: wildcards
for item in *; do
  echo "$item"
done

