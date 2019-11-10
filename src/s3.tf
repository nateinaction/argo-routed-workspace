data "aws_s3_bucket" "argo_secrets_bucket" {
  bucket = var.argo_secrets_bucket
}
