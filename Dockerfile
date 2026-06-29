FROM docker.io/library/eclipse-temurin:21-jdk  AS builder
WORKDIR /app
COPY ./ /app
RUN chmod +x gradlew &&  ./gradlew bootJar --no-daemon -x test  && cp /app/build/libs/*.jar /app/portfolio-service.jar

FROM docker.io/library/eclipse-temurin
COPY --from=builder /app/portfolio-service.jar .
ENTRYPOINT ["/usr/bin/java", "-jar", "portfolio-service.jar"]


