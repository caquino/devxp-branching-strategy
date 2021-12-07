FROM alpine:3

LABEL org.opencontainers.image.source=https://github.com/Flutter-Global/devxp-branching-strategy

RUN apk add --no-cache bash \ 
    && rm -rf /tmp/* /var/cache/apk/*

COPY scripts/* /devxp/

COPY bin/entrypoint.sh /

RUN chmod 755 /devxp/* /entrypoint.sh

CMD ["/entrypoint.sh"]

