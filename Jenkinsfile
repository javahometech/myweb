pipeline{
	agent any
	
	environment {
		PATH = "${PATH}:${getMavenPath()}"
		DOCKER_TAG = "${getLatestCommitId()}"
		NEXUS_HOST = "172.31.45.145:8083"
		DEV_IP = "172.31.6.150"
	}
	stages{
	/*
		stage('SCM - Checkout'){
			steps{
				git url: 'https://github.com/javahometech/myweb'
			
			}
		}
	*/	
	
	    stage('sonar and maven'){
			parallel{
				stage('Sonar Report'){
					steps{
						withSonarQubeEnv('sonar-7.5') {
							sh "mvn sonar:sonar"
							
					    }
						
						timeout(time: 1, unit: 'HOURS') {
								script{
									def qg = waitForQualityGate()
									if (qg.status != 'OK') {
										error "Pipeline aborted due to quality gate failure: ${qg.status}"
									}
								}
						}
					
					}
				
				}
				
				stage('Maven Build'){
					steps{
					
						sh "mvn clean package"
					}
				
				}
			
			}
		
		}	
	
		stage('Docker - Build'){
			steps{
			   withCredentials([string(credentialsId: 'nexus-docker', variable: 'nexusPwd')]) {
					sh "docker login -u admin -p ${nexusPwd} ${NEXUS_HOST}"
			   }
			   
			   sh "docker build . -t ${NEXUS_HOST}/myweb:${DOCKER_TAG} "
			}
		}
		
		stage('Docker - Push'){
			steps{
			   sh "docker push ${NEXUS_HOST}/myweb:${DOCKER_TAG}"
			}
		}
		
		stage('Docker - Deploy - Dev'){
			steps{
			    // input 'Do you want to deploy to dev servers?'
				
				sh returnStatus: true, script: "ssh ec2-user@${DEV_IP} docker rm -f myweb"
				withCredentials([string(credentialsId: 'nexus-docker', variable: 'nexusPwd')]) {
					sh returnStatus: true, script: "ssh ec2-user@${DEV_IP} docker login -u admin -p ${nexusPwd} ${NEXUS_HOST}"
			    }
				
				sh returnStatus: true, script: 'ssh ec2-user@${DEV_IP} docker rmi $(docker images | grep 172.31.45.145:8083/myweb | awk \'{print $3}\')'
				sh "ssh ec2-user@${DEV_IP} docker run -d -p 8080:8080 --name=myweb ${NEXUS_HOST}/myweb:${DOCKER_TAG}"	
			}
		}
	
	}
	post{
		always{
			mail  body: """Hi Dev Team,
	${env.BUILD_URL}
This Job ran 

Thanks,
DevOps Team""", subject: "${env.JOB_NAME} Ran", to: 'hari.kammana@gmail.com'
		}
	}
}

def getMavenPath(){
	def mvnHome = tool name: 'maven-3', type: 'maven'
	return "${mvnHome}/bin"
}

def getLatestCommitId(){
	def commitId = sh returnStdout: true, script: 'git rev-parse HEAD'
	return commitId
}
