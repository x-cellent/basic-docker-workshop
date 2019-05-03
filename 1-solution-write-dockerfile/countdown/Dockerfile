# Multistaging

# Step 1: create image that generate the compiled java App (image = openjdk:11-jdk)

FROM openjdk:11-jdk as builder
COPY src/main/java/workshop/Countdown.java /workshop/
RUN javac /workshop/Countdown.java

# Step 2: create new image. Copy compiled app from other image inside this one and run it.  (image = openjdk:11-jre)

FROM openjdk:11-jre
COPY --from=builder /workshop/Countdown.class /app/workshop/
WORKDIR app
CMD ["java", "workshop.Countdown"]
