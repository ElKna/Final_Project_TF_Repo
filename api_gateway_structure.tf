resource "aws_apigatewayv2_api" "whole-api-gateway-tf" {
  name = "whole-api-gateway-tf"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "default-stage" {
  api_id = aws_apigatewayv2_api.whole-api-gateway-tf.id
  name = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_vpc_link" "mono-link-tf" {
  name = "mono-link-tf"
  security_group_ids = [aws_security_group.mono-server-sg-tf.id]
  subnet_ids = [aws_subnet.monolitic-private-subnet1-tf.id, aws_subnet.monolitic-private-subnet2-tf.id]
}

resource "aws_apigatewayv2_integration" "mono-private-tf" {
  api_id = aws_apigatewayv2_api.whole-api-gateway-tf.id
  integration_type = "HTTP_PROXY"
  integration_uri = aws_lb_listener.private-alb-linstener-tf.arn

  connection_type = "VPC_LINK"
  connection_id = aws_apigatewayv2_vpc_link.mono-link-tf.id
  
}