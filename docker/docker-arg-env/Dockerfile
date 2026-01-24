FROM ubuntu:22.04

#Build-time variable
ARG BUILD_VERSION=1.0

#Run-time variable
ENV APP_NAME=devops-app
ENV ENVIRONMENT=dev

WORKDIR /app
COPY app.sh .

RUN chmod +x app.sh

CMD ["./app.sh"]
