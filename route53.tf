resource "aws_route53_record" "domain_record" {
  zone_id = data.aws_route53_zone.default.id
  name    = var.site_domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.domain.website_domain
    zone_id                = aws_s3_bucket.domain.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain_record" {
  zone_id = data.aws_route53_zone.default.id
  name    = "www.${var.site_domain_name}"
  type    = "A"
  alias {
    name                   = aws_s3_bucket.subdomain.website_domain
    zone_id                = aws_s3_bucket.subdomain.hosted_zone_id
    evaluate_target_health = false
  }
}