#!/bin/bash

until grep -q '169.254.169.250' /etc/resolv.conf; do
    sleep 1
done

METADATA="http://169.254.169.250/latest"
DATA=$(curl -s --header 'Accept: application/json' "$METADATA/self/")
PRIMARY_IP=$(echo $DATA | jq .container.primary_ip -r)
STACK_NAME=$(echo $DATA | jq .container.stack_name -r)
SERVICE_NAME=$(echo $DATA | jq .container.service_name -r)
NAME=$(echo $DATA | jq .container.name -r)
EXTERNAL_ID=$(echo $DATA | jq .container.external_id -r)
PHYSICAL_HOSTNAME=$(echo $DATA | jq .host.hostname -r)

exec serf agent \
  -protocol=3 \
  -advertise=$PRIMARY_IP \
  -discover="$STACK_NAME/$SERVICE_NAME" \
  -event-handler=/etc/serf/main_handler \
  -tag name="$NAME" \
  -tag external_id="$EXTERNAL_ID" \
  -tag physical_hostname="$PHYSICAL_HOSTNAME
