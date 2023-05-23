# The internet gateway enables resources in your public subnets to connect to the internet if they have a public IPv4 or IPv6. 
# The IGW will use the VPD ID to attach itself to the VPC

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}