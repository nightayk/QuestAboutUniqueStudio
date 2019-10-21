#!/bin/bash

NUM=$1
RET=1

expr $NUM + 1 &>/dev/null #看输入的是否是整数
if [ $? -ne 0 ]
then
	ehco "Input error!"
	exit -1
fi

if [ $NUM -le 0 ]
then
	echo "Please input a number larger than 0"
fi


function fac(){
	local L_NUM=$1
	local L_NUM_SUB=$(bc << EOF
	( $L_NUM - 1 )
EOF
	)
	if [ $1 -lt 1 ]
	then
		RET=1
	else
		fac $L_NUM_SUB
		RET=$(bc << EOF
	( $L_NUM * $RET )
EOF
	)
	fi
}

fac $NUM
echo $RET
exit 0
