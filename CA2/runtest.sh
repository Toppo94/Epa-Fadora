#!/bin/bash


#for i {1..50}
#do
#./loadtest
#timeout 1s 
#done


./loadtest 2
 mpstat -A 2 >> results.dat
#mpstat -A >> results.dat
echo "done" >> results.dat

