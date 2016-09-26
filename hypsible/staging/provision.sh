#!/bin/bash

ansible-playbook $@ -s -u deployer -i inventory ../ansible/site.yml --vault-password-file ~/ansible_vault/academia_n10_staging.txt
