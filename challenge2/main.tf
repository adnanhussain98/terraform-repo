provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

resource "aws_default_vpc" "default-vpc" {
}

# resource "aws_default_subnet" "default-subnet" {
#   availability_zone = "eu-west-2a"
# }

resource "aws_instance" "myec2" {
  instance_type = var.instance-type
  ami = var.ami-id
  
}

output "sg" {
  value = aws_instance.myec2.security_groups
}