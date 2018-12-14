#! /bin/sh

average() {
	local i sum=0
	for i; do
		((sum = sum + i))
	done
	if [ $# -eq 0 ]; then
		return 0
	else
		return $((sum / $#))
	fi
}

min() {
	local i small
	small=$1
	for i; do
		if [ $i -lt $small ]; then
			small=$i
		fi
	done
	return $small
}
