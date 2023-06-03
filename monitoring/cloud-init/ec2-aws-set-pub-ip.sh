#!/bin/bash

# get aws local IPv4
AWS-LOCAL-IPV4=$(cloud-init query -a | jq -r '."ds"."meta-data"."local-ipv4"')

# set local ip for prometheus
sudo sed -i "s/xxx.xxx.xxx.xxx/$AWS-LOCAL-IPV4/g" /opt/ITCNE23-SEM-I/monitoring/prometheus/prometheus.yml