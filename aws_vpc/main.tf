# create a VPC on AWS
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr-block

  tags = {
    Name        = var.vpc-name
    Description = var.vpc-description
  }
}

output "vpc-id" {
  value = aws_vpc.my-vpc.id
}