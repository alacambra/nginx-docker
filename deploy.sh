#!/bin/sh

USER=$1
DOMAIN=$2

echo "Deleting old context on server..."
ssh -t ${USER}@${DOMAIN} "rm -rf /home/${USER}/nginx-build"
scp -r ./build/ ${USER}@${DOMAIN}:/home/${USER}/nginx-build
echo "Building container on server..."
ssh -t ${USER}@${DOMAIN} "cd /home/${USER}/nginx-build/ && ./build.sh"