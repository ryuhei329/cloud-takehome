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

# Directory Tree:

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


# Instruction:
## Preparation: 
AWS:
Use aws-cli command to configure your AWS access and secret key
1). "aws configure"
Follow the instructions and you will be entering your AWS access key and secret key.
You can also specified the same AWS region you will be specifying in main.tf
2). Placing your pem file in to ssh folder
Please place your aws private key pem file into ssh folder.
Also do not forget to run "chmod 600 your_key.pem" to protect the file.

Terraform:
1). main.tf  
There are a few things you might have to modify.

region: Please modify to your preferred AWS region if necessary
ami: Please modify this to AMI ID of your choice, base on the AWS region
key_name: Please modify this to your AWS access key account name

2). mod_ansible_yaml.py
This script can be used to modify playbook yaml file if you want to specify the hostname directly.
aws_ec2 is configured for Ansible, this is not necessary.

Ansible:
1). aws_ec2.yml
If you modify region in main.tf above, please modify regions accordingly.

2). playbooks/install_security_agent.yml
Please change the path/filename of pem file at line 6, "ansible_ssh_private_key_file:"
This is the file you obtained from prerequisite #3.

## How to run:
Terraform:
Once you have modified all necessary files above, you are ready to proceed with Terraform and Ansible
1. Go to terraform folder.
2. "terraform init" 
This will initialize your terraform environment.
3. "terraform plan"
This will show the preview of modification that terraform will be making on the cloud environment.
4. "terraform apply"
This will execute the preview above, and will take a few to complete the deployment.
Do not forget to type "yes" when prompted to proceed.
Up on completion, you will be able to obtain the IP addresses and hostname of the instance which has been created by terraform.

Ansible:
1. Go to ansible folder.
2. "ansible-playbook playbooks/install_security_agent.yml"
This playbook will execute following
(1). Create a folder, csg_security_agent under /opt
(2). Place the installer script and config file the instance created by Terraform
(3). Replace the token in the config file
(4). Execute the installer script

