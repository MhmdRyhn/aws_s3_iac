variable "region" {
  type = string
  description = "Preferred AWS region."
}

variable "access_key" {
  type = string
  description = "IAM user access key."
}

variable "secret_access_key" {
  type = string
  description = "IAM user secret access key."
}

variable "env" {
  type = string
  description = "Name of the enviroment, e.g., dev, test, staging, prod etc."
  default = "dev"
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket. Name should maintain bucket naming constraints."
  default = "terra-bucket"
}

variable "iam_user_arns" {
  type = list(string)
  description = "List of ARN of IAM user who can put object into and delete object from bucket."
}

variable "s3_bucket_folders" {
  type = list(string)
  description = "A list of folders name."
  default = ["plants", "pots"]
}
