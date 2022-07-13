#!/bin/bash

###
# Phase 0 Set environment variables
###

# Point Vault in the right direction
export VAULT_ADDR="https://vault.devops.kratosdefense.com"
export VAULT_TOKEN=s.cPEYFNKjgP4pAZ3QucBnaF4e

###
# Phase 1 Prerequisites
###
sudo yum install -y python3

# Get Vault Credentials into environment variables
`python3 get-vault-credentials.py`

###
# Phase 2 Prerequisites and base level packages
###
sudo yum install -y epel-release /tmp/yum-epel-release.log 2>&1
sudo yum update -y
sudo yum install -y chrony tmux unzip

# Get packages from Artifactory
curl -o vault_1.5.4_linux_amd64.zip --user $ARTIFACTORY_USER:$ARTIFACTORY_PASSWORD https://bits.devops.kratosdefense.com/artifactory/thirdparty-hashicorp-packages-local/vault/linux/vault_1.5.4_linux_amd64.zip
curl -o jq-linux64 --user $ARTIFACTORY_USER:$ARTIFACTORY_PASSWORD https://bits.devops.kratosdefense.com/artifactory/thirdparty-misc-packages-local/jq/jq-linux64
curl -o chef-16.6.14-1.el7.x86_64.rpm --user $ARTIFACTORY_USER:$ARTIFACTORY_PASSWORD https://bits.devops.kratosdefense.com/artifactory/thirdparty-chef-packages-local/chef-infra-client/16/chef-16.6.14-1.el7.x86_64.rpm

unzip vault_1.5.4_linux_amd64.zip
mv jq-linux64 jq
chmod +x jq

# Moving vault and jq to a more permanent location
sudo mv vault /usr/bin/vault
sudo mv jq /usr/bin/jq

# Moving the chrony config to the correct place
sudo mv /tmp/chrony.conf /etc/chrony.conf
sudo systemctl restart chrony
