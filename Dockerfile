FROM alpine:3
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

RUN apk add smartmontools

ARG TARGETARCH
ARG TARGETOS
COPY .build/${TARGETOS}-${TARGETARCH}/smartctl_exporter /bin/smartctl_exporter

EXPOSE      9633
USER        nobody
ENTRYPOINT  [ "/bin/smartctl_exporter" ]
