resource "kubernetes_config_map_v1" "db-secret" {
  metadata {
    name = "db-secret"
    namespace = "dev"
  }

  data = {
    # api_host             = "myhost:443"
    db_host              = "mysqlsvc:3306"
    "my_config_file.yml" = "${file("configmap.yml")}"
  }

}
