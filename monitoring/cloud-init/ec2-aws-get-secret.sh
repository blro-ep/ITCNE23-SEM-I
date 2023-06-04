#!/bin/bash

# get secret for gmail 
AWS_SECRET_MAILADDRESS=$(aws secretsmanager get-secret-value --region eu-central-2 --secret-id prometheus_alertmanager | jq -r '.SecretString | fromjson | .email')
AWS_SECRET_GMAILPW=$(aws secretsmanager get-secret-value --region eu-central-2 --secret-id prometheus_alertmanager | jq -r '.SecretString | fromjson | .password')

# set secret for alertmanager
sudo sed -i "s/xxx@gmail.com/$AWS_SECRET_MAILADDRESS/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml
sudo sed -i "s/xxxxxxxxxxx/$AWS_SECRET_GMAILPW/g" /opt/ITCNE23-SEM-I/monitoring/alertmanager/alertmanager.yml



# delete secret
unset AWS_SECRET_MAILADDRESS
unset AWS_SECRET_GMAILPW