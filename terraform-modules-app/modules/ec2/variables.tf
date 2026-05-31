variable "availability_zone" {
  description = "List of availability zones"
  type        = list(string)
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instances"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}