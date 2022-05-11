# Installations: 

# Build our infrastructure using terraform on AWS [./terraform]
## Install Terraform in your local system:
More info: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

## Add the AWS Access keys to terraform\aws_config.tf
- access_key
- secret_key

## Initialize, plan and apply the terraform directory in ./terraform
- terraform init
- terraform plan
- terrafrom apply

## Configure ssh keys [root/user] once the instances are up and running.
 - controller [ansible-master && jenkins master]
 - kubernetes-master
 - k-node-1
 - k-node-2

## 

## Once everything is up and running will move on with ansible to configure out infrastructure [./ansible] 
