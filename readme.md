# Config File Parser
This program will parse a config file and store it as a ruby hash. The desired value of a config_parameter can be assessed as follows =>

## Using this program
In order to use this program, run the parser in your terminal using the following structure of command:

$ ruby parser.rb config server_load_alarm

### Arguments
1. First argument 'ruby' refers to invoking the ruby interpreter.
2. Second argument 'parser.rb' refers to the path/name of the program to be run.
3. Third argument 'config' refers to the path/name of the config file you wish to pass in to the program.
4. Fourth argument refers to the config parameter whose value you wish to assess.

## Example
When we run:
$ ruby parser.rb config host
We will get the following output in the terminal:
![Terminal Output](/terminal.JPG)

## Notes
1. If the user queries for a value of a config_parameter that did not exist in the config file, then the program will inform the user of this and exit.
2. The program needs two arguments in order to run (items 3 and 4 in 'Arguments' list above), if an incorrect number of arguments are given, the program will inform the user of this and exit.