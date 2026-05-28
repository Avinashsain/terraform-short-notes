resource "aws_s3_bucket" "remote_state_s3_bucket" {
  bucket = "b15terraformbucket"
  tags = {
    Name = "My bucket b15terraformbucket"
  }
}