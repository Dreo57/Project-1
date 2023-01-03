resource "aws_eks_cluster" "dreo_eks_cluster" {
    name = "dreo_cluster"
    role_arn = data.aws_iam_role.dreo_eks_role.arn
    vpc_config {
        subnet_ids = [var.prvtsn, var.prvtsn1]
        security_group_ids = [var.sec_grp]
        endpoint_public_access = true
        endpoint_private_access = true
    }  
}

resource "aws_eks_addon" "dreo_eks_addons" {
    count = length(var.addon_name)
    addon_name = var.addon_name[count.index]
    cluster_name = aws_eks_cluster.dreo_eks_cluster.id
  
}

data "aws_iam_role" "dreo_eks_role" {
    name = "Ekscluster-role"  
}

resource "aws_eks_fargate_profile" "dreo_fargate_prof" {
    cluster_name = aws_eks_cluster.dreo_eks_cluster.id
    fargate_profile_name = "dreo-fargate"
    pod_execution_role_arn = data.aws_iam_role.dreo-fargate_profile.arn
    selector {
      namespace = "dreo-namespace"
    }
    subnet_ids = [var.prvtsn, var.prvtsn1]  
}

data "aws_iam_role" "dreo-fargate_profile" {
    name = "AmazonEKSForFargate-pods-role"  
}
