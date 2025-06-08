FROM maven:3.9.9-amazoncorretto-8 AS builder

WORKDIR /app

COPY . .
RUN mvn package -DskipTests


FROM amazoncorretto:8-alpine

WORKDIR /app

COPY --from=builder /app/target/docker-example-1.1.3.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]