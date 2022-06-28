FROM alpine:latest

RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.0/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

