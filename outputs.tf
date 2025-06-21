output "x_bucket_arn" {
  value = aws_s3_bucket.input_bucket.arn
}

output "x_output_bucket_arn" {
  value = aws_s3_bucket.output_bucket.arn
}
