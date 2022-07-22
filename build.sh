#!/bin/bash

generate_downloadartifacts_script() {
    # Let's get our current vault token
    VAULT_REPLACE_SCRIPT="s/{:VAULT_TOKEN:}/$(cat ~/.vault-token)/g"

    # if the downloadartifacts script already exists, delete it. We're going to replace it
    if [ -f "scripts/downloadartifacts.sh" ]; then
        rm scripts/downloadartifacts.sh
    fi

    # Replace the "token" in the download artifacts script.
    cp templates/downloadartifacts.sh.template scripts/downloadartifacts.sh
    sed -i -e $VAULT_REPLACE_SCRIPT scripts/downloadartifacts.sh
    chmod +x scripts/downloadartifacts.sh
}

generate_ansible_inventory () {
    if [ -f "playbook/inventory" ]; then
        rm playbook/inventory
        rm playbook/hosts
    fi

    cp templates/ansible_inventory.template playbook/inventory
    cp templates/hosts.template playbook/hosts
}

# Now we can run terraform
if [ "$1" == "apply" ]; then
    #generate_downloadartifacts_script
    generate_ansible_inventory
    terraform apply | tee terraform_run.log
    read -p "Terraform should be done. Continue?"
    
    cd playbook
    ansible-playbook -i inventory k8s-ping.yaml
    read -p "Ping test done. Continue?"

    ansible-playbook -i inventory k8s-dependencies.yaml
    read -p "Dependencies have been installed. Continue?"
    
    ansible-playbook -i inventory k8s-controller-setup.yaml
    read -p "Controller setup complete. Continue?"

    ansible-playbook -i inventory k8s-add-workers.yaml
    read -p "Worker nodes should be setup. Installation should be complete."
    
elif [ "$1" == "destroy" ]; then
    terraform destroy
elif [ "$1" == "clean" ]; then
    rm playbook/inventory
    rm playbook/hosts
    rm scripts/downloadartifacts.sh
    rm *.txt
fi
