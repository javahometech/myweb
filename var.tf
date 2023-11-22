variable "region" {
  type = string
}
variable "profile" {
  type = string
}
variable "ami" {
  type = map
  default = {
    ap-northeast-1 = "ami-0218d08a1f9dac831"
    us-east-2 = "ami-002068ed284fb165b"
    }
}
variable "instancetype" {
  type = map
  default = {
    ap-northeast-1 = "t2.micro"
    us-east-2 = "t3.micro"
    }
}
