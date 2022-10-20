#!/bin/bash

i=0
j=0
while read -r line
do
	printf "$line"
	echo "$line" >> ./test_shit/$i\__test
	if [ $((j % 2)) -eq 1 ]
	then
		i=$((i + 1))
	fi
	j=$((j + 1))
done < test_list_bis
