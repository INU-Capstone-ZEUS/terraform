# Create RSA key of size 4096 bits
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create local file
resource "local_file" "bastion_key" {
  content  = tls_private_key.bastion_key.private_key_pem
  filename = "./bastion_key.pem"
}

# Create AWS key pair
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_key"
  public_key = tls_private_key.bastion_key.public_key_openssh
}