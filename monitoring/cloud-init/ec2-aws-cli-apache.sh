#!/bin/bash

# script for testing aws

# variables
AWS_IMAGE="ami-04dbb668869bef978"
AWS_REGION="eu-central-2"
INSTANCE_TYPE="t3.micro"
SECURITY_GROUP_ID="sg-08247dc225eecc759"
SUBNET_ID="subnet-0ea0164c607c3531c"
PROFILE="Roger"

# create ec2 instace
aws ec2 run-instances --profile $PROFILE \
    --region $AWS_REGION \
    --image-id $AWS_IMAGE \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --iam-instance-profile Name="SecretsManager" \
    --user-data file://cloud-init-apache.yaml
