FROM openjdk:11-jdk as builder

COPY src/main/java/docker_workshop /docker_workshop/

RUN javac /docker_workshop/Countdown.java


FROM openjdk:11-jre

COPY --from=builder /docker_workshop/Countdown.class /docker_workshop/

CMD ["java", "docker_workshop.Countdown"]
