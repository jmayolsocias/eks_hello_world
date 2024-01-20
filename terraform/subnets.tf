resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.training.id
  cidr_block        = var.private_a_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "private-us-east-1a"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.training.id
  cidr_block        = var.private_b_subnet_cidr
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "private-us-east-1b"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id            = aws_vpc.training.id
  cidr_block        = var.public_a_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "public-us-east-1a"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id            = aws_vpc.training.id
  cidr_block        = var.public_b_subnet_cidr
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "public-us-east-1b"
  }
}