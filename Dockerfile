FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/myweb*.war /usr/local/tomcat/webapps/myweb.war

# Git webhook trigger demo again
# TO test github push trigger
