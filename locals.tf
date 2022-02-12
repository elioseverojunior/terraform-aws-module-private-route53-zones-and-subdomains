locals {
  current_user = split(":", data.aws_caller_identity.current.user_id)
  user         = (length(local.current_user) > 0 ? local.current_user[1] : data.aws_caller_identity.current.user_id)
  environments = {
    development = {
      short = "dev"
      long  = "development"
    },
    sandbox = {
      short = "snd"
      long  = "sandbox"
    },
    staging = {
      short = "stg"
      long  = "staging"
    },
    production = {
      short = "prod"
      long  = "production"
    },
    test = {
      short = "tst"
      long  = "test"
    }
  }
  application_domain_name = format("%s-%s", local.selected_environment["short"], var.application)
  selected_environment    = local.environments[var.environment]
  subdomains              = { for subdomain in var.subdomains : subdomain["name"] => subdomain if subdomain["enabled"] == true }
  tags = merge(var.tags, var.tags_overwritten, {
    Environment      = var.environment
    EnvironmentLong  = local.selected_environment["long"]
    EnvironmentShort = local.selected_environment["short"]
    Name             = local.application_domain_name,
  })
  zone_private = {
    name          = var.domain
    comment       = "Private Route53 DNS Zone Managed by Terraform for ${local.application_domain_name} creation associated with VPC ${var.vpc_id}",
    force_destroy = var.force_destroy_destroy_all_records
    tags = merge(local.tags, {
      Name = local.application_domain_name,
      dns  = var.domain
    })
  }
  zone_subdomains = {
    for subdomain in var.subdomains :
    subdomain["name"] =>
    merge(subdomain,
      {
        name    = format("%s.%s", subdomain["name"], var.domain)
        comment = "Private Route53 DNS Zone SubDomain ${format("%s.%s", subdomain["name"], var.domain)} Managed by Terraform"
        tags = merge(local.tags, {
          Name = format("%s-subdomain-%s", local.application_domain_name, subdomain["name"]),
          dns  = format("%s.%s", subdomain["name"], var.domain)
        })
    })
    if subdomain["enabled"] == true
  }
}