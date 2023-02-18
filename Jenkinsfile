pipeline {
  agent any
  stages {
    stage ('Testing') {
      steps {
          git branch: 'main', credentialsId: 'for-git', url: 'https://github.com/Delali97/Google-Kubernetes-boilerplate.git'
          sh ''' sudo docker system prune -af
                 '''
          sh ''' cd app/adservice
                  ls
                  sudo docker --version
                  sudo docker build -t delalixx/adservice .
                  sudo docker push delalixx/adservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/frontend
                  ls
                  sudo docker build -t delalixx/frontend .
                  sudo docker push delalixx/frontend
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/cartservice
                  ls
                  sudo docker build -t delalixx/cartservice .
                  sudo docker push delalixx/cartservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/checkoutservice
                  ls
                  sudo docker build -t delalixx/checkoutservice .
                  sudo docker push delalixx/checkoutservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/currencyservice
                  ls
                  sudo docker build -t delalixx/currencyservice .
                  sudo docker push delalixx/currencyservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/emailservice
                  ls
                  sudo docker build -t delalixx/emailservice .
                  sudo docker push delalixx/emailservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/loadgenerator
                  ls
                  sudo docker build -t delalixx/loadgenerator .
                  sudo docker push delalixx/loadgenerator
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/paymentservice
                  ls
                  sudo docker build -t delalixx/paymentservice .
                  sudo docker push delalixx/paymentservice
                  '''
        sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/productcatalogservice
                  ls
                  sudo docker build -t delalixx/productcatalogservice .
                  sudo docker push delalixx/productcatalogservice
                  '''
         sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/recommendationservice
                  ls
                  sudo docker build -t delalixx/recommendationservice .
                  sudo docker push delalixx/recommendationservice
                  '''
         sh ''' sudo docker system prune -af
                 '''
        sh ''' cd app/shippingservice
                  ls
                  sudo docker build -t delalixx/shippingservice .
                  sudo docker push delalixx/shippingservice
                  '''
        
      }
    }
//     stage ('Create Deploy to Yaml file') {
//       steps {
//           withCredentials([aws(credentialsId: 'aws-credentials', region: 'us-east-2')]) {
//           sh 'kubectl version --client --output=yaml'
//           sh '''
//                 aws eks update-kubeconfig --name bootcampdemo
//                 kubectl config current-context
//                 kubectl config use-context arn:aws:eks:us-east-2:842423002160:cluster/bootcampdemo
//                 kubectl apply -f testing.yaml
//                 kubectl get service
//                 '''
//           }
//         }
//       }
//     stage('Install Terraform & Required GPG') {
//       steps {
//         sh 'sudo apt update && sudo apt install gpg'
//         sh 'wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg'
//         sh 'gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint'
//         sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
//         sh 'sudo apt update'
//         sh 'sudo apt install terraform'
//       }
//     }
//       stage ('Install AWS CLI') {
//         steps {
//         sh 'sudo apt install unzip -y'
//         sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
//         sh 'sudo rm -rf ./aws'
//         sh 'sudo rm -rf /usr/local/aws-cli'
//         sh 'unzip awscliv2.zip'
//         sh 'sudo ./aws/install'
//         }
//       }
    
//     stage ('Install KubeCTL') {
//       steps {
//         sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"'
//         sh 'curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"'
//         sh 'echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check'
//         sh 'sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl'
//         sh 'kubectl version --client --output=yaml'
//       }
//     }
//     stage ('Install EKSCTL') {
//       steps {
//         sh 'curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp'
//         sh 'sudo mv /tmp/eksctl /usr/local/bin'
//         sh 'eksctl version'
//       }
//     }
//     stage ('Create EKS Cluster') {
//       steps {
//        //sh 'git clone https://github.com/Delali97/Google-Kubernetes-boilerplate.git'
//        //sh 'cd Google-Kubernetes-boilerplate'
//        sh 'ls -la'
//        sh 'pwd'
//         dir('/var/lib/jenkins/workspace/bootcamp/Google-Kubernetes-boilerplate') {
//            sh 'ls -la'
//            sh 'eksctl create cluster -f testing.yaml --dry-run'
//            sh 'eksctl create cluster -f testing.yaml'
//            sh 'kubectl get nodes -o wide'
//            sh 'kubectl get pods -A -o wide'
//         }
//       }
//     }
  }
}

