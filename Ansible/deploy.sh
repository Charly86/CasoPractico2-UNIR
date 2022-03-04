#!/bin/bash

# añadir tantas líneas como sean necesarias para el correcto despligue
ansible-playbook -i hosts -l deployKubernetes.yml
ansible-playbook -i hosts -l deployNFS-Server.yml
ansible-playbook -i hosts -l deployApp.yml
