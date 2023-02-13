pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                sh 'git branch: 'main', credentialsId: 'for-git', url: 'https://github.com/Delali97/Google-Kubernetes-boilerplate.git'
                sh 'pwd'
                sh 'ls -la'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'cd /var/jenkins_home/workspace/bootcamp/app/adservice'
                sh 'docker --version'
                sh 'sudo docker build -t app/adservice .'
            }
        }
    }
}
