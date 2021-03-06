#!/bin/sh
ACTION=${1:-"none"}
IMAGE=user/nginx
CONTAINER=mycontainer
if [ "rebuild" = $ACTION ]
  then
  docker build -t $IMAGE .
fi 
docker stop -t 0 $CONTAINER
docker rm $CONTAINER
docker run -d \
	--name $CONTAINER \
	--restart=always \
	-v $PWD/www:/usr/share/nginx/html:rw \
	-p 80:80 -p 443:443 \
	$IMAGE
