#!/bin/bash

num=$1

[[ $# -ne 1 ]] && \
	echo "supply one number" && exit 1

[[ $num -gt 12 ]] && \
	echo "number too big" && exit 1

[[ $num -lt 1 ]] && \
	echo "number too small" && exit 1

case $num in
	1) echo "January" ;;
	2) echo "February" ;;
	3) echo "March" ;;
	4) echo "April" ;;
	5) echo "May" ;;
	6) echo "June" ;;
	7) echo "July" ;;
	8) echo "August" ;;
	9) echo "September" ;;
	10) echo "October" ;;
	11) echo "November" ;;
	12) echo "December" ;;
	*)	echo "bad argument: $1" ;;
esac
