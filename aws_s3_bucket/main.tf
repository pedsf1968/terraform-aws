resource "aws_s3_bucket" "korea" {
  bucket = "korea-20220922"
  tags = {
    Description = "korea informations"
  }
}

resource "aws_s3_bucket_object" "korea-flag-2022" {
  content = "/home/terraform/data/aws/aws_s3_bucket/Korean-Flag-Inforgraphic.png"
  key     = "Korean-Flag-Inforgraphic.png"
  bucket  = aws_s3_bucket.korea.id
}

data "aws_iam_group" "korean-friends-data" {
  group_name = "korean-friends"
}

resource "aws_s3_bucket_policy" "korean-friends-policy" {
  bucket = aws_s3_bucket.korea.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.korea.id}/*",
      "Principal": {
        "AWS": [
          "${data.aws_iam_group.korean-friends-data.arn}"
        ]
      }
    }
  ]
} 
EOF
}