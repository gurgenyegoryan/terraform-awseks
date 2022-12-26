terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-telecom"
    key            = "telecom/terraform.tfstate"
    region         = "eu-west-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-tfstate-telecom"
    encrypt        = true
  }
}
