provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

# variable "vpcname" {
#   type = string
#   default = "myvpc"
# }

# variable "sshport" {
#   type = number
#   default = 22
# }

# variable "enabled" {
#     type = bool
#     default = true
# }

# variable "mylist" {
#   type = list(string)
#   default = ["value1, value2"]
# }

# variable "mymap" {
#   type = map
#   default = {
#     key1 = "value1"
#     key2 = "value2"
#   }
# }

# resource "aws_vpc" "myvpc" {
#     cidr_block = "10.0.0.0/16"

#     tags = {
#         name = var.vpcname
#     }
# }

# resource "aws_vpc" "myvpc" {
#     cidr_block = "10.0.0.0/16"

#     tags = {
#         name = var.mylist[0]
#     }
# }

# resource "aws_vpc" "myvpc" {
#     cidr_block = "10.0.0.0/16"

#     tags = {
#         name = var.mymap["Key1"]
#     }
# }

variable "inputname" {
  type = string
  description = "set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        techtest = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuples" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobjects" {
  type = object({name = string, port = list(number)})
  default = {
    name = "value"
    port = [ 1 ]
  }
}