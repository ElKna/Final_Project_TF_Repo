resource "aws_instance" "bastion-host-tf" {
  ami = "ami-0f9e1c368c45414d0"
  instance_type = "t2.micro"
  key_name = "bsHost"
  subnet_id = aws_subnet.monolitic-public-subnet-tf.id
  vpc_security_group_ids = [aws_security_group.bastion-host-sg-tf.id]
  associate_public_ip_address = true
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {"Name" = "bastion-host-tf"}
}

resource "aws_instance" "monolitic-server-tf" {
  ami = "ami-0a8bc755297b74eb6"
  instance_type = "t2.micro"
  key_name = "serverInstance"
  subnet_id = aws_subnet.monolitic-private-subnet1-tf.id
  vpc_security_group_ids = [aws_security_group.mono-server-sg-tf.id]
  associate_public_ip_address = false
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  depends_on = [
    aws_route_table_association.mono-private2-rt-asso-tf, 
    aws_route_table_association.mono-private2-rt-asso-tf, 
    aws_route.mono-private1-route-tf,
    aws_route.mono-private2-route-tf
  ]

  user_data = "${file("mono_server_init.sh")}"

  tags = {"Name" = "monolitic-server-tf"}
}