node{
    stage('Git Checkout'){
      git credentialsId: 'git-javahometech',
          url: 'https://github.com/javahometech/my-app',
		  branch: "master"
    }
    
    stage('Maven Build'){
		def mvnHome = tool name: 'maven3', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
    }
	
	stage('Sonar Analysis'){
		withCredentials([string(credentialsId: 'sonar-token', variable: 'sonarToken')]) {
		def mvnHome = tool name: 'maven3', type: 'maven'
		def sonarUrl = 'http://172.31.25.28:9000'
		echo("${mvnHome}/bin/mvn sonar:sonar -Dsonar.host.url=${sonarUrl} -Dsonar.login=${sonarToken}")
		sh "${mvnHome}/bin/mvn sonar:sonar -Dsonar.host.url=${sonarUrl} -Dsonar.login=${sonarToken}"
        }
	}

}

