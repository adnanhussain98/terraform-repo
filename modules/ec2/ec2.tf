variable "ec2name" {
  type = string
}

resource "aws_instance" "myec2" {
  ami = "ami-086b3de06dafe36c5"
  instance_type = "t2.micro"
  tags = {
    name = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.myec2.id
}