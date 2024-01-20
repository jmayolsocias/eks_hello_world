# provision an Internet Gateway to give internet access to instances in public subnets
resource "aws_internet_gateway" "training" {
  vpc_id = aws_vpc.training.id

  tags = {
    Name = "training"
  }
}