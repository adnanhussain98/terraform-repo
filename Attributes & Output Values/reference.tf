provider "aws" {
  region = "eu-west-2"
  shared_config_files      = ["/Users/adnanhussain/.aws/config"]
  shared_credentials_files = ["/Users/adnanhussain/.aws/credentials"]
  profile                  = "adnan-aws"
}

# creates the ec2 instance
resource "aws_instance" "adnan-test-instance" {
  ami = "ami-09ee0944866c73f62"
  instance_type = "t2.micro"
}

# creates the elastic ip address
resource "aws_eip" "lb" {
  vpc = true
}

# this associates the elastic IP address created to the ec2 we created
# instance_id = we enter the resource name and local resource name followed by id. this will specify which instance to attach the elastic ip address to
# allocation_id = this is the elastic ip address id
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.adnan-test-instance.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "adnan-secrity-group"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
  }
}

# ["${aws_eip.lb.public_ip}/32"]
# we are using the syntax above as we are combining a variable with a string. therefore, we need to wrap it around "${}"