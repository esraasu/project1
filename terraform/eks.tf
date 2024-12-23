module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"  # Example version, adjust as needed
  cluster_name    = "eks-cluster"
  cluster_version = "1.27"
  vpc_id          = aws_vpc.kubernetes_vpc.id
  subnets         = concat(aws_subnet.public_subnet[*].id, aws_subnet.private_subnet[*].id)

  node_groups = {
    worker_nodes = {
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 2
      instance_type    = "t3.medium"
      ami_type         = "AL2_x86_64"
    }
  }

  tags = {
    Environment = "Production"
  }
}

