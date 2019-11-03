data "aws_s3_bucket" "argo_secrets_bucket" {
  bucket = var.argo_secrets_bucket
}
//
//data "aws_s3_bucket" "argo_scripts_bucket" {
//  bucket = var.argo_scripts_bucket
//}
//
//resource "aws_s3_bucket_object" "sync_apt_get_script" {
//  bucket = data.aws_s3_bucket.argo_scripts_bucket.bucket
//  key    = "apt-get.sh"
//  source = "${path.module}/files/${aws_s3_bucket_object.sync_apt_get_script.key}"
//  etag   = filemd5("${path.module}/files/${aws_s3_bucket_object.sync_apt_get_script.key}")
//}
//
//resource "aws_s3_bucket_object" "sync_setup_argo_script" {
//  bucket = data.aws_s3_bucket.argo_scripts_bucket.bucket
//  key    = "setup-argo.sh"
//  source = "${path.module}/files/${aws_s3_bucket_object.sync_setup_argo_script.key}"
//  etag   = filemd5("${path.module}/files/${aws_s3_bucket_object.sync_setup_argo_script.key}")
//}
