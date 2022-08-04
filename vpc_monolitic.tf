resource "aws_vpc" "monolitic-vpc-tf" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {"Name" = "Terraform VPC"}
}