FROM alpine:3.22

LABEL org.opencontainers.image.title="Pi-hole Unbound"
LABEL org.opencontainers.image.description="Recursive DNS resolver optimized for Pi-hole"
LABEL org.opencontainers.image.source="https://github.com/to3mmm/pihole-unbound"

RUN apk add --no-cache \
    unbound \
    curl \
    ca-certificates

RUN mkdir -p \
    /etc/unbound/conf.d \
    /var/lib/unbound

COPY config/ /etc/unbound/
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 5335/tcp
EXPOSE 5335/udp

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]