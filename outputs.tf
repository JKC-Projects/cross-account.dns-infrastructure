output "ds" {
  description = "The name servers of all apex domains. These values should be populated into the nameservers of the DNS Registrar."

  value = {
    for a in local.apex_domains : 
     a => aws_route53_zone.apex-domains[a].name_servers
  }
}