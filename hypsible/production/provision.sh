#!/bin/bash

#-------------------------Do this before provision-----------------------------

# change ip's from inventory

# change some settings in ansible/group_vars/production/config.yml

#++++++++++++++++ansible/group_vars/production/env_variables.yml++++++++++++++++++++

# ---
# env_db_name: change_db_name
# env_db_user: change_db_user
# env_db_password: change_db_password
# env_secret_key_base: change_secret_key_base

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++++++++++++++++ansible/roles/deploy/templates/secrets.yml++++++++++++++++++++

# production:
#   secret_key_base: {{ env_secret_key_base }}
#   database:
#     host: localhost
#     username: {{ env_db_user }}
#     password: {{ env_db_password }}

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#------------------------------------------------------------------------------

ansible-playbook $@ -s -u deployer -i inventory ../ansible/site.yml --vault-password-file ~/ansible_vault/academia_n10.txt
