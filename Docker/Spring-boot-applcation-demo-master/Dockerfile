FROM openjdk:8u102-jdk
EXPOSE 8080
ADD /target/dockerdemo.jar dockerdemo.jar
ENTRYPOINT ["java", "-jar", "dockerdemo.jar"]