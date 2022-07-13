#!/bin/python3
import os
import json
import urllib.request
import urllib.parse

# This will be a pass-through from Terraform
base_vault_addr = os.environ.get("VAULT_ADDR")
token = os.environ.get("VAULT_TOKEN")

url = 'https://vault.devops.kratosdefense.com/v1/kv/data/ServiceAccount/AutomationArtifactoryUser'
hdr = { 'X-Vault-Token' : token }
req = urllib.request.Request(url, headers=hdr)
response = urllib.request.urlopen(req)

returned_json = json.loads(response.read().decode('utf-8'))
artifactory_user = returned_json['data']['data']['username']
artifactory_password = returned_json['data']['data']['password']

# Write ARTIFACTORY_USER and ARTIFACTORY_PASSWORD values to file to be parsed by script later
print(f"export ARTIFACTORY_USER={artifactory_user}")
print(f"export ARTIFACTORY_PASSWORD={artifactory_password}")
