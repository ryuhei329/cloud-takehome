# cloud-takehome
===================

This is the README section for take home assignment.

Prerequisite:
Terraform version: 1.5.7
Ansible version: 2.15.4
AWS-cli version: 2.13.18


Configuring AWS authentication:
You will need to obtain followings
1. AWS Access Key ID
2. AWS Secret Access Key
3. Private Key file for ssh access

Please use "aws configure" to configure AWS access.
Place the private key file into ssh folder and make sure to "chmod 600" for security purpose.

Please make sure your AWS account is assigned to an AWS User Group which has policy to create EC2 instances.

=================================
Directory Tree:

cloud-takehome/

├── terraform/

│   ├── main.tf #Main Terraform file

│   ├── mod_ansible_yaml.py #Script to modify ansible playbook YAML file (not necessary)

│   ├── outputs.tf #Output Terraform file

│   ├── terraform.tfstate #Terraform state file

├── ansible/

│   ├── playbooks/

│   │   ├── install_security_agent.yml #Playbook YAML file for installing security agent

│   ├── files/

│   │   ├── security_agent_config.conf.j2 #Security Agent config file

│   │   └── security_agent_installer_linux_amd64_v1.0.0.sh #Security Agent installer script

│   ├── ansible.cfg #Ansible Config file

│   └── aws_ec2.yml #YAML configuration file for AWS EC2 inventory

│

├── ssh/

│   ├── your_key.pem #This will be your private key file

├── README.md

└── .gitignore


==================================
Instruction:

