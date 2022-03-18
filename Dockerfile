ARG BASEIMAGE=alpine:3.15
FROM ${BASEIMAGE}

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL mantainer="Eloy Lopez <elswork@gmail.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="cwebp" \
    org.label-schema.description="libwebp codec distribution a reference implementation for the encoder and decoder applications" \
    org.label-schema.url="https://deft.work/cwebp" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/Eloy Lopez/cwebp" \
    org.label-schema.vendor="Deft Work" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

RUN apk update && \
    apk upgrade -U && \
    apk add ca-certificates libwebp libwebp-tools && \
    rm -rf /var/cache/*
WORKDIR /data
# ENTRYPOINT ["/bin/ash"]
