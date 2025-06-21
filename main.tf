provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket1" "input_bucket" {
  bucket        = var.x_bucket
  force_destroy = true
}

resource "aws_s3_bucket1" "output_bucket" {
  bucket        = var.x_output_bucket
  force_destroy = true
}

resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.input_bucket.arn
}

resource "aws_s3_bucket_notification" "trigger_lambda" {
  bucket = aws_s3_bucket.input_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "uploads/"
    filter_suffix       = ".csv"
  }

  depends_on = [
    aws_s3_bucket.input_bucket,
    aws_lambda_permission.allow_s3
  ]
}

output "x_bucket_name" {
  value = aws_s3_bucket.input_bucket.bucket
}

output "x_output_bucket_name" {
  value = aws_s3_bucket.output_bucket.bucket
}
