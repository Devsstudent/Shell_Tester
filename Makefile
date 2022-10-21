test: clean create_dir
	(bash ./tester.sh $(path_test))

test_bonus: clean create_dir
	(bash ./tester.sh $(path_test))

create_dir:
	mkdir -p expected_output
	mkdir -p minishell_output
	mkdir -p test_output

clean:
	rm -rf bash_output
	rm -rf expected_output
	rm -rf test_output
	rm -rf cat
	rm -rf a
