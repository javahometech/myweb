pipeline{
    agent any
    stages{
        stage("GIT checkout"){
            steps{
                git credentialsId: 'javahome', url: 'https://github.com/srinivas1987devops/myweb.git'
                
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
         }
    }
}
