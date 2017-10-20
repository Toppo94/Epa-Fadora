#!/bin/bash


aws ec2 describe-instance-status --instance-id $1 --query InstanceStatuses[*].InstanceStateName.Name --output  text

