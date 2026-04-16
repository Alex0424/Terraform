terraform {
  backend "s3" {
    bucket = "alex.s3.bucket.for.terraform"
    key    = "terraform_dir/backend"
    region = "us-east-1"
  }
}
