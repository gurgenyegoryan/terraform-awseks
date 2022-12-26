data "terraform_remote_state" "telecom" {
  backend = "s3"
  config = {
    bucket = "terraform-tfstate-telecom"
    key    = "telecom/terraform.tfstate"
    region = "eu-west-1"
  }
}


