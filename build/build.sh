#!/bin/sh

NAME=nginx-proxy

sudo docker build -t ${NAME} .
sudo docker kill ${NAME}
sudo docker rm ${NAME}
sudo docker run -d --name ${NAME} --restart=always -p 80:80 -p 443:443 ${NAME}
