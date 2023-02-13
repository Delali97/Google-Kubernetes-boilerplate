pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker --version'
                sh 'cd app/adservice'
                sh 'sudo docker build -t app/adservice .'
               
            }
        }
        
        stage('Test') {
            steps {
                sh 'sudo docker run --name adservice -d -p 7700:9555 app/adservice'
            }
        }
        
//         stage('Push to Docker Hub') {
//             steps {
//                 sh 'docker login -u dela;ixx -p dckr_pat_3htEwdzErAa3N4Doxkyo_XcBx6k'
//                 sh 'docker push frontend2'
//             }
//         }
        
//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh 'kubectl apply -f <kubernetes-manifest-file>.yml'
//             }
//         }
    }
}
