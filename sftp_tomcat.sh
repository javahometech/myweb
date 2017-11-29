mv target/myweb*.war target/myweb.war
scp -r target/myweb.war ubuntu@172.31.28.33:/tmp/

sftp ubuntu@172.31.28.33 <<EOF

  rename /var/lib/tomcat8/webapps/myweb.war /tmp/myweb.war.back
  rm /var/lib/tomcat8/webapps/myweb
  put target/myweb.war  /var/lib/tomcat8/webapps/ 
  bye
  
EOF
