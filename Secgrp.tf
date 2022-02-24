
# PROJECT RODEO SECURITY GROUP

resource "aws_security_group" "Rodeo-vpc-security-group" {
  name        = "Rodeo-vpc-security-group"
  description = "Allow SSH/HTTP access or port 22/80"
  vpc_id      = aws_vpc.Rodeo_vpc.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Rodeo-vpc-security-group"
  }
}