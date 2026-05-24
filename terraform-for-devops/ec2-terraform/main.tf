# key pair
resource "aws_key_pair" "terraform_key_pair" {
  key_name   = var.key_pair_name
  public_key = file("${var.key_pair_name}.pub")
}

# vpc
resource "aws_default_vpc" "default_vpc" {}

# default subnet
resource "aws_default_subnet" "default_subnet" {
  availability_zone = var.availability_zone
}

# security group
resource "aws_security_group" "allow_ssh" {
  name        = "automated-ssh-access"
  description = "Automated security group to allow SSH access"
  vpc_id      = aws_default_vpc.default_vpc.id

  tags = {
    Name = "automated-ssh-access"
  }

  # ingress rule to allow SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  # ingress rule to allow HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from anywhere"
  }

  # ingress rule to allow 8000 access from anywhere
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 8000 access from anywhere"
  }

  # outbound rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

# ec2 instance
resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = aws_default_subnet.default_subnet.id
  user_data              = file("install_nginx.sh")
  root_block_device {
    volume_size = var.root_block_device_volume_size
    volume_type = var.root_block_device_volume_type
  }

  tags = {
    Name = "Terraform-Web-Server"
  }
}