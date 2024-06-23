# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "aws_lightsail_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_lightsail_key_pair" "aws_lightsail_key2" {
  name       = "wk9d1"
  public_key = tls_private_key.aws_lightsail_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "wk9d1.pem"
  content  = tls_private_key.aws_lightsail_key.private_key_pem
}
resource "aws_lightsail_instance" "server" {
  name              = "lampserver"
  availability_zone = "us-east-1a"
  blueprint_id      = "centos_7_2009_01"
  bundle_id         = "medium_1_0"
  key_pair_name     = "wk9d1"
}