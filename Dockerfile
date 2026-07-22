ARG ARCH="amd64"
ARG OS="linux"
FROM alpine:3@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

RUN apk add smartmontools

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/smartctl_exporter /bin/smartctl_exporter

EXPOSE      9633
USER        nobody
ENTRYPOINT  [ "/bin/smartctl_exporter" ]
