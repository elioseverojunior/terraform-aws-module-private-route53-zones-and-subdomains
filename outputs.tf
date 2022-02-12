output "aws_region" {
  description = "AWS Region."
  value       = var.aws_region
}

output "application" {
  description = "Application Name."
  value       = var.application
}

output "environment" {
  description = "Environment Name."
  value       = var.environment
}

output "environment_config" {
  description = "Environment Map Data."
  value       = local.selected_environment
}

output "last_iam_current" {
  description = "Last User AWS IAM Data."
  value       = data.aws_caller_identity.current
}

output "last_user" {
  description = "Last AWS IAM UserName."
  value       = local.user
}

output "route53_zone_private" {
  description = "Private Route53 HostedZone."
  value       = aws_route53_zone.private
}

output "route53_zone_private_id" {
  description = "Private Route53 HostedZone ID."
  value       = aws_route53_zone.private.id
}

output "route53_zone_subdomains" {
  description = "Route53 Zone SubDomains."
  value       = aws_route53_zone.subdomains
}

output "route53_zone_subdomains_records" {
  description = "Route53 Zone SubDomains Records."
  value       = aws_route53_record.subdomains_ns
}

output "vpc_id" {
  description = "AWS VPC ID."
  value       = var.vpc_id
}

output "zone_private" {
  description = "Route53 Private Zone Config Data."
  value       = local.zone_private
}

output "zone_subdomains" {
  description = "Route53 Private Zone SubDomains Config Data."
  value       = local.zone_subdomains
}

output "default_tags" {
  description = "Default AWS Tags."
  value       = var.tags
}

output "tags" {
  description = "AWS Tags."
  value       = local.tags
}

output "tags_overwritten" {
  description = "AWS Overwritten Tags."
  value       = var.tags_overwritten
}
