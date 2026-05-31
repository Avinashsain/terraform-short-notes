resource "aws_s3_bucket" "remote_state_s3_bucket" {
  bucket = "${var.environment}-${var.bucket_name}"
  tags = {
    Name = "My bucket ${var.environment}-${var.bucket_name}"
    Environment = var.environment
  }
}