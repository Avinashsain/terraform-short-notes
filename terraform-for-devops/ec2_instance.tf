module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"
  ami  = "ami-07a00cf47dbbc844c"

  instance_type = "t3.small"
  monitoring    = true
  subnet_id     = "subnet-0e6e6d4790468ad96"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}