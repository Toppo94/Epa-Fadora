#!/bin/bash

#This is a script to make a back up directory called backup located in the 
# github directory under week4

#iz switch will test if the expansion of $1 is a null string
if [ -z $1 & -z $2 ]
then
	echo "Problem !! not enough arguments passed in"
else 
	cp -r $1 $2
	echo "Completed "
fi


#copying the passed in path directory to a backup folder
#cp -r $1 $2
