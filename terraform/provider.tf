terraform {
  backend "s3" {
    bucket = "mamk-tfstate"
    key    = "mamk-tfstate/"
  }
}

provider "aws" {}
