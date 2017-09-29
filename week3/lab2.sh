#!/bin/bash

#this is a cpu counting script

amount = `grep "processor" /pro/cpuinfo | wc -l`
if [ $amount -le 2]; then
	echo "less than 2 processors"
fi

