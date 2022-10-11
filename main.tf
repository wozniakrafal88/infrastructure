module "vpc" {
  source = "./modules/vpc"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
}

module "rds" {
  source = "./modules/rds"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  sc_db_id           = module.vpc.sc_db_id
}

module "iam" {
  source = "./modules/iam"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  resource_id = module.rds.resource_id
  arn         = module.rds.arn
}

module cloud_map {
  source = "./modules/cloud_map"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  vpc_id             = module.vpc.vpc_id
}

module "db_app" {
  source = "./modules/app"

  sd_namespace_id    = module.cloud_map.sd_namespace_id
  app_name           = "db"
  app_port           = "5000"
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  iam_profile        = module.iam.rds_iam_profile
  iam_role_arn       = module.iam.rds_iam_role_arn
  image_name         = "public.ecr.aws/ablachowicz-public-ecr-reg/db_app_rwozniak:latest"
} 

module "s3_app" {
  source = "./modules/app"

  sd_namespace_id    = module.cloud_map.sd_namespace_id
  app_name           = "s3"
  app_port           = "5000"
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  iam_profile        = module.iam.s3_iam_profile
  iam_role_arn       = module.iam.s3_iam_role_arn
  image_name         = "public.ecr.aws/ablachowicz-public-ecr-reg/s3_app_rwozniak:latest"
  #app_port           = "5000"
} 

module "ec2" {
  source = "./modules/ec2"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  s3_iam_profile     = module.iam.s3_iam_profile
  rds_iam_profile    = module.iam.rds_iam_profile
  rds_to_ec2_iam_profile = module.iam.rds_to_ec2_iam_profile
  s3_jenkins_to_ec2_profile = module.iam.s3_jenkins_to_ec2_profile
  rds_host           = module.rds.rds_host
  db_name            = module.rds.db_name
  db_port            = module.rds.db_port
  db_username        = module.rds.db_username
  sc_lb_id           = module.vpc.sc_lb_id
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  sc_ssh_id          = module.vpc.sc_ssh_id
  sc_apps_id         = module.vpc.sc_apps_id
  sc_jenkins_id      = module.vpc.sc_jenkins_id
  jenkins_load_Balancer_url= module.ecs.jenkins_load_Balancer_url
}

module "ecs" {
  source = "./modules/ecs"

  tag_owner          = var.tag_owner
  tag_name_prefix    = var.tag_name_prefix
  env_name           = local.env_name
  vpc_id             = module.vpc.vpc_id
  sc_lb_id           = module.vpc.sc_lb_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  sc_apps_id         = module.vpc.sc_apps_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_jenkins_id     = module.ec2.ec2_jenkins_id
  app_info           = [
    module.db_app,
    module.s3_app
  ]
}