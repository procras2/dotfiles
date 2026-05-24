#!/bin/bash
# Script to start an ssh tunnel to eilise
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

if [ -e /tmp/tunnel.pid ]
then
  echo -e "${RED}/tmp/tunnel.pid exists${NC} -> cannot start tunnel again"
  exit 1
fi

ssh ian \
  -N \
  -f \
  -L 9000:192.168.1.4:80 \
  -L 20000:192.168.1.6:80 \
  -L 21000:192.168.1.6:9812

echo -e "Tunnel is ${GREEN}Up${NC}."
  
ps aux | grep ssh | grep ian | awk '{print $2}' > /tmp/tunnel.pid

echo -e "You may close this with $ kill -9 ${YELLOW}$(cat /tmp/tunnel.pid)${NC}"

sshfs -p 21000 adrian@localhost:/mnt/boole ian/

echo -e "Remote filesystem available on ${GREEN}ian/${NC}"
echo -e "Please close this down with ${YELLOW}$ fusermount -u ian/${NC}"
echo -e "Or ${YELLOW}$ bin/tunneldown.sh${NC}"
echo -e "${YELLOW}Done${NC}"
