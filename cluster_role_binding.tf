resource "kubernetes_cluster_role_binding_v1" "jenkins_role_binding" {
  metadata {
    name = "jenkins_role_binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "jenkins_role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "jenkins-service-account"
    namespace = "tools"
  }
}
