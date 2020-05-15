resource "aws_s3_bucket" "terra_bucket" {
  bucket = "${var.env}-${var.bucket_name}"
  # If `aws_s3_bucket_policy` is removed and the following
  # statement is commented out, both will work same.
  //  policy = data.aws_iam_policy_document.s3_bucket_policy.json

  cors_rule {
    allowed_methods = [
      "GET",
      "POST"
    ]
    allowed_origins = [
      "*"
    ]
    allowed_headers = [
      "*"
    ]
    expose_headers = [
      "ETag"
    ]
  }

  tags = {
    Access = "Public Read Write"
  }
}


resource "aws_s3_bucket_policy" "terra_bucket_policy" {
  bucket = aws_s3_bucket.terra_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}


# Creating several folders inside bucket
resource "aws_s3_bucket_object" "terra_bucket_folders" {
  count = length(var.s3_bucket_folders)
  bucket = aws_s3_bucket.terra_bucket.id
  acl = "private"
  content_type = "application/x-directory"
  key = "${var.s3_bucket_folders[count.index]}/"
  source = "/dev/null"
}
