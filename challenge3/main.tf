provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

resource "aws_instance" "DBserver" {
  instance_type = "t2.micro"
  ami = "ami-086b3de06dafe36c5"
}

output "private-ip" {
  value = aws_instance.DBserver.private_ip
}

resource "aws_instance" "WEBserver" {
  instance_type = "t2.micro"
  ami = "ami-086b3de06dafe36c5"
  user_data = 
#   launch_template {
#     id = aws_launch_template.script.id
#   }
}

resource "aws_eip" "eip" {
  instance = aws_instance.WEBserver
}

# resource "aws_security_group" "sg" {
#   name = "allow HTTPS"
  
# }

# resource "aws_launch_template" "script" {
#   name_prefix = "server-script.sh"
# }
