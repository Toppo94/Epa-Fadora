#!/bin/bash

echo -e "CO '\t' N '\t' Idle" > results.data

for((i = 1; i <= $1; i++))
do

./loadtest $1 &
output = $(mpstat $test_duration 1 -o JSON | jq 'sysstat.host[0].statistics[0]."cpu-load"[0].idle')
completions = $(cat synthetic.dat | wc -l)

echo -e "$completions \t $i \t $output" >> results.data
pkill loadtest
echo "Done $i"
done
fi
