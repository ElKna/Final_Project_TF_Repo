resource "aws_db_subnet_group" "mono-mysql-subnet-group-tf" {
  name = "mono-mysql-subnet-group-tf"
  subnet_ids = [aws_subnet.monolitic-private-subnet1-tf.id, aws_subnet.monolitic-private-subnet2-tf.id]

  tags = {"Name" = "Terraform resource"}
}

resource "aws_db_instance" "mono-auth-db-tf" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0.28"
  instance_class = "db.t2.micro"
  username = var.db_admin
  password = var.db_password
  parameter_group_name = "default.mysql8.0"
  db_name = var.db_name
  db_subnet_group_name = "${aws_db_subnet_group.mono-mysql-subnet-group-tf.id}"
  publicly_accessible = false
  skip_final_snapshot = true
  port = var.db_port
  vpc_security_group_ids = [aws_security_group.monolitic-db-sg-tf.id]

  tags = {"Name" = "Terraform resource"}
}