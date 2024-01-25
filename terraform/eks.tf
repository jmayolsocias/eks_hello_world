resource "aws_eks_cluster" "hello_world" {
  name     = "hello_world"
  role_arn = aws_iam_role.hello_world.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id,
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.hello_world-AmazonEKSClusterPolicy]
}

output "endpoint" {
  value = aws_eks_cluster.hello_world.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.hello_world.certificate_authority[0].data
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.hello_world.name
  node_group_name = "nodes"
  node_role_arn   = aws_iam_role.nodes.arn

  subnet_ids = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "hello_world"
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}