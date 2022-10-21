# Minishell Tester
- We made this tester to test our project faster than with your hand :)

### Usage
- Modify the minishell_path in tester.sh
- Then enter : make test
- You can clean : make clean
- You can choose the test directory : make path_test=the_path_of_your_choice
- Each test are in one file, we loop on every file in the test directory (Comparing bash and our shell)
- Output are stored in test_output directory :
	- cmd tested
	- bash_output
	- our_output
- If you want the diff to be displayed directly during the running time of the test : uncomment line 50 in the script

We provide some test, but you can create your own test, following the way the tester is working !
Don't hesitate to make your own tester, modify this one, understand it etc !

Kiss :*
