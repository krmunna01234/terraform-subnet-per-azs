provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mkbucketbackup"
    key    = "dev/mkMyTfState"
    region = "us-east-1"
  }

}