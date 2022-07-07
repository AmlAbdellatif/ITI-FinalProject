resource "kubernetes_cluster_role_v1" "jenkins_role" {
  metadata {
    name = "jenkins_role"
  }

  rule {
    api_groups = ["*"]
    resources  = ["deployments", "replicasets", "pods"]
    verbs      = ["create","get","list"]
  }
}
