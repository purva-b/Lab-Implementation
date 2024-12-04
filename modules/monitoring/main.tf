resource "aws_cloudwatch_log_group" "application_logs" {
  name              = "/application/logs"
  retention_in_days = 30
}

resource "aws_guardduty_detector" "gd" {
  enable = true
}
