#!/bin/bash

i=108
j=0
while read -r line
do
	printf "$line"
	echo "$line" >> ./test_mandatory/test_$i
	if [ $((j % 2)) -eq 1 ]
	then
		i=$((i + 1))
	fi
	j=$((j + 1))
done < test_list_bis
