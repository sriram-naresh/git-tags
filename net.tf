resource "aws_vpc" "demo_vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = true
    tags = {
      environment = var.tags.environment
      Name        = var.tags.Name
    }
}
data "aws_availability_zones" "available" {
    # This data source will return the availability zones in the region
    # where the provider is configured to create resources.
    # The default provider region is us-east-1.
}
resource "aws_subnet" "demo_subnet" {
    count = var.subnets_count
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = cidrsubnet(aws_vpc.demo_vpc.cidr_block, local.newbits, count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_public_ip_on_launch = true
    tags = {
        Name = "DemoSubnet-${count.index + 1}"
        environment = "demo"
    }
}
#internetgate
resource "aws_internet_gateway" "demo-gw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "DemoInternetGateway"
  }
}
#route table
resource "aws_route_table" "demo-rt" {
    vpc_id = aws_vpc.demo_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo-gw.id
    }
}
#route table association
resource "aws_route_table_association" "demo-rt-assoc" {
    count = length(local.subnet_ids)
    subnet_id = aws_subnet.demo_subnet[local.subnet_ids[count.index]].id
    route_table_id = aws_route_table.demo-rt.id
    depends_on = [aws_internet_gateway.demo-gw]
}



variable "subnet_count" {
  type    = number
  default = 4
}

locals {
  newbits = ceil(log(var.subnet_count, 2))
}