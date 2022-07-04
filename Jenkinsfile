pipeline {
    agent any
    stages {
        stage('CD') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'nexus' , usernameVariable: 'nexus__username', passwordVariable: 'nexus_pass')]) 
            withKubeConfig([credentialsId: 'kubernates']) 
             {        
                sh """
               kubectl apply -f app.yaml
                    
               
               """
                }
            }
        }

    }
}
