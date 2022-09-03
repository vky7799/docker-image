FROM openjdk as stage1
WORKDIR /source
COPY ./Prime.java .
RUN javac Prime.java

FROM ubuntu
WORKDIR /app
COPY --from=stage1 /source/Prime.class .
RUN apt-get update && apt-get install openjdk-18-jre-headless -y
CMD ["java","Prime"]
~
