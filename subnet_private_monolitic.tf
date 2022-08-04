resource "aws_subnet" "monolitic-private-subnet1-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  cidr_block = "10.0.16.0/24"
  tags = {"Name" = "Terraform resource"}
}

resource "aws_subnet" "monolitic-private-subnet2-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  cidr_block = "10.0.24.0/24"
  tags = {"Name" = "Terraform resource"}
}