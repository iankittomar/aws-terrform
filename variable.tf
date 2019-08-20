variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "eu-west-1"
}

variable "amis" {
  description = "AMIs by region"
  default     = "ami-06358f49b5839867c" //for new Ubuntu Server 18.04 LTS (HVM)
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_access" {
  default = ""
}

variable "aws_secret" {
  default = ""
}

variable "instance_count" {
  default = "1"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}