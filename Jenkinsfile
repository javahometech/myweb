node{
    stage('SCM Checkout'){
      git changelog: false, poll: false, url: 'https://github.com/javahometech/myweb'   
    }
    def mvnHome = tool name: 'maven-3', type: 'maven'
    stage('Test'){
         sh "${mvnHome}/bin/mvn test"
    }
    stage('Package'){
         sh "${mvnHome}/bin/mvn package"
    }
    stage('Deploy To Tomcat'){
        sh '/home/ec2-user/scripts/sftp_tomcat.sh'
    }
    stage('Email'){
        mail bcc: '', body: '''Thanks
Java Home''', cc: '', from: '', replyTo: '', subject: 'MyWeb Deployed', to: 'hari.kammana@gmail.com'
    }
    
}
