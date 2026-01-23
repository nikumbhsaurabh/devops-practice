FROM ubuntu:22.04
WORKDIR /app
COPY system_info.sh .

RUN chmod +x system_info.sh \
    && apt-get update \
    && apt-get install -y procps coreutils

CMD ["./system_info.sh"]

