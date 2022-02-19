resource "aws_s3_bucket" "domain" {
  bucket = var.site_domain_name
  tags   = var.common_tags
}

resource "aws_s3_bucket" "subdomain" {
  bucket = "www.${var.site_domain_name}"
  tags   = var.common_tags
}

resource "aws_s3_bucket_policy" "domain_public_policy" {
  bucket = aws_s3_bucket.domain.id
  policy = data.aws_iam_policy_document.domain_public_policy.json
}

resource "aws_s3_bucket_policy" "subdomain_public_policy" {
  bucket = aws_s3_bucket.subdomain.id
  policy = data.aws_iam_policy_document.subdomain_public_policy.json
}

resource "aws_s3_bucket_website_configuration" "domain_website_configuration" {
  bucket = aws_s3_bucket.domain.bucket
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_website_configuration" "subdomain_website_configuration" {
  bucket = aws_s3_bucket.subdomain.bucket
  redirect_all_requests_to {
    host_name = var.site_domain_name
    protocol  = "http"
  }
}