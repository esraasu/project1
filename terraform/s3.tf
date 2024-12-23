terraform {
  backend "s3" {
    bucket         = "vprofiletest"
    key            = "kubernetes-cluster/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock" # Optional for state locking
  }
}
