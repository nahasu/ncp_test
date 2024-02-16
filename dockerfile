FROM tomcat

RUN mkdir /usr/local/tomcat/webapps/ROOT
COPY index.html /usr/local/tomcat/webapps/ROOT/index.html

EXPOSE 8080

CMD ["catalina.sh", "run"]
