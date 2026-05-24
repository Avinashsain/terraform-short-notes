output "ec2_instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "ec2_instance_public_dns" {
  value = aws_instance.web_server.public_dns
}

output "ec2_instance_private_ip" {
  value = aws_instance.web_server.private_ip
}