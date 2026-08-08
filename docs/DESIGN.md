# Pi-hole Unbound

## Goal

A production-ready Unbound container optimized for:

- Pi-hole
- TrueNAS SCALE
- Docker
- Docker Compose

## Design principles

- Secure by default
- Privacy first
- Minimal dependencies
- Multi-architecture
- Immutable container
- Configuration outside the image
- No manual steps after installation

## Supported platforms

- amd64
- arm64

## Features

- Recursive resolver
- DNSSEC
- QNAME minimisation
- Aggressive NSEC
- Prefetch
- Serve Expired
- DNS Flag Day compliant
- Automatic root.hints update
- Automatic root.key generation

## Out of scope

- DoH
- DoT
- Forwarders
- DHCP
- Web UI