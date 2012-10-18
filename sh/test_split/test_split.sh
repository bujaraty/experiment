#!/usr/bin/env bash
while read line
do
    arr=$(echo $line | tr "," "\n")
    for x in $arr
    do
	res=$(echo $x | cut -d'|' -f 2 )
	#res=$(echo $x | sed 's/.*|//g' )
	if [ ${res:0:4} != "ENST" ]
	then
	    if [ ${res:0:4} != "CCDS" ]
	    then
		echo ${res:0:4}
	    fi
	fi

    done
done < $1
