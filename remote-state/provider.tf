terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "pradeep-82s-tf-remote-state"
    key    = "expense-frontend-infra" # Unique key should be used with in the bucket, this will dump in our bucket only if others have same key and access.
    region = "us-east-1"
    dynamodb_table = "82s-state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}