# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = var.profile
}
resource "aws_instance" "web7" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${lookup(var.instancetype, var.region)}"

  tags = {
    Name = "HelloWorld9"
  }
}
