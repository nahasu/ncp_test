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
 }
