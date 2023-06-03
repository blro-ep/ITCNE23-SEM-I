#!/bin/bash

# get aws local IPv4
AWS_LOCAL_IPV4=$(cloud-init query -a | jq -r '."ds"."meta-data"."local-ipv4"')

# set local ip for prometheus
sudo sed -i "s/xxx.xxx.xxx.xxx/$AWS_LOCAL_IPV4/g" /opt/ITCNE23-SEM-I/monitoring/prometheus/prometheus.yml