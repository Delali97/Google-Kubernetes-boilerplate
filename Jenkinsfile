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
      sh 'sudo cp ./awscli.sh /var/lib/jenkins/workspace/bootcamp'
      }
    }
    stage ('AWS CLI CREDENTIALS') {
      steps {
        sh 'export AWS_ACCESS_KEY_ID=AKIA4IJCS4QYFZN7YKVW'
        sh 'export AWS_SECRET_ACCESS_KEY=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'
      }
    }
      stage ('Install KubeCTL')
      steps {
        sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl'
        sh 'curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256'
        sh 'echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check'
        sh 'sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl'
        sh 'kubectl version --client --output=yaml'
      }
    }
  }
}

