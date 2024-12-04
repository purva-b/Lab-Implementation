output "frontend_instance_id" {
  value = aws_instance.frontend.id
}

output "backend_instance_id" {
  value = aws_instance.backend.id
}

output "alb_arn" {
  value = aws_lb.example.arn # Ensure `aws_lb.example` is correctly defined in the application module
  description = "ARN of the Application Load Balancer"
}
