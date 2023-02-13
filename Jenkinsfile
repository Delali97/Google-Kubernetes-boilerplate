pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'cd /var/jenkins_home/workspace/bootcamp/app/adservice'
                sh 'docker --version'
                sh 'sudo docker build -t app/adservice .'
                sh 'ls -la'
            }
        }
    }
}
