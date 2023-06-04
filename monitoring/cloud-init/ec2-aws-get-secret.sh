#!/bin/bash

# get secret for gmail 
AWS_SECRET_GMAIL=$(aws secretsmanager get-secret-value --region eu-central-2 --secret-id prometheus_alertmanager | jq -r '.SecretString | fromjson | .email')

# set secret for alertmanager
sudo sed -i "s/xxxxxxxxxxx/$AWS_SECRET_GMAIL/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml
sudo sed -i "s/xxx@gmail.com/regormulb@gmail.com/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml


# delete secret
unset AWS_SECRET_GMAIL