

# PROJECT RODEO MAIN PROJECT_VPC


resource "aws_vpc" "Rodeo_vpc" {
  cidr_block       = var.vpc-cidr-Rodeo
  instance_tenancy = "default"

  tags = {
    Name = var.tag-post
  }
}


# Public Subnet_1

resource "aws_subnet" "Public_Sub1" {

  vpc_id     = aws_vpc.Rodeo_vpc.id
  cidr_block = var.Public_Sub1-cidr
  
  
     
    availability_zone = "us-east-1a"
    tags = {
       Name = "Public_Sub1"
  }
}


# Public Subnet_2

resource "aws_subnet" "Public_Sub2" {
  vpc_id     = aws_vpc.Rodeo_vpc.id
    cidr_block = var.Public_Sub2-cidr
  
 availability_zone = "us-east-1b"
 
    
       tags = {
         Name = "Public_Sub2"
  }
}


# Public Subnet_3

resource "aws_subnet" "Public_Sub3" {
  vpc_id     = aws_vpc.Rodeo_vpc.id
    cidr_block = var.Public_Sub3-cidr
  
 availability_zone = "us-east-1c"
 
    
       tags = {
         Name = "Public_Sub3"
  }
}




# Private Subnet_1

resource "aws_subnet" "Private_Sub1" {
  vpc_id     = aws_vpc.Rodeo_vpc.id
  cidr_block = var.Private_Sub1-cidr

     
    availability_zone = "us-east-1d"
    tags = {
       Name = "Private_Sub1"
  }
}

# Private Subnet_2

resource "aws_subnet" "Private_Sub2" {
  vpc_id     = aws_vpc.Rodeo_vpc.id
  cidr_block = var.Private_Sub2-cidr

  
     
    availability_zone = "us-east-1e"
    tags = {
       Name = "Private_Sub2"
  }
}


# Private Subnet_3

resource "aws_subnet" "Private_Sub3" {
  vpc_id     = aws_vpc.Rodeo_vpc.id
  cidr_block = var.Private_Sub3-cidr

  
     
    availability_zone = "us-east-1f"
    tags = {
       Name = "Private_Sub3"
  }
}



# The Private Route Table


resource "aws_route_table" "Pri-Route_Table" {
  vpc_id = aws_vpc.Rodeo_vpc.id

  
  tags = {
    Name = "Pri-Route_Table"
  }
}


# The Public Route Table

resource "aws_route_table" "Pub-Route_Table" {
  vpc_id = aws_vpc.Rodeo_vpc.id

  
  tags = {

    Name = "Pub-Route_Table"
  }
}

# The association of Public Subnet1 With Public Route Table

resource "aws_route_table_association" "Public_RTA1" {
  subnet_id      = aws_subnet.Public_Sub1.id
  route_table_id = aws_route_table.Pub-Route_Table.id
}


# The Second association of Public Subnets With Public Route Table_Public Subnet_2

resource "aws_route_table_association" "Public_RTA2" {
  subnet_id      = aws_subnet.Public_Sub2.id
  route_table_id = aws_route_table.Pub-Route_Table.id
  }


# The first association of Private Subnets With Public Route Table_Public Subnet_2

resource "aws_route_table_association" "Private_RTA1" {
  subnet_id      = aws_subnet.Private_Sub1.id
  route_table_id = aws_route_table.Pri-Route_Table.id
}

resource "aws_route_table_association" "Private-Route_RTA2" {
  subnet_id      = aws_subnet.Private_Sub2.id
  route_table_id = aws_route_table.Pri-Route_Table.id
}


# The_Internet Gateway 


resource "aws_internet_gateway" "Rodeo-IGW13" {
  vpc_id       = aws_vpc.Rodeo_vpc.id

  tags = {
    Name       = "Rodeo-IGW13"
  }
}


# Connection of Routable and Internet Gate-Way

# Conection of Route to Internet GW And Public-Routetable


resource "aws_route" "Pub-route-IGW" {
  route_table_id            = aws_route_table.Pub-Route_Table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.Rodeo-IGW13.id   
              
} 
