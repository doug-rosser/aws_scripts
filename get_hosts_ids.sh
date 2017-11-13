#!/bin/bash

aws ec2 describe-instances --filters "Name=tag:created_by,Values=drosser" | \
 jq '.[] | .[] | .Instances | .[] | select(.State.Name == "running") | '\
'(.Tags[]|select(.Key=="Name")|.Value), .InstanceId'
