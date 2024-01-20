# Creating new VPC, it is a good practice not to use the default VPC
resource "aws_vpc" "training" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "training"
  }
}