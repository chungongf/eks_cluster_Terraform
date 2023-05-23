#Creating the VPC for the EKS Cluster. It will have a name called main and a cider_block of "10.0.0.0/16"

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}