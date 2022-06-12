output "prod_nameservers" {
  value = { for d in local.apex_domains : d => aws_route53_zone.prod_hz[d].name_servers }
}