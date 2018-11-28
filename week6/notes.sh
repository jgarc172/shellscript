
for file in ${PWD}/*; do
  [ -f "$file" ] && echo $file
done

for item in item1 item2 item3; do
  echo "$item"
done
