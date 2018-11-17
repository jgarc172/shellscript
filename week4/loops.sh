while [ ! -f "$file" -o ! -r "$file" ]; do
 echo "'$file' is not a readable file" >&2
 read -p "Enter the filename:" file
done

read -p "Enter the filename:" file
while [ ! -f "$file" -o ! -r "$file" ] || !grep ":.*:.*:" > /dev/null; do
 echo "'$file' is not a readable file" >&2
 read -p "Enter the filename:" file
done

while true; do
 read -p "Enter the filename:" file
 if [ -f "$file" -a -r "$file" ]; then
 break
 fi
 echo "'$file' is not a readable file - reenter it." >&2
done

while true; do
 read -p "Enter the filename:" file
 [ -f "$file" -a -r "$file" ] && break
 echo "'$file' is not a readable file - reenter it." >&2
done

read -p "Enter filename (empty to quit):" file
while [ -n "$file" ]; do
 if [ -f "$file" -a -r "$file" ]; then
 cat "$file"
 else
 echo "'$file' is not a readable file. reenter" >&2
 fi
 read -p "Enter filename (empty to quit):" file
done

while true; do
 read -p "Enter filename (empty to quit):" file
 [ -z "$file" ] && break
 [ ! -f "$file" -o ! -r "$file" ] && echo "'$file' is not a readable file. reenter" >&2 && continue
 cat "$file"
done

