FROM openjdk

ENV JAVA_APP_JAR demo-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ADD ./target/$JAVA_APP_JAR /deployments/

ENTRYPOINT ["java","-jar","/deployments/demo-0.0.1-SNAPSHOT.jar"]