resource "aws_wafv2_web_acl" "web_acl" {
  name        = var.name
  description = "WAF for ALB"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rate-limit-rule"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit = var.rate_limit
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "rate-limit-rule"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "ip-allow-list"
    priority = 2

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.allow_ip_set.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "ip-allow-list"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "web-acl"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_ip_set" "allow_ip_set" {
  name              = "allow-ip-set"
  description       = "Allowed IPs for WAF"
  scope             = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.allowed_ips
}

output "web_acl_arn" {
  value = aws_wafv2_web_acl.web_acl.arn
}
