mv target/myweb*.war target/myweb.war

sftp ec2-user@172.31.31.47 <<EOF
  rename /home/ec2-user/tomcat8/webapps/myweb.war /tmp/myweb.war.back
  rm /home/ec2-user/tomcat8/webapps/myweb*
  put target/myweb.war  /home/ec2-user/tomcat8/webapps/
  bye
EOF

ssh ec2-user@172.31.31.47 /home/ec2-user/tomcat8/bin/startup.sh
