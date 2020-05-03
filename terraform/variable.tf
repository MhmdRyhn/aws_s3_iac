variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_access_key" {
  type = string
}

variable "env" {
  type = string
  default = "dev"
  description = "Name of the enviroment, e.g., dev, test, staging, prod etc."
}

variable "bucket_name" {
  type = string
  default = "terra-bucket"
}

variable "iam_user_arns" {
  type = list(string)
  description = "List of ARN of IAM user who can put object into and delete object from bucket"
}