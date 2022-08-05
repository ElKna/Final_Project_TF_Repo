resource "aws_route_table" "monolitic-public-rt-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.monolitic-ig-tf.id
  }
  tags = {"Name" = "Terraform resource"}
}

resource "aws_route_table" "monolitic-private1-rt-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  
  tags = {"Name" = "Terraform resource"}
}

resource "aws_route_table" "monolitic-private2-rt-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  
  tags = {"Name" = "Terraform resource"}
}

resource "aws_route_table_association" "mono-private1-rt-asso-tf" {
  subnet_id = aws_subnet.monolitic-private-subnet1-tf.id
  route_table_id = aws_route_table.monolitic-private1-rt-tf.id

  depends_on = [
    aws_subnet.monolitic-private-subnet1-tf, aws_route_table.monolitic-private1-rt-tf
  ]
}

resource "aws_route_table_association" "mono-private2-rt-asso-tf" {
  subnet_id = aws_subnet.monolitic-private-subnet2-tf.id
  route_table_id = aws_route_table.monolitic-private2-rt-tf.id

  depends_on = [
    aws_subnet.monolitic-private-subnet2-tf, aws_route_table.monolitic-private2-rt-tf
  ]
}

resource "aws_route" "mono-public-route-tf" {
  route_table_id = aws_route_table.monolitic-public-rt-tf.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.monolitic-ig-tf.id
}

resource "aws_route" "mono-private1-route-tf" {
  route_table_id = aws_route_table.monolitic-private1-rt-tf.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.monolitic-nat-gateway-tf.id
}

resource "aws_route" "mono-private2-route-tf" {
  route_table_id = aws_route_table.monolitic-private2-rt-tf.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.monolitic-nat-gateway-tf.id
}