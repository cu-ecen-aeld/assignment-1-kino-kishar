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

# Catch for wrong number of arguments:
if [ $# -lt 2 ]; then
	echo 'Incorrect number of arguments received.'
	echo 'Expected: writer.sh [file path] [write string]'
	exit 1
fi # [ $# -lt 2 ]

# Steal the first argument (which file):
filepath=$1 && shift
# The rest of the args are the write string:
writestr=$@

