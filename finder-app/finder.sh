#!/usr/bin/bash
# declare STRING variable
STRING="Hello World"
# print STRING on screen
echo $STRING

# Arguments:
# - path to directory "filesdir"
# - text string to search for within files "searchstr"
# - if incorrect parameters return 1 and print statements
# - if "filesdir" is not a directory return 1 and print statements
# - if ok print "The number of files are X and the number of matching lines are Y"
# - invokes as "finder.sh /tmp/aesd/assignment1 linux"

# Get args and parse

args=("$@") #create an array of the arguments

# Catch for wrong number of arguments:
echo Number of arguments passed: $#
if [ $# -lt 2 ]; then

	echo 'Incorrect number of arguments received.'
	echo 'Expected: finder.sh [directory] [search string]'
	exit 1
fi

# Extract arguments:
filesdir=${args[0]}
unset args[0]
searchstr=${args[*]}
echo The files are $filesdir and the searchstr is $searchstr.

# Match filesdir to directory:
dirmatches="$(find "$filesdir" -type d)"
echo $dirmatches  ################################################## Implement catches!

# Match files in filesdir with searchstr:

