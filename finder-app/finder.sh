#!/usr/bin/bash
# 
# All work by Kianna Crow
# https://github.com/kino-kishar
#
# cu-ecen-aeld/assignment-1-kino-kishar
# finder.sh
# invokes as "finder.sh /a-directory a-searchstring"

# Arguments:(1) directory (2) search string
# - if incorrect parameters or non-directory -> return 1 and print statements
# - echo "The number of files are X and the number of matching lines are Y"

# Catch for wrong number of arguments:
if [ $# -lt 2 ]; then
	echo 'Incorrect number of arguments received.'
	echo 'Expected: finder.sh [directory] [search string]'
	exit 1
fi # [ $# -lt 2 ]

# Steal the first argument (which directory):
filesdir=$1 && shift
# The rest of the args are the search string:
searchstr=$@
#echo '1 filesdir: ' $filesdir
#echo '2 searchstr: ' $searchstr

# Catch for non-directory in argument one:
if ! [ -d $filesdir ]; then
	echo 'No such directory.'
	echo 'Expected: finder.sh [directory] [search string]'
	exit 1
fi # ! [ -d $filesdir ]

# Make a list of all the matching directories and their subdirectories.
dirmatches="$(find "$filesdir" -type d)"

#echo '3 dirmatches: ' $dirmatches

# - Crawl through the directories
# - In each directory, find and count each file non-recursively
# - In each file, count the number of lines matching the search string
filescount=0 && linescount=0
for eachdir in $dirmatches; do
	
	filematches=$(find $eachdir -maxdepth 1 -type f) # Extract a list of files in the current directory.
	let filescount+=${#filematches[@]} # Add the count of files found.
	
	for eachfile in $filematches; do
		#echo '4 searchstr: ' $searchstr 
		#echo '5 eachfile: ' $eachfile
		let linescount+=$(grep "${searchstr}" $eachfile -c) # For each file, search for the string.
	done # eachfile in $eachdir
	
done # eachdir in $dirmatches

echo "The number of files are" $filescount "and the number of matching lines are" $linescount
exit 0

