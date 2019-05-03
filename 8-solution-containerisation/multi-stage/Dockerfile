FROM openjdk:11-jdk as builder
COPY src/main/java/workshop/Countdown.java /workshop/
RUN javac /workshop/Countdown.java

FROM openjdk:11-jre
COPY --from=builder /workshop/Countdown.class /app/workshop/
WORKDIR app
CMD ["java", "workshop.Countdown"]
