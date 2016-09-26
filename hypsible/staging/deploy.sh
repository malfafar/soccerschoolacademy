#!/bin/bash

ansible-playbook $@ -i inventory ../ansible/deploy.yml --vault-password-file ~/ansible_vault/academia_n10_staging.txt
