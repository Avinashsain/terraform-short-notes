# key pair
resource "aws_key_pair" "terraform_key_pair" {
  key_name   = "${var.environment}-dc-terraform-key-pair"
  public_key = file("${path.module}/terra-key-ec2.pub") 

  tags = {
    Name = "${var.environment}-dc-terraform-key-pair"
    Environment = var.environment
  }
}

# vpc
resource "aws_default_vpc" "default_vpc" {}

# default subnet
data "aws_subnet" "default_subnet" {
  count             = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# security group
resource "aws_security_group" "allow_ssh" {
  name        = "${var.environment}-terraform-sg"
  description = "Automated security group to allow SSH access"
  vpc_id      = aws_default_vpc.default_vpc.id

  tags = {
    Name = "${var.environment}-automated-ssh-access"
    Environment = var.environment
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
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${var.environment}-dc-terraform-key-pair"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = data.aws_subnet.default_subnet[count.index % length(var.availability_zone)].id  # ✓ data source
  user_data              = file("${path.module}/install_nginx.sh")

  depends_on = [aws_security_group.allow_ssh]

  root_block_device {
    volume_size = var.environment == "prod" ? 20 : 10
    volume_type = "gp3"
  }

  tags = {
    Environment = var.environment
    Name        = "ec2-${var.environment}-terraform-web-server"
  }
}