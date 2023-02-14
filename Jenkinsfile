pipeline {
  agent any
  stages {
    stage('Install Terraform & Required GPG') {
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
        }
      }
    
    stage ('Install KubeCTL') {
      steps {
        sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"'
        sh 'curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"'
        sh 'echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check'
        sh 'sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl'
        sh 'kubectl version --client --output=yaml'
      }
    }
    stage ('Install EKSCTL') {
      steps {
        sh 'curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp'
        sh 'sudo mv /tmp/eksctl /usr/local/bin'
        sh 'eksctl version'
      }
    }
    stage ('Create EKS Cluster') {
      steps {
       //sh 'git clone https://github.com/Delali97/Google-Kubernetes-boilerplate.git'
       sh 'ls -la'
       sh 'cd Google-Kubernetes-boilerplate'
       sh 'eksctl create cluster -f testing.yaml --dry-run'
       sh 'eksctl create cluster -f testing.yaml'
       sh 'kubectl get nodes -o wide'
       sh 'kubectl get pods -A -o wide'
      }
    }
  }
}

