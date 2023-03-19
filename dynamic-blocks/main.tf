provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

variable "ingress-rules" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egress-rules" {
  type = list(number)
  default = [ 80, 443, 25, 3306, 53, 8080 ]
}

resource "aws_instance" "myec2" {
  ami = "ami-086b3de06dafe36c5"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
}

resource "aws_security_group" "webtraffic" {
  name = "allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress-rules
    content {
      from_port = port.value
    to_port = port.value
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress-rules
    content {
      from_port = port.value
    to_port = port.value
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
}