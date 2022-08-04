resource "aws_internet_gateway" "monolitic-ig-tf" {
  vpc_id = aws_vpc.monolitic-vpc-tf.id
  tags = {"Name" = "Terraform resource"}
}

resource "aws_eip" "nat-eip-tf" {
  vpc = true
  lifecycle {
    # 재생성 시 다운타임이 없도록 먼저 생성한 후 지우도록 하는 옵션
    create_before_destroy = true
  }

  tags = {"Name" = "Terraform resource"}
}

resource "aws_nat_gateway" "monolitic-nat-gateway-tf" {
  allocation_id = aws_eip.nat-eip-tf.id
  subnet_id = aws_subnet.monolitic-public-subnet-tf.id

  tags = {"Name" = "Terraform resource"}
  depends_on = [
    aws_eip.nat-eip-tf
  ]
}