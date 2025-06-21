variable "aws_region" {
  default = "us-east-1"
}

variable "x_bucket" {
  description = "Bucket de entrada (X_BUCKET)"
  type        = string
}

variable "x_output_bucket" {
  description = "Bucket de salida (x_BUCKET)"
  type        = string
}

variable "lambda_name" {
  description = "Nombre de la función Lambda a disparar"
  type        = string
}

variable "lambda_arn" {
  description = "ARN de la función Lambda"
  type        = string
}
