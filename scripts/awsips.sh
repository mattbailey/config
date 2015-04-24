#!/usr/bin/env bash

regions="us-west-2\nus-east-1"

elbs=$(
printf $regions |
  xargs -I# -P2 aws --region=# elb describe-load-balancers --output text |
    grep internet-facing |
    awk '{print $2}' |
      xargs -I{} -P8 dig +short {}
)

pubips=$(
printf $regions |
  xargs -I# -P2 aws --region=# ec2 describe-instances --output text |
  grep 'ASSOCIATION' |
  awk '{print $NF}'
)

echo $pubips $elbs | tr ' ' '\n' | sort | uniq |xargs -P8 -I{} echo 'add_network {} 32' > /tmp/awsnetworks.txt
