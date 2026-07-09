FROM        docker.io/library/openjdk:21-ea AS builder
WORKDIR     /app
COPY        ./ /app/
RUN         chmod +x gradlew
RUN         ./gradlew bootJar --no-daemon -x test


FROM        docker.io/redhat/ubi9:latest
RUN         dnf install java-21-openjdk.x86_64 -y
COPY        --from=builder  /app/build/libs/*.jar portfolio-service.jar
ENTRYPOINT  [ "java", "-jar", "./portfolio-service.jar" ]




