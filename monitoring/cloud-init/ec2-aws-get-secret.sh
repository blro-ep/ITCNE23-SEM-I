#!/bin/bash

# get secret for gmail 
AWS_SECRET_GMAIL=$(aws secretsmanager get-secret-value --region eu-central-2 --secret-id test | jq -r '.SecretString | fromjson | .gmail'

# set secret for alertmanager
sudo sed -i "s/xxxxxxxxxxx/$AWS_SECRET_GMAIL/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml