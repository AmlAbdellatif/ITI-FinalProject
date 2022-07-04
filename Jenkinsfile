pipeline {
    agent any
    stages {
        stage('CD') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'nexus' , usernameVariable: 'nexus__username', passwordVariable: 'nexus_pass')]) 
            withKubeConfig([credentialsId: '29be15a8-f893-4b5e-a801-2c9c906fa33d']) 
             {        
                sh """
               kubectl apply -f app.yaml
                    
               
               """
                }
            }
        }

    }
}
