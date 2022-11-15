#!/bin/bash
add() {
	ans1=$(($1 + $2))
	let ans2=($1 + $2)
	ans3=`expr $1 + $2`
}
sub() {
	ans1=$(($1 - $2))
	let ans2=($1 - $2)
	ans3=`expr $1 - $2`
}
mult() {
	ans1=$(($1 * $2))
	let ans2=($1 * $2)
	ans3=`expr $1 * $2`	
}
div() {
	ans1=$(($1 / $2))
	let ans2=($1 / $2)
	ans3=`expr $1 / $2`	
}
op=$1 ; arg1=$2 ; arg2=$3
[[ $# -lt 3 ]] && \
	echo "Usage: give an operation (a,s,m,d) and two numbers" && exit 1

[[ $op != a ]] && [[ $op != s ]] && [[ $op != m ]] && [[ $op != d ]] && \
	echo "operator must be a,s,d,m not $op"

if [[ $op == a ]] ; then add $arg1 $arg2
elif [[ $op == s ]] ; then sub $arg1 $arg2
elif [[ $op == m ]] ; then mult $arg1 $arg2
elif [[ $op == d ]] ; then div $arg1 $arg2
else
	echo $op is not valid ; exit 2
fi

echo $arg1 $op $arg2 :
echo $ans1
echo $ans2
echo $ans3
