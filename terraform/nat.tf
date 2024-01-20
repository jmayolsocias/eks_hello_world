# # provision nat gateway to give internet access to instances in private subnets
resource "aws_eip" "training" {
  tags = {
    Name = "training"
  }

}

resource "aws_nat_gateway" "training" {
  allocation_id = aws_eip.training.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "training"
  }

  depends_on = [aws_internet_gateway.training]
}