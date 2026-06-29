FROM docker.io/redhat/ubi9
WORKDIR /app
COPY ./ /app
RUN chmod +x gradlew &&  ./gradlew bootJar --no-daemon -x test  && cp /app/build/libs/*.jar /app/portfolio-service.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "portfolio-service.jar"]


