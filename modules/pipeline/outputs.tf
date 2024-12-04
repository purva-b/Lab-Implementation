output "pipeline_name" {
  value = aws_codepipeline.pipeline.name
}
output "pipeline_artifacts_bucket" {
  value = aws_s3_bucket.pipeline_artifacts.bucket
  description = "The name of the S3 bucket used for pipeline artifacts"
}
