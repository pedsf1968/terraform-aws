resource "aws_s3_bucket" "finance" {
  bucket = "finance-220924"
  tags = {
    Description = "fiance and Payroll"
  }
}

resource "aws_s3_object" "finance-2022" {
  content = "/home/terraform/data/aws/aws_s3_bucket2/Korean-Flag-Inforgraphic.png"
  key     = "Korean-Flag-Inforgraphic.png"
  bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = data.aws_iam_policy_document.allow_access_for_group.json
}

data "aws_iam_policy_document" "allow_access_for_group" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [ "${data.aws_iam_group.finance-data.arn}"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.finance.arn,
      "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
    ]
  }
}