#!/bin/bash

# Configurar el cluster de kubernetes
ansible-playbook -i hosts -l deployKubernetes.yml
# Configurar el cluster el servidor NFS
ansible-playbook -i hosts -l deployNFS-Server.yml
# Desplegar la app
ansible-playbook -i hosts -l deployApp.yml
