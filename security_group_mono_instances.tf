resource "aws_security_group" "bastion-host-sg-tf" {
  name = "bastion-host-sg-tf"
  description = "Security group for bastion host"
  vpc_id = aws_vpc.monolitic-vpc-tf.id

  ingress {
      description = "Open SSH Port"
      from_port = 22
      to_port = 22
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

resource "aws_security_group" "mono-server-sg-tf" {
  name = "mono-server-sg-tf"
  description = "Security group for monolitic server"
  vpc_id = aws_vpc.monolitic-vpc-tf.id

  ingress {
      description = "Open SSH Port"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description = "Open HTTP Port"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description = "Open HTTPS Port"
      from_port = 443
      to_port = 443
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