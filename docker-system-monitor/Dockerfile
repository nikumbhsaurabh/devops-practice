FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y procps coreutils && \
    rm -rf /var/lib/apt/lists/*

COPY scripts/system_info.sh .

RUN chmod +x system_info.sh

CMD ["./system_info.sh"]
