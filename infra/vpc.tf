module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-capstone-vpc"
  cidr = "10.2.0.0/16"

  azs            = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.2.1.0/24", "10.2.2.0/24"]

  map_public_ip_on_launch = true

  public_subnet_tags = {
    "kubernetes.io/cluster/eks-capstone" = "shared"
    "kubernetes.io/role/elb"             = "1"
  }
}