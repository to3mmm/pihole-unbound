FROM alpine:3.22

RUN apk add --no-cache \
    unbound \
    curl \
    ca-certificates

RUN mkdir -p \
    /etc/unbound \
    /var/lib/unbound

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]