#!/usr/bin/bash
# 
# All work by Kianna Crow
# https://github.com/kino-kishar
#
# cu-ecen-aeld/assignment-1-kino-kishar
# writer.sh
# invokes as "writer.sh /a-file a-writestring"

# Arguments:(1) file path (2) write string
# - if incorrect parameters -> return 1 and print statements
# - creates/overwrites a file with the write string

# Trap for error:

doerror(){
	echo 'Error creating/writing file.'
	echo 'Expected: writer.sh [file path] [write string]'
	exit 1
}
trap 'doerror' ERR

# Catch for wrong number of arguments:
if [ $# -lt 2 ]; then
	echo 'Incorrect number of arguments received.'
	echo 'Expected: writer.sh [file path] [write string]'
	exit 1
fi # [ $# -lt 2 ]

# Steal the first argument (which file):
filepath=$1 && shift
thedir="$(dirname "${filepath}")"
thefile="$(basename "${filepath}")"

# The rest of the args are the write string:
writestr=$@

echo $thedir
echo $thefile

# Make a directory if it doesn't already exist.
if ! [ -d $thedir ]; then
	mkdir -p $thedir || doerror					# Trap for fails
	echo Made a directory.
else
	echo "Didn't make a directory."
fi 

echo $writestr > $filepath

