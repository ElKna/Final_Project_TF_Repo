resource "aws_subnet" "monolitic-public-subnet-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  cidr_block = "10.0.8.0/24"
  tags = {"Name" = "Terraform resource"}
}