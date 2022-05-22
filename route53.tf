resource "aws_route53_zone" "apex-domains" {
  for_each = local.apex_domains
  name     = each.value
}