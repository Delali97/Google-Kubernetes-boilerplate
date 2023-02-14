pipeline {
  agent any
  stages {
    stage('Required GPG') {
      steps {
        sh 'sudo apt update && sudo apt install gpg'
        sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg'
        sh 'gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint'
        sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
        sh 'sudo apt update'
        sh 'sudo apt install terraform'
      }
    }
    stage ('Install AWS CLI') {
      steps {
      sh 'sudo apt install unzip -y'
      sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
      sh 'sudo rm -rf ./aws'
      sh 'sudo rm -rf /usr/local/aws-cli'
      sh 'unzip awscliv2.zip'
      sh 'sudo ./aws/install'
      sh './awscli.sh'
      }
    }
  }
}
