resource "aws_instance" "bastion" {
  ami           = "ami-0ee82191e264e07cc"  # Amazon Linux 2 AMI (region-specific) seoul
  instance_type = "t2.micro"
  subnet_id     = var.subnets_public_ids[0]
  key_name      = "bastion_key"  # SSH key

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y docker
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  EOF

  tags = {
    Name = "${var.common_info.env}-${var.common_info.service_name}-bastion-server"
  }
}
