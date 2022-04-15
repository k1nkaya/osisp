
#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Unexpected number of parameters"
	echo "write down 2 parameters:"
	echo "1) word which u need to find"
	echo "2) directory where u need to find the word"
	echo "example: ./1.sh aboba ."
else
	if [ ! -d "$2" ]; then
		if [ ! -e "$2" ]; then
			echo "error: no directory with name $2" >&2
		else
			echo "error: $2 is not a directory" >&2
		fi
	else
		du -bsh  $(find $(grep -Ril "$1" $2) -type f) | sort -n 
	fi
fi


