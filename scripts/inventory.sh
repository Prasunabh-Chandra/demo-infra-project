#!/bin/bash

IP_LIST=$(terraform output -json public_ips | jq -r '.[]')

# Create inventory file
echo "[webservers]" > inventory.ini
for ip in $IP_LIST; do
  echo "$ip ansible_user=ec2-user ansible_ssh_private_key_file=~/my-key.pem" >> inventory.ini
done

echo "Inventory created:"
cat inventory.ini
