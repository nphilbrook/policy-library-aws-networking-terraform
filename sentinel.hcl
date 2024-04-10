# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

policy "deny-public-ssh-acl-rules" {
  source = "./policies/deny-public-ssh-acl-rules/deny-public-ssh-acl-rules.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "deny-public-rdp-acl-rules" {
  source = "./policies/deny-public-rdp-acl-rules/deny-public-rdp-acl-rules.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "restrict-all-vpc-traffic-acl-rules" {
  source = "./policies/restrict-all-vpc-traffic-acl-rules/restrict-all-vpc-traffic-acl-rules.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "check-ec2-created-by-tag" {
  source = "./policies/check-ec2-created-by-tag/check-ec2-created-by-tag.sentinel"
  enforcement_level = "soft-mandatory"
}
