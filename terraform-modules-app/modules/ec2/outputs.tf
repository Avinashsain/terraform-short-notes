output "Public_IP" {
    value = aws_instance.web_server[*].public_ip
}