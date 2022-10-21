#!/bin/sh

	#You can setup your path here
minishell_path=../minishell_bonus
minishell_dir_path=../
#minishell_dir_path=${minishell_path::-9}

if [ -z "$1" ]
then
	test_dir=test_mandatory
else
	test_dir=$2
fi

red="\033[0;31m"
green="\033[0;32m"
reset="\033[0;39m"
test_li=$(ls ./$test_dir/*)
cyan="\033[0;36m"
#Setup a directory with a lot a testfile inside like mine and give the dirpath of your choice behind
printf "$cyan     _______. __    __   _______  __       __      .___________. _______     _______.___________. _______ .______      \n"
printf "    /       ||  |  |  | |   ____||  |     |  |     |           ||   ____|   /       |           ||   ____||   _  \     \n"
printf "   |   (----\`|  |__|  | |  |__   |  |     |  |     \`---|  |----\`|  |__     |   (----\`---|  |----\`|  |__   |  |_)  |    \n"
printf "    \   \    |   __   | |   __|  |  |     |  |         |  |     |   __|     \   \       |  |     |   __|  |      /     \n"
printf ".----)   |   |  |  |  | |  |____ |  \`----.|  \`----.    |  |     |  |____.----)   |      |  |     |  |____ |  |\  \----.\n"
printf "|_______/    |__|  |__| |_______||_______||_______|    |__|     |_______|_______/       |__|     |_______|| _| \`._____|"
printf "$reset\n\n"

printf "\npath : $minishell_dir_path\n"
(cd $minishell_dir_path && make -s)
#LOOP FILL MISHELL OUTPUT
loop_test() {
	i=0
	for file in $test_li
	do
		#may put something like : command \n your_output \n bash_ouput in 1 file by test
		printf "test $i: $file "
		cat $file | valgrind --log-fd=1 -q  --suppressions=readline_ignore.txt --leak-check=full  --show-leak-kinds=all $minishell_path 2>&- > ./minishell_output/minishell_output
		cat $file | bash  2>&- > ./expected_output/expected_output
		echo -n "cmd: " >> ./test_out/test_$i
		cat $file >> ./test_out/test_$i
		echo "bash output:" >> ./test_output/test_$i
		cat ./expected_output/expected_output >> ./test_output/test_$i
		echo "minishell output:" >> ./test_output/test_$i
		cat ./minishell_output/minishell_output >> ./test_output/test_$i
		DIFF=$(diff ./expected_output/expected_output ./minishell_output/minishell_output)
		if [ "$DIFF" ]
		then
			printf ": $red KO $reset\n"
		#	printf "diff : $DIFF\n"
		else 
			printf ": $green OK\n"
		fi
		printf "$reset"
		i=$((i + 1))
	done
}

loop_test
