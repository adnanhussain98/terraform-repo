provider "aws" {
  region = "eu-west-2"
  shared_config_files      = ["/Users/adnanhussain/.aws/config"]
  shared_credentials_files = ["/Users/adnanhussain/.aws/credentials"]
  profile                  = var.profile-name
}

resource "aws_instance" "adnan-test-ec2" {
  ami = "ami-09ee0944866c73f62"
  instance_type = var.instance-type
}

# resource "aws_instance" "adnan-test-21321321321" {
#   ami = "ami-09ee0944866c73f62"
#   instance_type = "t2.small"
# }