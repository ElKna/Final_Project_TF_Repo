resource "aws_internet_gateway" "monolitic-ig-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  tags = {"Name" = "Terraform resource"}
}