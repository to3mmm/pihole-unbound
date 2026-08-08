#!/bin/sh
set -eu

CONFIG=/etc/unbound/unbound.conf
HINTS=/etc/unbound/root.hints
ROOTKEY=/var/lib/unbound/root.key

if [ ! -f "$HINTS" ]; then
    echo "Downloading root hints..."
    curl -fsSL https://www.internic.net/domain/named.cache -o "$HINTS"
fi

if [ ! -f "$ROOTKEY" ]; then
    echo "Creating DNSSEC root key..."
    unbound-anchor -a "$ROOTKEY"
fi

echo "Checking configuration..."
unbound-checkconf "$CONFIG"

echo "Starting Unbound..."
exec unbound -d -c "$CONFIG"
