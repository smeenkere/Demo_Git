#!/bin/bash

read X

read sizestr
sizes=($(echo $sizestr | tr " " "\n"))

read N

find_shoe () {
	for ((index=0; index<$X; index++))
	do
		size=${sizes[index]}
		if [ $size == $1 ]
		then
			echo $index
		fi
	done
	echo -1
}


sum=0
for ((counter=1; counter<=$N; counter++))
do
	read purchase
	purchase=($(echo $purchase | tr " " "\n"))
	declare -i size=${purchase[0]}
	declare -i price=${purchase[1]}

	let index=$(find_shoe $size)

	if [ $index -gt -1 ]
	then
		unset sizes[$index]
		let sum+=price
	fi
done

echo $sum
