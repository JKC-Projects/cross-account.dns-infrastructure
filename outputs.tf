output "apex-domains-nameservers" {
  description = "The name servers of all apex domains. These values should be populated into the nameservers of the DNS Registrar. Intended for logging purposes."

  value = tomap({
    for a in local.apex_domains :
    a => aws_route53_zone.apex-domains[a].name_servers
  })
}

output "apex-domains-route53" {
  description = "Describes the Route 53 instances used for each Apex Domain. Intended for use in other Terraform workspaces"

  value = tomap({
    for a in local.apex_domains :
    a => {
      arn     = aws_route53_zone.apex-domains[a].arn
      zone_id = aws_route53_zone.apex-domains[a].zone_id
    }
  })
}