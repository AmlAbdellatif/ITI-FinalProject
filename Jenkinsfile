pipeline {
    agent any
    stages {
        stage('CD') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'nexus-iamge' , usernameVariable: 'nexus__username', passwordVariable: 'nexus_pas             s')]) 
             {        
                sh """
               docker pull  10.108.235.232:8801/repository/docker-repo/nodejsapp:latest               
               
               """
                }
            }
        }

    }
}
