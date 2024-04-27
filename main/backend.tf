terraform {
  backend "s3" {
    bucket         = "vsws-prod-production-terraform-state"  # Replace with actual bucket name 
    key            = "state/main/terraform.tfstate"
    region         = "ap-northeast-2"                       # Adjust the region appropriately
    dynamodb_table = "vsws-prod-production-terraform-locks"   # Replace with actual DynamoDB table name 
    encrypt        = true
  }
}
