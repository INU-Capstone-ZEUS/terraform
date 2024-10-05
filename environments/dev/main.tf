module "vpc" {
  source = "../../modules/vpc"

  common_info = local.common_info
  common_tags = local.common_tags
  vpc_info = local.vpc_info
}

module "bastion" {
  source = "../../modules/bastion"

  common_info = local.common_info
  common_tags = local.common_tags
  vpc_info = local.vpc_info
  vpc_id = module.vpc.vpc_id

  subnets_public_ids  = module.vpc.subnets_public_ids
}


