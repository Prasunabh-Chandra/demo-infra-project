provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.az
  tags = {
    Name = "demo-subnet"
  }
}

resource "aws_security_group" "demo_sg" {
  name        = "demo-infra-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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
}

resource "aws_instance" "demo_ec2" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.demo_subnet.id
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name      = var.key_name

  tags = {
    Name = "demo-ec2-${count.index + 1}"
  }
}

