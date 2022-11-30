resource "aws_eks_cluster" "dreo_eks_cluster" {
    name = "dreo_cluster"
    role_arn = data.aws_iam_role.dreo_eks_role.arn
    vpc_config {
        subnet_ids = [var.pubsn, var.pubsn1]
        security_group_ids = [var.sec_grp]
        endpoint_public_access = true
    }  
}

resource "aws_eks_addon" "dreo_eks_addons" {
    count = length(var.addon_name)
    addon_name = var.addon_name[count.index]
    cluster_name = aws_eks_cluster.dreo_eks_cluster.name
  
}

data "aws_iam_role" "dreo_eks_role" {
    name = "Ekscluster-role"  
}