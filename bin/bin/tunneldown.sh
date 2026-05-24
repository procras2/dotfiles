#!/bin/bash
# Script to end ssh tunnel created in bin/tunnelup.sh
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

if [ ! -e /tmp/tunnel.pid ]; then
  echo -e "${RED}/tmp/tunnel.pid does not exist${NC} -> Cannot close it down"
  exit 1
fi

echo "Unmounting remote file system."
fusermount3 -u ian/
echo "Shutting down tunnel."
/usr/bin/kill -9 $(cat /tmp/tunnel.pid)

rm -f /tmp/tunnel.pid
echo -e "${YELLOW}Done${NC}"
