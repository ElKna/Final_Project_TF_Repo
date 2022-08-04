resource "aws_security_group" "monolitic-db-sg-tf" {
  name = "monolitic-db-sg-tf"
  description = "Security group for mysql db instance"
  vpc_id = aws_vpc.monolitic-vpc-tf.id

  ingress {
      description = "Open MySQL port"
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }

  tags = {"Name" = "Terraform resource"}
}