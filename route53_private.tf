resource "aws_route53_zone" "private" {
  name          = local.zone_private["name"]
  comment       = local.zone_private["comment"]
  force_destroy = local.zone_private["force_destroy"]
  tags          = local.zone_private["tags"]
  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_zone" "subdomains" {
  for_each      = local.zone_subdomains
  name          = each.value["name"]
  comment       = each.value["comment"]
  force_destroy = local.zone_private["force_destroy"]
  tags          = each.value["tags"]
  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "subdomains_ns" {
  for_each = local.subdomains
  zone_id  = aws_route53_zone.private.zone_id
  name     = aws_route53_zone.subdomains[each.value["name"]].name
  type     = each.value["type"]
  ttl      = each.value["ttl"]
  records  = aws_route53_zone.subdomains[each.value["name"]].name_servers
}
