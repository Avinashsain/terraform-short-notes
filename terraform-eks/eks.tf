module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  # Cluster (all cluster_ prefixes stripped in v21)
  name                    = local.name
  kubernetes_version      = "1.35"
  endpoint_private_access = true
  endpoint_public_access  = true
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnets

  control_plane_subnet_ids = module.vpc.intra_subnets

  addons = {
    vpc-cni    = { most_recent = true }
    coredns    = { most_recent = true }
    kube-proxy = { most_recent = true }
  }

  eks_managed_node_groups = {
    tws-cluster-ng = {
      instance_types                        = ["t3.medium"]
      attach_cluster_primary_security_group = true
      desired_size                          = 2
      max_size                              = 3
      min_size                              = 2
      capacity_type                         = "SPOT"
    }
  }

  tags = {
    Terraform   = "true"
    Environment = local.environment
  }
}