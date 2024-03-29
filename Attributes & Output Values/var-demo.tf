resource "aws_security_group" "var_demo" {
  name        = "kplabs-variables"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # instead of hardcoding the value of 116.50.30.20/32, we can use a variable for this value incase it changes in future.
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}