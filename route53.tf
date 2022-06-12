resource "aws_route53_zone" "dev_hz" {
  provider = aws.development
  for_each = local.apex_domains
  name     = [for a in each.value : "dev.${a}"]
}

resource "aws_route53_zone" "prod_hz" {
  provider = aws.PRODUCTION
  for_each = local.apex_domains
  name     = each.value
}

# Delegates handling of dev subdomains to the DEV account's Route 53
resource "aws_route53_record" "dev_ns" {
  provider = aws.PRODUCTION
  for_each = local.apex_domains

  zone_id = aws_route53_zone.prod_hz[each.value].zone_id
  name    = aws_route53_zone.dev_hz[each.value].name
  type    = "NS"
  ttl     = "300"
  records = aws_route53_zone.dev_hz[each.value].name_servers
}