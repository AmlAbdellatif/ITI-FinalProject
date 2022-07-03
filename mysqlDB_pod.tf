resource "kubernetes_pod_v1" "mysqlpod" {
  metadata {
    name      = "mysqlpod"
    namespace = kubernetes_namespace.dev.id
    labels = {
      app = "mysql"
    }
  }

  spec {

    container {
      image = "mysql:5.7"
      name  = "mysqlpod"
      env {
        name = "MYSQL_ROOT_PASSWORD"
        value_from{
			secret_key_ref {
			  name = "db-secret"
			  key = "MYSQL_ROOT_PASSWORD"
			}
		}
		}
		env{
	name = "MYSQL_DATABASE"	
	 value_from{
         secret_key_ref {
          name = "db-secret"
          key = "MYSQL_DATABASE"
        }
        }
        
        
         

      }


      port {
        container_port = 3306
      }
    }

  }
}
############
#*********************** CLUSTER-IP -- NodeJs to communicate with mysql as a backend  **************
###############
resource "kubernetes_service" "mysqlsvc" {
  metadata {
    name      = "mysqlsvc"
    namespace = kubernetes_namespace.dev.id
  }
  spec {
    selector = {
      app = kubernetes_pod_v1.mysqlpod.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port = 3306
    }
    type = "ClusterIP"
  }
}
