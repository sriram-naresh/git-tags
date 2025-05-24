variable "aws_lb_type" {
    description = "value of the AWS load balancer type"
    type       = string
    default = "application"
}

variable "aws_region" {
    description = "value of the AWS region"
    type       = string
    default = "us-east-1"
}
variable "tags" {
    description = "value of the AWS tags"
    type       = map(string)
    default = {
        environment = "demo"
        Name        = "DemoVPC"
    }
  
}
variable "cidr_block" {
    description = "value of the AWS CIDR block"
    type       = string
    default = "10.0.0.0/16"
}
variable "subnets_count" {
    description = "value of the AWS subnets count"
    type       = number
    default = 2 # Number of subnets to create
  
}
variable "aws_ami" {
    description = "value of the AWS AMI"
    type       = string
    default = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
}

variable "aws_security_group" {
    description = "value of the AWS security group"
    type       = string
    default = "sg-029f99401de638b60"
}

variable "aws_instance_type" {
    description = "value of the AWS instance type"
    type       = map(string)
    default = {
        dev  =   "x5.large"
        stage  =  "t3.medium"
        prod   =  "t3.large"
    }
}

variable "env" {
    description = "value of the environment"
    type       = string
    default = "dev"
}

variable "region" {
    description = "value of the region"
    type       = string
    default = "us-east-1"
}