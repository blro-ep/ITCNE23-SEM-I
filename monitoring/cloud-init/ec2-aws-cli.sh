#!/bin/bash

# script for testing aws

# variables
AWS_IMAGE="ami-04dbb668869bef978"
AWS_REGION="eu-central-2"
INSTANCE_TYPE="t3.micro"
KEY_PAIR_NAME="id_aws"
SECURITY_GROUP_ID="sg-06007a2972577f41e"
SUBNET_ID="subnet-0b146988807ff7349"



# create ec2 instace
aws ec2 run-instances \
    --region $AWS_REGION \
    --image-id $AWS_IMAGE \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_PAIR_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --user-data file://cloud-config-podman.yaml
   