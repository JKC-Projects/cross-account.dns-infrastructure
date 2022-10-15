locals {
  apex_domains = toset([
    "small.domains",
    "john-chung.dev"
  ])

  // default_tags are not to be used directly. Only used here so we have common tags across all AWS providers
  default_tags = {
    project     = "cross-account"
    managed_by  = "terraform"
    github_repo = "cross-account.dns-infrastructure"
  }
}