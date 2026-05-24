variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of the EC2 instance"
}
variable "ami_id" {
  type        = string
  default     = "ami-07a00cf47dbbc844c"
  description = "AMI ID for the EC2 instance"
}
variable "key_pair_name" {
  type        = string
  default     = "terra-key-ec2"
  description = "Name of the key pair to use for the EC2 instance"
}
variable "root_block_device_volume_size" {
  type        = number
  default     = 10
  description = "Size of the root block device volume in GB"
}
variable "root_block_device_volume_type" {
  type        = string
  default     = "gp3"
  description = "Type of the root block device volume"
}
variable "availability_zone" {
  type        = string
  default     = "ap-south-1b"
  description = "Availability zone for the resources"
}