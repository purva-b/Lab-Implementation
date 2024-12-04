output "cloudwatch_log_group_name" {
  value       = aws_cloudwatch_log_group.application_logs.name
  description = "The name of the CloudWatch log group"
}

output "guardduty_detector_id" {
  value       = aws_guardduty_detector.gd.id
  description = "The ID of the GuardDuty detector"
}
