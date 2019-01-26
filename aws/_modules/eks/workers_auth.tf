resource "kubernetes_config_map" "example" {
  provider = "kubernetes.eks"

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data {
    mapRoles = <<MAPROLES
- rolearn: ${aws_iam_role.node.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
MAPROLES
  }
}