pipeline {
    agent any
    stages {
        stage('CD') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'nexus' , usernameVariable: 'nexus__username', passwordVariable: 'nexus_pass')]) 
             {        
                sh """
               kubectl apply -f app.yaml
                    
               
               """
                }
            }
        }

    }
}
