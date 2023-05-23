# OOPENID : IAM OIDC identity providers are entities in IAM that describe an external identity provider (IdP) service that supports 
#the OpenID Connect (OIDC) standard, such as Google or Salesforce.

#You use an IAM OIDC identity provider when you want to establish trust between an OIDC-compatible IdP and your AWS account.

data "tls_certificate" "eks" {
  url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}