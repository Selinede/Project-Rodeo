

#Project Rodeo Web EC2 -1
resource "aws_instance" "rodeo_server1" {

  ami             = var.ami-ec2 
  instance_type    = var.describe-instance-types-1
  key_name        = "Rodeo-01"
  subnet_id       = aws_subnet.Public_Sub1.id

  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.Rodeo-vpc-security-group.id]


  user_data = <<EOF
  #!/bin/bash
# get admin privileges
sudo su
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  
  EOF

  tags = {


    Name = "rodeo_server1"
  } 
}

#Jupiter Web EC2 -2

resource "aws_instance" "rodeo_server2" {

  ami             = var.ami1-ec2 
  instance_type   = var.describe-instance-types-2
  key_name        = "Rodeo-01"
  subnet_id       = aws_subnet.Public_Sub2.id

  availability_zone = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.Rodeo-vpc-security-group.id]


  user_data = <<EOF
   #!/bin/bash
# get admin privileges
sudo su
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  
  EOF

  tags = {


    Name = "rodeo_server2"
  } 
} 
