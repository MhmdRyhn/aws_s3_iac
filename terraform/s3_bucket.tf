resource "aws_s3_bucket" "terra_bucket" {
  bucket = "${var.env}-${var.bucket_name}"
  # If `aws_s3_bucket_policy` is removed and the following
  # statement is commented out, both will work same.
  //  policy = data.aws_iam_policy_document.s3_bucket_policy.json

  tags = {
    Access = "Public Read Write"
  }
}


resource "aws_s3_bucket_policy" "terra_bucket_policy" {
  bucket = aws_s3_bucket.terra_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}
