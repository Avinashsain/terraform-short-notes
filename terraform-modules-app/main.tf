# ─── DEV ───────────────────────────────────────────
module "ec2_dev" {
  source = "./modules/ec2"

  environment       = "dev"
  availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  instance_count    = 1
  ami_id            = "ami-07a00cf47dbbc844c"
  instance_type     = "t2.nano"
}

module "s3_dev" {
  source = "./modules/s3"

  environment = "dev"
  bucket_name = "dc-terraform-bucket-dev"
}

module "dynamodb_dev" {
  source = "./modules/dynamodb"

  environment = "dev"
  hash_key    = "studentID"
}

# ─── STAGING ───────────────────────────────────────
module "ec2_staging" {
  source = "./modules/ec2"

  environment       = "staging"
  availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  instance_count    = 1
  ami_id            = "ami-07a00cf47dbbc844c"
  instance_type     = "t2.micro"
}

module "s3_staging" {
  source = "./modules/s3"

  environment = "staging"
  bucket_name = "dc-terraform-bucket-staging"
}

module "dynamodb_staging" {
  source = "./modules/dynamodb"

  environment = "staging"
  hash_key    = "studentID"
}

# ─── PROD ──────────────────────────────────────────
module "ec2_prod" {
  source = "./modules/ec2"

  environment       = "prod"
  availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  instance_count    = 1
  ami_id            = "ami-07a00cf47dbbc844c"
  instance_type     = "t2.small"
}

module "s3_prod" {
  source = "./modules/s3"

  environment = "prod"
  bucket_name = "dc-terraform-bucket-prod"
}

module "dynamodb_prod" {
  source = "./modules/dynamodb"

  environment = "prod"
  hash_key    = "studentID"
}