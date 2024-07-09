#!/usr/bin/bash
# 
# All work by Kianna Crow
# cu-ecen-aeld/assignment-1-kino-kishar
# finder.sh
#

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
# echo Number of arguments passed: $#
if [ $# -lt 2 ]; then

	echo 'Incorrect number of arguments received.'
	echo 'Expected: finder.sh [directory] [search string]'
	exit 1
fi # [ $# -lt 2 ]

# Extract arguments:
filesdir=${args[0]}
unset args[0]
searchstr=${args[*]}
# echo The files are $filesdir and the searchstr is $searchstr.

# Match filesdir to directory:
dirmatches="$(find "$filesdir" -type d)"
echo 'dirmatches: ' $dirmatches  ################################################## Unfinished catches!

# For each directory matched and it's subdirectories:
filescount=0
linescount=0
for eachdir in $dirmatches; do
	
	echo 'eachdir: ' $eachdir
	filematches=$(find $eachdir -maxdepth 1 -type f) # Removed recursion.
	let filescount+=${#filematches[@]}
	echo 'number of files found: ' $filescount
	for eachfile in $filematches; do
		echo 'eachfile: ' $eachfile
		
		let linescount+=$(grep $searchstr $eachfile -c)
		echo 'grep count: ' $linescount
	done # eachfile in $eachdir
	
done # eachdir in $dirmatches

echo "The number of files are" $filescount "and the number of matching lines are" $linescount







