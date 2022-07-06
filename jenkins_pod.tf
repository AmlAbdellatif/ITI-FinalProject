resource "kubernetes_pod_v1" "jenkinspod" {
  metadata {
    name      = "jenkinspod"
    namespace = kubernetes_namespace.tools.id
    labels = {
      app = "jenkins"
    }
  }

  spec {
    container {
      image = "menna97/docker-jenkins-image"
      name  = "jenkinspod"
      port {
        container_port = 8080
      }
      volume_mount {
        mount_path = "/var/run/"
        name       = "docker-demone"
      }

    }


    volume {
      host_path {
        path = "/var/run/"

      }
      name = "docker-demone"
    }
    
    service_account_name = "jenkins-service-account" 
  }

}
############
#*********************** NODE_PORT to Access jenkins From Local Browser  **************
###############
resource "kubernetes_service" "jenkinssvc" {
  metadata {
    name      = "jenkinssvc"
    namespace = kubernetes_namespace.tools.id
  }
  spec {
    selector = {
      app = kubernetes_pod_v1.jenkinspod.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port      = 8080
      node_port = 30085
    }
    type = "NodePort"
  }
}
