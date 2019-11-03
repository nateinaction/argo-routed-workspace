terraform {
  backend "s3" {
    bucket         = "worldpeace-terraform-state"
    key            = "nategay_workspace.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "worldpeace-terraform-lock"
  }
}
