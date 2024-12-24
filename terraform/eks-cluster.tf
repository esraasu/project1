module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.29.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.26"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets

  # Define the worker nodes
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "MyKeyPair"  # Add your EC2 key pair name here
    }
  }

  tags = {
    Terraform = "true"
    Environment = "test"
  }
}
