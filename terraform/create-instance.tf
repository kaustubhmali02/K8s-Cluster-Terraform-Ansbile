# create-instance.tf

resource "aws_instance" "controller" {
  ami                         = data.aws_ami.amazon_linux.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-controller"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "kubernetes-master" {
  ami                         = data.aws_ami.amazon_linux.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type_kubemaster
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-kubernetes-master"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "k-node-1" {
  ami                         = data.aws_ami.amazon_linux.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-k-node-1"
    "KeepInstanceRunning" = "false"
  }
}

resource "aws_instance" "k-node-2" {
  ami                         = data.aws_ami.amazon_linux.id
  availability_zone           = data.aws_availability_zones.available.names[0]
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-k-node-2"
    "KeepInstanceRunning" = "false"
  }
}