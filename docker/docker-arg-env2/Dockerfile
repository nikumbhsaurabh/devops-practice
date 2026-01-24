FROM ubuntu:22.04

#Build-time variable
ARG BUILD_VERSION=1.0

#Run-time variables
ENV ENVIRONMENT=dev
ENV APP_PORT=8080

WORKDIR /app
COPY run.sh .

RUN chmod +x run.sh

CMD ["./run.sh"]
