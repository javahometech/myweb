provider "aws" {
  region  = "ap-northeast-1"
}


resource "aws_s3_bucket" "b" {
  bucket = "mys3honey12345554555"
  

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

  
