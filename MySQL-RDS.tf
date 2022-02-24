

# PROJECT RODEO RDS 
# aws_db_instance

resource "aws_db_instance" "rodeo-RDS" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "db_rodeo"
  username             = "rodeoleo"
  password             = "Rodeo123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rodeo_sub_grp.name

  multi_az = "true"
}


# db_subnet group

resource "aws_db_subnet_group" "rodeo_sub_grp" {
  name       = "rodeo-dbg"
  subnet_ids = [aws_subnet.Private_Sub1.id, aws_subnet.Private_Sub2.id, aws_subnet.Private_Sub3.id  ]

  tags = {
    Name = "my-db-private-sub-grp"
  }
}

# SECURITY GROUP FOR DATABASE instance

resource "aws_security_group" "rodeo-db-secgrp" {
  name              = "rodeo-db_sec-group"
  description       = "Allow mysql inbound traffic"
  vpc_id            = aws_vpc.Rodeo_vpc.id

}

resource "aws_security_group_rule" "Rodeo-inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rodeo-db-secgrp.id
}

resource "aws_security_group_rule" "Rodeo-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rodeo-db-secgrp.id
}