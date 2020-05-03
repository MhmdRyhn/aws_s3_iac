data "aws_iam_policy_document" "s3_bucket_policy" {
  /*
  Policies include the following:
  (1) Application users can read the object only.
  (2) Secret IAM user can put objects into the bucket.
  (3) Secret IAM user can delete objects from the bucket.
  */
  statement {
    sid = "PublicReadOnlyBucket"
    effect = "Allow"
    principals {
      identifiers = ["*"]
      type = "*"
    }
    resources = [
      "arn:aws:s3:::${var.env}-${var.bucket_name}/*"
    ]
    actions = [
      "s3:GetObject"
    ]
  }

  statement {
    sid = "IAMUserPutAndDeleteObjectBucket"
    effect = "Allow"
    principals {
      identifiers = var.iam_user_arns
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::${var.env}-${var.bucket_name}/*"
    ]
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
  }
}
