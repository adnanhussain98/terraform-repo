# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = "eu-west-2"
#   shared_config_files      = ["/Users/adnanhussain/.aws/config"]
#   shared_credentials_files = ["/Users/adnanhussain/.aws/credentials"]
#   profile                  = "adnan-aws"
# }

# resource "aws_eip" "lb" {
#   vpc = true
# }

# # this will output the public ip of the elastic ip address after running terraform apply
# output "eip" {
#   value = aws_eip.lb.public_ip
# }

# resource "aws_s3_bucket" "mys3bucket" {
#   bucket = "adnan-test-bucket-011023"
# }

# # this will output the bucket domain name of the s3 bucket after running terraform apply
# output "mys3bucket" {
#   value = aws_s3_bucket.mys3bucket.bucket_domain_name
# }
