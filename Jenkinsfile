pipeline {
    agent any
    stages {
        stage('CD') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'nexus-iamge' , usernameVariable: 'nexus__username', passwordVariable: 'nexus_pas             s')]) 
             {        
                sh """
               kubectl apply -f app.yaml
               
               
               """
                }
            }
        }

    }
}
