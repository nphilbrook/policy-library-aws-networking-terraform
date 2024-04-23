# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

# POLICIES THAT LIVE IN THIS REPOSITORY
policy "deny-public-ssh-acl-rules" {
  source = "./policies/deny-public-ssh-acl-rules/deny-public-ssh-acl-rules.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "deny-public-rdp-acl-rules" {
  source = "./policies/deny-public-rdp-acl-rules/deny-public-rdp-acl-rules.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "restrict-all-vpc-traffic-acl-rules" {
  source = "./policies/restrict-all-vpc-traffic-acl-rules/restrict-all-vpc-traffic-acl-rules.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "check-ec2-environment-tag" {
  source = "./policies/check-ec2-environment-tag/check-ec2-environment-tag.sentinel"
  enforcement_level = "soft-mandatory"
}

# POLICIES THAT ARE SOURCED EXTERNALLY
module "aws-functions" {
  source = "https://registry.terraform.io/v2/policies/SPHTech-Platform/aws/1.0.5/policy-module/aws-functions.sentinel?checksum=sha256:b6f0301884456544f2d5ae708918e08419fe4e9b8abee65314a109497f2ef725"
}

policy "s3-should-have-encryption-enabled" {
  source = "https://registry.terraform.io/v2/policies/SPHTech-Platform/aws/1.0.5/policy/s3-should-have-encryption-enabled.sentinel?checksum=sha256:0b7d6e0e010e019c969101244d6de952da94590e98a7704af7a06f823cf3f1ce"
  enforcement_level = "hard-mandatory"
}
