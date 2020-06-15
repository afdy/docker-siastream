FROM debian

ENV URL https://skyportal.xyz/AACp1H5X6zKVqfit4BXAM0nWmdPUvi-xKqjHhiQyQJ-Qvw
ENV HOST=0.0.0.0

RUN apt-get update && \
    apt-get install -y wget unzip fuse && \
    mkdir -p /siastream && \
    wget -O /tmp/siastream.zip ${URL} && \
    cd /siastream && \
    unzip /tmp/siastream.zip && \
    rm -rf /tmp/sia/ /tmp/sia.zip /var/lib/apt/lists

WORKDIR /siastream
EXPOSE 3000

CMD ["/siastream/siastream-linux-x64/siastream-app", "--siad-dir", "/sia", "--siastream-dir", "/sia/data"]
