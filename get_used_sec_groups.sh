#!/bin/bash

aws ec2 describe-instances | \
 jq '.[] | .[] | .Instances | .[] | (.SecurityGroups[]|select(.GroupId)|.GroupId)' | \
 sort | uniq
