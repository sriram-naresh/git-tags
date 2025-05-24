provider "aws" {
    region = "us-east-1"
}
locals {
  availability_zones = data.aws_availability_zones.available.names
}
resource "aws_instance" "demo_instance" {
    count        = 2
    ami         = data.aws_ami.latest.id # Amazon Linux 2 AMI
    instance_type = lookup(var.aws_instance_type, var.env, "t2.micro")
    key_name    = "practice-instance-kpair"
    vpc_security_group_ids = ["sg-029f99401de638b60"]
    subnet_id = aws_subnet.demo_subnet[count.index].id
    availability_zone = element(local.availability_zones, count.index)
    associate_public_ip_address = true
    #user_data = file("${path.module}/user_data.sh")
    tags = {
        Name = "DemoInstance-${count.index + 1}"
        environment_instance = "demo-${count.index + 1}"
        environment = var.env
        workspace = "${terraform.workspace}"
    }
    lifecycle {
        #prevent_destroy      = true
        #create_before_destroy = true
        ignore_changes       = [tags]
    }
}

