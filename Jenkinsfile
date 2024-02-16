node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("nseal98/mywas")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'ncp_test') {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
         }
     }

     stage('Deploy') {
        sh 'docker pull nseal98/mywas:"${env.BUILD_NUMBER}"'
        sh 'docker stop your-container && docker rm your-container || true'
        sh 'ddocker run -d --name tomcat -p 8090:8080 --network ncs-network --ip 192.168.1.200 --hostname tomcat nseal98/mywas:"${env.BUILD_NUMBER}"'
     }
 }
