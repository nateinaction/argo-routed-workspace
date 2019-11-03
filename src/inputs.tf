// General
variable "project_name" {}

// Provider
variable "aws_account_id" {}
variable "aws_region" {}

// EC2
variable "ssh_key" {
  description = "SSH key name to use for the workspace server"
}
variable "workspace_instance_type" {
  description = "Instance type to use for the workspace server"
}
variable "workspace_enabled" {
  description = "Should the workspace be online?"
}

// S3
variable "argo_secrets_bucket" {}

// Cloudflare
variable "cloudflare_email" {
  description = "Email address for the Cloudflare account"
}
variable "cloudflare_api_token" {
  description = "Limited scope Cloudflare API token"
}
variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
}
variable "cloudflare_zone_id" {
  description = "Zone ID for the domain managed by Cloudflare"
}
