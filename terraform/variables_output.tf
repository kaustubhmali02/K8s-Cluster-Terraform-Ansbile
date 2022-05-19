# variable_output.tf
 
# Variables to show after the deployment
#########################################
 
output "public_ip_controller" {
  value = aws_instance.controller.public_ip
}

output "public_ip_kubernetes_master" {
  value = aws_instance.kubernetes-master.public_ip
}

output "public_ip_k_node_1" {
  value = aws_instance.k-node-1.public_ip
}

output "public_ip_k_node_2" {
  value = aws_instance.k-node-2.public_ip
}