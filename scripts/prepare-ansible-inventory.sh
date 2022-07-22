#!/bin/bash

echo "Directory: `pwd`"

if [ "$1" == "primary" ]; then
    echo "Replacing primary server IP in ansible inventory with $2"
    sed -i "s/{:primary_server_ip:}/$2/g" playbook/inventory
    sed -i "s/{:primary_server_ip:}/$2/g" playbook/hosts
fi

if [ "$1" == "secondary" ]; then
    echo "Replacing secondary server IP in ansible inventory with $2"
    sed -i "s/{:secondary_server_ip:}/$2/g" playbook/inventory
    sed -i "s/{:secondary_server_ip:}/$2/g" playbook/hosts
fi
