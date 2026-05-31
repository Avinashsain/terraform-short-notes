variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}