#!/bin/bash
str1=$1 ; str2=$2

[[ $# -lt 2 ]] && \
	echo "Usage: give 2 strings" && exit 1

[[ $# -gt 2 ]] && \
	echo "Usage: give 2 strings" && exit 1

len1=${#str1} ; len2=${#str2}

echo "$str1 is $len1 characters long"
echo "$str2 is $len2 characters long"

[[ $len1 -lt $len2 ]] && \
	echo "$str2 is longer than $str1" && exit 0

[[ $len2 -lt $len1 ]] && \
	echo "$str1 is longer than $str2" && exit 0

echo "$str1 and $str2 are the same length"

[[ $str1 == $str2 ]] && \
	echo "$str1 and $str2 are the same string"


	
