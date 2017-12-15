#!/bin/bash
## Time duration for each N test
tduration=3

##Formatting the header for the result test. The -e allows the \t(tabs) to be inserted
echo -e "CO \t N \t Idle" > results.dat

##standard for loop
for((i = 1; i <= $1; i++))
do
	##Run the loadtest along side using mpstat to receive the idle percentage and stored in the
	##variable output. The completions is gathered from the line count in the synthetic.dat file
	./loadtest $i &
	output=$(mpstat $tduration 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle')
	completions=$(cat synthetic.dat | wc -l)

##print the CO , N and Idle values in the same format as the head
echo -e "$completions \t $i \t $output" >> results.dat
#echo to the console to let me know when each cycle is complete
echo "Done $i"
##kill the loadtest and finish the script
pkill loadtest

done
