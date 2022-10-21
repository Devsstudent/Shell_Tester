test: create_dir
	(bash ./tester.sh $(path_shell) $(path_test))

create_dir:
	mkdir -p bash_output
	mkdir -p expected_output
	mkdir -p minishell_output_li
	mkdir -p minishell_output

clean:
	rm -rf bash_output
	rm -rf minishell_output_li
	rm -rf expected_output
	rm -rf minishell_output
