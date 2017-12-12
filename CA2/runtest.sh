#!/bin/bash

test_duration=3

echo -e "CO \t N \t Idle" > results.data

for((i = 1; i <= $1; i++))
do

./loadtest $1 &
output = $( mpstat $test_duration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle')
pkill loadtest

completions = $( cat synthetic.dat | grep -c "Transation Complete")


echo -e "$completions \t $i \t $output" >> results.data

echo "Done $i"
done
fi
