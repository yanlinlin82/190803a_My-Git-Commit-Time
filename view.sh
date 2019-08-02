#!/bin/bash

view() {
	cut -c12-13 | sort | uniq -c | awk '{a[$2]=$1;if(m<$1)m=$1}END{for(i in a){printf("%s | %3d ", i, a[i]);for(k=0;k<a[i]*10/m;++k){printf"*"};print""}}' | sort
}

if [ -t 0 -a -z "$1" ]; then
	echo "Usage: $0 <data/xxx.txt.gz>"
	exit 1
fi
if [ -z "$1" ]; then
	view
else
	zcat "$1" | view
fi
