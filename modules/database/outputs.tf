output "db_endpoint" {
  value       = aws_db_instance.blog_db.endpoint
  description = "The endpoint of the RDS database"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.blog_assets.bucket
  description = "The name of the S3 bucket for storing assets"
}
