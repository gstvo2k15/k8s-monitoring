`helm install tomcat ./helm_tomcat -n tomcat --create-namespace`

### Create adhoc tomcat-exporter
```
cat <<EOF > Dockerfile
FROM tomcat:9.0
RUN curl -o /usr/local/tomcat/webapps/tomcat_exporter.war \
    https://repo1.maven.org/maven2/io/prometheus/tomcat_exporter/0.15.0/tomcat_exporter_servlet-0.15.0.war
EOF

docker build -t mytomcat-exporter .
  
docker tag mytomcat-exporter gstvo2k15/mytomcat-exporter

docker push gstvo2k15/mytomcat-exporter
```
