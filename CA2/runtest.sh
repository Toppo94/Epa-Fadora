#!/bin/bash

tduration=3

echo -e "CO \t N \t Idle" > results.dat

for((i = 1; i <= $1; i++))
do

	./loadtest $i &
	output=$(mpstat $tduration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle')
	completions=$(cat synthetic.dat | wc -l)


echo -e "$completions \t $i \t $output" >> results.dat

echo "Done $i"

pkill loadtest

done
