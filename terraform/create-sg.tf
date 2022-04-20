# create-sg.tf

resource "aws_security_group" "sg" {
  name        = "${var.owner}-sg"
  description = "Allow inbound traffic via SSH"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  description       = "All traffic"
  protocol          = var.sg_egress_proto
  from_port         = var.sg_egress_all
  to_port           = var.sg_egress_all
  cidr_blocks       = [ var.sg_egress_cidr_block ]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  description       = "All traffic"
  protocol          = var.sg_ingress_proto
  from_port         = var.sg_ingress_ssh
  to_port           = var.sg_ingress_ssh
  cidr_blocks       = [ var.sg_ingress-cidr_block ]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  description       = "HTTP Port"
  protocol          = var.sg_ingress_proto
  from_port         = var.sg_ingress_http
  to_port           = var.sg_ingress_http
  cidr_blocks       = [ var.sg_ingress-cidr_block ]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_kube_api" {
  type              = "ingress"
  description       = "Kubernetes API server"
  protocol          = var.sg_ingress_proto
  from_port         = var.sg_ingress_kube_api_server
  to_port           = var.sg_ingress_kube_api_server
  cidr_blocks       = [ var.sg_ingress-cidr_block ]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_nodePort_port" {
  type              = "ingress"
  description       = "Kubernetes API server"
  protocol          = var.sg_ingress_proto
  from_port         = var.sg_ingress_nodePort_service
  to_port           = var.sg_ingress_nodePort_service
  cidr_blocks       = [ var.sg_ingress-cidr_block ]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = aws_security_group.sg.id
}

#   ingress = [{
#     description      = "My public IP"
#     protocol         = var.sg_ingress_proto
#     from_port        = var.sg_ingress_ssh
#     to_port          = var.sg_ingress_ssh
#     cidr_blocks      = [var.sg_ingress-cidr_block]
#     ipv6_cidr_blocks = []
#     prefix_list_ids  = []
#     security_groups  = []
#     self             = false
 
#   }]
 
#   egress = [{
#     description      = "All traffic"
#     protocol         = var.sg_egress_proto
#     from_port        = var.sg_egress_all
#     to_port          = var.sg_egress_all
#     cidr_blocks      = [var.sg_egress_cidr_block]
#     ipv6_cidr_blocks = []
#     prefix_list_ids  = []
#     security_groups  = []
#     self             = false
 
#   }]
 
#   tags = {
#     "Owner" = var.owner
#     "Name"  = "${var.owner}-sg"
#   }
# }

