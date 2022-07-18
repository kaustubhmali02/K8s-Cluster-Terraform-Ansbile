Created, configured an aws infrastructure using terraform and ansible. Used docker to containerize the web-application using CDCI pipeline with Jenkins.

# Installations: 

## Build our infrastructure using terraform on AWS [./terraform]
## Install Terraform in your local system:
More info: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

## Add the AWS Access keys to terraform\aws_config.tf
- access_key
- secret_key

## Initialize, plan and apply the terraform directory in ./terraform
- terraform init
- terraform plan
- terrafrom apply

## Install anisble in controller-instance
More info: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu

## Clone the repo in controller
git clone https://github.com/kaustubhmali02/devops-capstone-project-2.git

## Configure ssh keys [root/user] for ansible and add the private ips to /etc/ansible/hosts
 - controller [ansible-master && jenkins master]
 - kubernetes-master
 - k-node-1
 - k-node-2

To check if all servers are configured properly [ping and pong]
ansible -m ping all [regular user]
sudo ansible -m ping all [root user]

## Once everything is up and running will move on with ansible to configure out infrastructure [./ansible]
Run all the ansible manifest files to configure all the ec2 intances with the required packages
- anisble-playbook ansible\install-required-controller.yaml
- ansible-playbook ansible\install-required-kube-cluster.yaml
- ansible-playbook ansible\install-required-kube-master.yaml
- ansible-playbook ansible\join-nodes-to-cluster.yaml

## Connect the kubernetes-master node using ssh for Jenkins-Master [controller] 
 
## Create a jenkins project using groovy script ./jenkins-pipeline-prod 