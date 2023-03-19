provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

resource "aws_instance" "myec2" {
  ami = "ami-086b3de06dafe36c5"
  instance_type = "t2.micro"
}

resource "aws_eip" "myeip" {
  instance = aws_instance.myec2.id
}

output "eip" {
 value = aws_eip.myeip.public_ip 
}