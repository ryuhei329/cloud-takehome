#!/usr/bin/python3

import re
import subprocess

ymlfile = '../ansible/playbooks/install_security_agent.yml'
output = subprocess.getoutput("terraform output")
output = output.splitlines()
dict = {}
for line in output:
    line = ''.join(line.split())
    key, value = line.split('=')
    value = value.replace('"', '')
    dict[key] = value

new_text = "- hosts: " + dict['instance_public_dns']

# Read the YAML file
with open(ymlfile, 'r') as file:
    yaml_content = file.read()

# Use a regular expression to find and replace the line
pattern = r"- hosts:\s*[\S]+"
yaml_content = re.sub(pattern, new_text, yaml_content, count=1)

# Write the modified content back to the file
with open(ymlfile, 'w') as file:
    file.write(yaml_content)
