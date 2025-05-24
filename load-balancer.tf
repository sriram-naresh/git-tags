locals {
  load_balancer_type = var.aws_lb_type == "application" ? "application" : "network" 
  #subnets_alb_ids = [for i in local.subnet_ids : aws_subnet.demo_subnet[i].id]
}
#load balancer
resource "aws_lb" "demo-lb" {
    name               = "demo-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = ["sg-029f99401de638b60"]
    subnets            = local.subnets_alb_ids
    enable_deletion_protection = false
    enable_http2 = true
    enable_cross_zone_load_balancing = true
    idle_timeout = 60
}

locals {
    subnet_ids = [0, 1]
    subnets_alb_ids = [for i in local.subnet_ids : aws_subnet.demo_subnet[i].id]
}