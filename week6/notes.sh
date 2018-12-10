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

isInt() {
	if [[ "$arg" =~ ^-?[0-9]+$ ]]; then
		return 0
	else
		return 1
	fi
}

addints() {
	#
	# this function adds a list of integers
	# given as arguments. It outputs the sum
	# to standard output
	#
	local sum=0 arg
	for arg; do
		#if ! echo "$arg" | grep -qE '^-?[0-9]+$'; then
		#if ! [[ "$arg" =~ ^-?[0-9]+$ ]]; then
		if ! isInt "$arg"; then
			echo "'$arg' is not an integer - skipped." >&2
			continue
		fi
		((sum = sum + arg))
	done
	echo "$sum"
}
