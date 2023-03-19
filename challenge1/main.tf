provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"

  tags = {
    author = var.employeename
    reason = var.reason
  }
}