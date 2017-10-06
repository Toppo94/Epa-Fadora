#!/bin/bash

#This is a script to make a back up directory called backup located in the 
# github directory under week4

# $# variable will tell you the number of input arguments
# ! - d check if a  directory doesnt exist

if [ ! -d $1 ];
then
	echo $1" Doesnt exist"

elif [ $# -eq 0 ] || [ $# -eq 1 ] || [ ! -d $1 ];
then
	echo "Problem !! not enough arguments passed in"
else 
	cp -r $1 $2
	echo "Completed "
fi
