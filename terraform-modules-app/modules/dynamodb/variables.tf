variable hash_key {
  type        = string
  description = "Hash key for the DynamoDB table"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}