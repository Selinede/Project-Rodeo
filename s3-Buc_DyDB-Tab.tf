
# PROJECT RODEO S3 BUCKET AND DYNAMO-DB TABLE

terraform {
    backend "s3" {
      bucket         = "rodeo-terraform-s3-bucket"
      key            = "rodeo/terraform/remote/s3/terraform.tfstate"
      encrypt        = true
      region         = "us-east-1"
      dynamodb_table = "rodeo-dynamodb-state-locking"
    }
}

