variable "aws_default_provider_region" {
  type        = string
  description = "Region for the default AWS provider"
}

variable "common_tags" {
  type        = map(string)
  description = "Tags to add to every created resource, whenever possible"
}

variable "site_domain_name" {
  type        = string
  description = "Domain name of the site"
}