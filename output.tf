output "public_ip" {
  value = aws_lightsail_instance.server.public_ip_address
}
output "username" {
  value = aws_lightsail_instance.server.username
}

output "ssh-command" {
  value = "ssh -i ${local_file.ssh_key.filename} ${aws_lightsail_instance.server.username}@${aws_lightsail_instance.server.public_ip_address}"
}