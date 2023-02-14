terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile                 = "Delali" #profile name to be used if its not default
  region                  = "us-east-2"
  shared_credentials_file = "~\.ssh\test.pem" #file path location of aws credentials
}

#Create the VPC
resource "aws_vpc" "some_custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Some Custom VPC"
  }
}

#Create the public subnet
resource "aws_subnet" "some_public_subnet" {
  vpc_id            = aws_vpc.some_custom_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "Some Public Subnet"
  }
}

#Create the private subnet
resource "aws_subnet" "some_private_subnet" {
  vpc_id            = aws_vpc.some_custom_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "Some Private Subnet"
  }
}

#Create the internet gateway 
resource "aws_internet_gateway" "some_ig" {
  vpc_id = aws_vpc.some_custom_vpc.id

  tags = {
    Name = "Some Internet Gateway"
  }
}

#Create the route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.some_custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.some_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.some_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.some_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

#Create the security group
resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.some_custom_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

#Create the AWS Instance
resource "aws_instance" "web_instance" {
  ami           = "ami-0a606d8395a538502" #Click on launch instnace from AWS console and use ami id of instance you want created
  instance_type = "t2.nano"
  key_name      = "test"

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  tags = {
    "Name" : "TerraformInstance"
    }

 
}

module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 3.0"

  cluster_name = "my-eks-cluster"

  vpc_id = aws_vpc.some_custom_vpc.id

  subnets = aws_subnet.some_private_subnet.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  depends_on = [
    aws_subnet.some_private_subnet.id
  ]
}

}
