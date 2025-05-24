locals {
   ingress_rules = [
       {
           from_port   = 22
           to_port     = 22
           protocol    = "tcp"
           cidr_blocks  = ["0.0.0.0/0"]
       },
        {
           from_port   = 80
           to_port     = 80
           protocol    = "tcp"
           cidr_blocks  = ["0.0.0.0/0"]
       }
   ]
}

resource "aws_security_group" "demo_sg" {
    name        = "demo-sg"
    description = "Demo security group"
    vpc_id      = aws_vpc.demo_vpc.id
    tags        = var.tags
    dynamic "ingress" {
        for_each = [for rule in local.ingress_rules : rule]
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks  = ingress.value.cidr_blocks
        }
    }
}