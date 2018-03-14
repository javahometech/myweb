try{
    node {
    echo 'Build Started'
    stage('Checkout'){
         git branch: 'one', credentialsId: 'bitbucket', url: 'https://github.com/javahometech/myweb'
    }
    stage('Test'){
        sh 'mvn test'
    }
    stage('Package'){
        sh 'mvn package'
    }
    stage('Deploy-dev'){
        echo 'Deployed to dev'
    }
    stage('Deploy-stg'){
        echo 'Deployed to stg'
    }
    stage('Deploy-prod'){
        echo 'Deployed to prod'
    }
    
    stage('Email'){
     body_msg = ''' Jenkins Job success 
   
    '''+"$JOB_URL"+''' 
    Thanks
    Jenkins
    '''
   mail bcc: '', body: body_msg, cc: '', from: '', replyTo: '', subject: 'Job Success', to: 'hari.kammana@gmail.com'
   
    }
  }
}catch(error){
   echo 'Some error' 
   throw error
}
