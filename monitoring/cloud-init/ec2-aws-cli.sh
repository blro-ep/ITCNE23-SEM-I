#!/bin/bash

# script for testing aws

# variables
AWS_IMAGE="ami-0d497a49e7d359666"
AWS_REGION="eu-central-1"
INSTANCE_TYPE="t2.micro"
KEY_PAIR_NAME="id_aws"
SECURITY_GROUP_ID="sg-0039daece1b121b3d"
SUBNET_ID="subnet-0048567060ec9a34f"


# add inbound rules
aws ec2 authorize-security-group-ingress \
    --group-id $SECURITY_GROUP_ID \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0 \
    --query 'SecurityGroupRules[0].SecurityGroupRuleId' \
    --output text

# create ec2 instace
aws ec2 run-instances \
    --region $AWS_REGION \
    --image-id $AWS_IMAGE \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_PAIR_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID
   