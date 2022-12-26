# Create IAM role for EKS Node Group
resource "aws_iam_role" "telecom-workers-nodes" {

  name = "telecom-workers-nodes"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }, 
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "telecom_eks_worker_nodes_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.telecom-workers-nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"


  role = aws_iam_role.telecom-workers-nodes.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_readonly" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"


  role = aws_iam_role.telecom-workers-nodes.name
}


resource "aws_eks_node_group" "telecom-nodes" {

  cluster_name = aws_eks_cluster.telecom-project.name

  node_group_name = "telecom-nodes"

  node_role_arn = aws_iam_role.telecom-workers-nodes.arn


  subnet_ids = [
    aws_subnet.telecom_subnet_private_1.id,
    aws_subnet.telecom_subnet_private_2.id
  ]


  scaling_config {

    desired_size = 5


    max_size = 7


    min_size = 5
  }


  ami_type = "AL2_x86_64"


  capacity_type = "ON_DEMAND"


  disk_size = 20


  force_update_version = false


  instance_types = ["t2.medium"]

  labels = {
    role = "telecom-nodes"
  }

  # Kubernetes version
  version = "1.20"


  depends_on = [
    aws_iam_role_policy_attachment.telecom_eks_worker_nodes_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_readonly,
  ]

  tags = {
    Name = "telecom-project-node"
  }

}