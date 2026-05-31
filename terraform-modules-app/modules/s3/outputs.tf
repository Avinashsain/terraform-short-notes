output "bucket_url" {
  value = aws_s3_bucket.remote_state_s3_bucket[*].bucket_regional_domain_name
}