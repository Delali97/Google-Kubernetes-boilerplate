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
                pipeline {
    agent any

    stages {
        stage('Install Docker and Docker Compose') {
            steps {
                sh 'sudo apt-get update -y'
                sh 'sudo apt-get install -y ca-certificates curl gnupg lsb-release'
                sh 'sudo mkdir -p /etc/apt/keyrings'
                sh 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg'
                sh 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
                sh 'sudo apt-get update -y'
                sh 'sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin'
                sh 'sudo docker --version'
                sh 'sudo groupadd docker'
                sh 'sudo usermod -aG docker ${USER}'
                sh 'sudo systemctl restart docker'
                sh 'sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
                sh 'sudo chmod +x /usr/local/bin/docker-compose'
                sh 'docker-compose --version'
                sh 'sudo apt install net-tools -y'
                sh 'newgrp docker'
            }
        }
    }
}

                sh 'docker --version'
                sh 'sudo docker build -t app/adservice .'
            }
        }
    }
}
