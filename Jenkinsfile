node{
 stage('Source'){
     git 'https://github.com/javahometech/myweb.git'
 }
 stage('Build'){
    / def mvnHome = tool 'maven3'
    sh  'mvn clean package' 
 }
}
