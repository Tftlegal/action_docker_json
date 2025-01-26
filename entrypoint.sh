#!/bin/bash
set -e

#curl -s "https://get.sytes.ru/json/port_scan_results.json" | jq -r --arg ip "192.168.99.1" 'select(.ip? | index($ip)) | .open_ports| join(", ")'

api_url="https://get.sytes.ru/json/port_scan_results.json"
echo $api_url
open_port=$(curl -s "${api_url}" | jq -r --arg ip "${INPUT_IP}" '.[] | select(.ip == $ip) | .open_ports[]')
echo $open_port

echo "::set-output name=open_port::$open_port"


