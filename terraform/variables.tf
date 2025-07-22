variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/24"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "az" {
  default = "ap-south-1a"
}

variable "ami_id" {
  description = "AMI for Amazon Linux 2 or Ubuntu"
  default     = "ami-0b32d400456908bf9" # update with your region's AMI
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of your EC2 Key Pair"
  default     = "my-key" # Replace with your actual key name
}

