# cloud-takehome
===================

This is the README section for take home assignment.

## Prerequisite

Ensure that you have the following software versions installed before proceeding

Terraform version: 1.5.7  
Ansible version: 2.15.4  
AWS Command Line Interface (AWS CLI) version: 2.13.18  

**Configuring AWS Authentication:**

In order to proceed with the project, you will need to obtain the following AWS credentials:

AWS Access Key ID  
AWS Secret Access Key  
A private key file for SSH access  

To configure AWS access, use the aws configure command. Additionally, place the private key file into the "ssh" folder, and ensure that its permissions are set to "chmod 600" for enhanced security.

Please ensure that your AWS account is associated with an AWS User Group that has the necessary permissions to create EC2 instances. This will allow you to successfully complete the tasks outlined in this assignment.

# Directory Tree:

- cloud-takehome/  
  - terraform/  
    - main.tf  
      #Main Terraform file  
    - mod_ansible_yaml.py  
      #Script to modify ansible playbook YAML file (not necessary)  
    - outputs.tf  
      #Output Terraform file  
  - ansible/  
    - playbooks/  
      - install_security_agent.yml   
        #Playbook YAML file for installing security agent  
    - files/  
      - security_agent_config.conf.j2  
        #Security Agent config file  
      - security_agent_installer_linux_amd64_v1.0.0.sh  
        #Security Agent installer script  
    - ansible.cfg  
      #Ansible Config file  
    - aws_ec2.yml   
      #YAML configuration file for AWS EC2 inventory  
  - ssh/  
    - your_key.pem  
      #This will be your private key file. You can rename as you like.  
  - README.md  
  - .gitignore  

# Instruction:
## Preparation: 
**AWS Configuration:**

To set up your AWS access and secret key, make use of the aws-cli command-line utility. Follow these steps:

Run the command `aws configure`.

Adhere to the prompts and instructions that follow. You'll be prompted to input your AWS access key and secret key during this process. It's advisable to specify the same AWS region as you intend to specify in your `main.tf` configuration file.

**Private Key Placement:**

For SSH access, ensure you perform the following steps:

Locate your AWS private key PEM file and position it within the designated "ssh" folder.

Additionally, it is crucial to execute the command `chmod 600 your_key.pem` in order to enforce stringent file permissions and enhance the file's security.


### Terraform Configuration:

1. **main.tf**
There are a few aspects within the `main.tf` file that you may need to customize:

**Region:** If needed, please adjust the `region` parameter to match your preferred AWS region.  
**AMI:** Modify the `ami` parameter to match your chosen AMI ID, depending on your selected AWS region.  
**key_name:** Customize the `key_name` parameter with your AWS access key account name.  

2. **mod_ansible_yaml.py**  
The provided script, `mod_ansible_yaml.py`, offers the capability to modify playbook YAML files, allowing for direct hostname specification. Please note that the configuration for `aws_ec2` in Ansible is pre-configured and may not be necessary for this use case.

Feel free to tailor these configurations to meet your specific requirements.

### Ansible Configuration:

1. **aws_ec2.yml**  
Should you decide to modify the AWS region in the `main.tf` configuration mentioned above, it's essential to reflect these changes appropriately within the `aws_ec2.yml` file.

2. **playbooks/install_security_agent.yml**  
Within the playbook file located at `playbooks/install_security_agent.yml`, kindly adjust the path and filename specified in line 6, denoted as "ansible_ssh_private_key_file:". This refers to the private key file obtained during prerequisite.

Please ensure that these modifications align with your specific configuration requirements.

## How to run:
### Terraform Setup and Deployment Instructions:

Once you have made all the necessary adjustments to the files mentioned earlier, you are now prepared to proceed with the Terraform and Ansible deployment process.

(1) Navigate to the Terraform Folder:  
Begin by navigating to the Terraform folder within your project directory.

(2) Initialize Terraform:  
Execute the command `terraform init`. This action initializes your Terraform environment, setting it up for use.

(3) Preview the Infrastructure Changes:  
Utilize the command `terraform plan` to preview the modifications that Terraform intends to make to your cloud environment. This step allows you to review the planned changes before applying them.

(4) Apply the Terraform Configuration:  
Apply the configuration by running `terraform apply`. This command executes the changes outlined in the preview, initiating the deployment process. Please be patient, as this step may take a few moments to complete. When prompted, ensure to confirm by typing "yes" to proceed.

Upon successful completion of the deployment, you will receive the IP addresses and hostname information of the instance that Terraform has created.

### Ansible Deployment Instructions:

To initiate the Ansible deployment process, follow these steps:

(1) Navigate to the Ansible Directory:  
Begin by navigating to the Ansible folder within your project directory.

(2) Execute the Ansible Playbook:  
Run the following command: `ansible-playbook playbooks/install_security_agent.yml`. This playbook is responsible for performing the following tasks:

1. Creation of a folder named `csg_security_agent` under `/opt`.  
2. Placement of the installer script and configuration file onto the instance previously created by Terraform.  
3. Substitution of the token in the configuration file.  
4. Execution of the installer script.  

This playbook automates the deployment of the security agent and ensures that the necessary configurations are in place

This marks the conclusion of the Terraform/Ansible deployment process


