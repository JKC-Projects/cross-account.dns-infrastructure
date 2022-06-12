resource "aws_ssm_parameter" "dev_route53" {
  provider    = aws.development
  for_each    = aws_route53_zone.dev_hz
  name        = format("/route53/%s/zone-id", regex("[^\\.]+\\.[^\\.]+$", each.value.name))
  description = "Describes the Route53 ZoneID for the Hosted Zone holding records under: ${each.value.name}"
  type        = "String"
  value       = each.value.zone_id
}

resource "aws_ssm_parameter" "prod_route53" {
  provider    = aws.PRODUCTION
  for_each    = aws_route53_zone.prod_hz
  name        = "/route53/${each.value.name}/zone-id"
  description = "Describes the Route53 ZoneID for the Hosted Zone holding records under: ${each.value.name}"
  type        = "String"
  value       = each.value.zone_id
}