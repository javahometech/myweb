mv target/myweb*.war target/myweb.war

sftp ec2-user@172.31.17.24 <<EOF

rename /opt/tomcat8/webapps/myweb.war /tmp/myweb.war.back
rm /opt/tomcat8/webapps/myweb*
put target/myweb.war  /opt/tomcat8/webapps/
bye
EOF
ssh ec2-user@172.31.17.24 /opt/tomcat8/bin/shutdown.sh
ssh ec2-user@172.31.17.24 /opt/tomcat8/bin/startup.sh
