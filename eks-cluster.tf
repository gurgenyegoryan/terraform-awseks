resource "aws_iam_role" "telecom-iam-role" {
  name = "telecom-iam-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "telecom-eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.telecom-iam-role.name
}

### Create Cluster

resource "aws_eks_cluster" "telecom-project" {

  name = "telecom-project"

  role_arn = aws_iam_role.telecom-iam-role.arn
  version  = "1.20"
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.telecom_subnet_public_1.id,
      aws_subnet.telecom_subnet_public_2.id,
      aws_subnet.telecom_subnet_private_1.id,
      aws_subnet.telecom_subnet_private_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.telecom-eks-cluster-policy
  ]
  tags = {
    Name = "telecom-project"
  }
}

