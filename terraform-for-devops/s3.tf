resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-avinash-sain"
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.my_bucket_ownership]
}

resource "aws_s3_bucket_ownership_controls" "my_bucket_ownership" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}