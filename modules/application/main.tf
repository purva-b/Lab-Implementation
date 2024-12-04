resource "aws_instance" "frontend" {
  ami           = "ami-007868005aea67c54" # Example AMI
  instance_type = "t2.micro"
  subnet_id     = var.public_subnets[0]
  security_groups = [var.security_sg]
}

resource "aws_instance" "backend" {
  ami           = "ami-007868005aea67c54" # Example AMI
  instance_type = "t2.micro"
  subnet_id     = var.private_subnets[0]
  security_groups = [var.security_sg]
}
resource "aws_lb" "example" {
  name               = "example-alb-12345"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_sg]
  subnets            = var.public_subnets

  tags = {
    Name = "Example ALB"
  }
}
