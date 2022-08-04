resource "aws_lb_target_group" "monolitic-ec2-tg-tf" {
  name     = "monolitic-ec2-tg-tf"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.monolitic-vpc-tf.id
}

resource "aws_lb_target_group_attachment" "mono-server-attach-tf" {
  target_group_arn = aws_lb_target_group.monolitic-ec2-tg-tf.arn
  target_id = aws_instance.monolitic-server-tf.id
  port = 80

  depends_on = [
    aws_lb_target_group.monolitic-ec2-tg-tf, aws_instance.monolitic-server-tf
  ]
}

resource "aws_lb" "monolitic-private-alb-tf" {
  name               = "monolitic-private-alb-tf"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mono-server-sg-tf.id]
  subnets            = [aws_subnet.monolitic-private-subnet1-tf.id, aws_subnet.monolitic-private-subnet2-tf.id]
}

resource "aws_lb_listener" "private-alb-linstener-tf" {
  load_balancer_arn = aws_lb.monolitic-private-alb-tf.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.monolitic-ec2-tg-tf.arn
  }
}