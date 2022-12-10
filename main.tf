module "vpc" {
    # source = "../personal-project/vpc"
    source = "git::https://github.com/Dreo57/Project-1.git//vpc"  
}
module "sg" {
    # source = "../personal-project/sg"
    source = "git::https://github.com/Dreo57/Project-1.git//sg"
    vpc = module.vpc.vpc_id
}
# module "s3" {
#     # source = "../personal-project/s3"
#     source = "git::https://github.com/Dreo57/Project-1.git//s3"

# }
module "ec2" {
    # source = "../personal-project/ec2"
    source = "git::https://github.com/Dreo57/Project-1.git//ec2"
    sg_id = module.sg.sg_id
    sn_pub = module.vpc.snpub_id
}
# module "db-subnet" {
#     source = "../personal-project/db-subnet"
#     # source = "git::https://github.com/Dreo57/Project-1.git//db-subnet"
#     sn = module.vpc.snprvt_id
#     sn1 = module.vpc.snprvt1_id
# }
# module "endpoint" {
#     # source = "../personal-project/endpoint"
#     source = "git::https://github.com/Dreo57/Project-1.git//endpoint"
#     sgid = module.sg.sg_id
#     subnet_ids = module.vpc.snpub_id
#     vpc_id = module.vpc.vpc_id
# }
# module "rds" {
#     source = "../personal-project/rds"
#     # source = "git::https://github.com/Dreo57/Project-1.git//rds"
#     rds_sg = module.sg.rds_sg_id
#     db_sngp = module.db-subnet.db_sngp_id
# }

# module "asg-launch_template" {
#     # source = "../personal-project/asg-launch_template"
#     source = "git::https://github.com/Dreo57/Project-1.git//asg-launch_template"
#     snprvt = module.vpc.snprvt_id
#     snprvt1 = module.vpc.snprvt1_id
#     ec2-sg_id = module.sg.sg_id
#     target-group = module.alb-tggroup.target-gp-arn
#     # alb-id = module.alb-tggroup.elb-id
# }

# module "alb-tggroup" {
#     # source = "../personal-project/alb-tggroup"
#     source = "git::https://github.com/Dreo57/Project-1.git//alb-tggroup"
#     vpc = module.vpc.vpc_id
#     # dre_temp = module.asg-launch_template.launch_temp
#     alb-sg_id = module.sg.lb-sg_id
#     snpub = module.vpc.snpub_id
#     snpub1 = module.vpc.snpub1_id
    
# }

# module "ecs" {
#     # source = "../personal-project/ecs"
#     source = "git::https://github.com/Dreo57/Project-1.git//ecs"
#     sub_id = module.vpc.snpub_id
#     sub_id1 = module.vpc.snpub1_id
#     # load_balancer = module.alb-tggroup.elb-id
#     target_group = module.alb-tggroup.target-gp-arn
#     sec_grp = module.sg.sg_id
# }


# module "eks" {
#     source = "../personal-project/eks"
#     # source = "git::https://github.com/Dreo57/Project-1.git//eks"
#     pubsn = module.vpc.snpub_id
#     pubsn1 = module.vpc.snpub1_id
#     sec_grp = module.sg.sg_id
# }
