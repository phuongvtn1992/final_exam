#!/bin/bash

echo "********************"
echo "** Deploying app ***"
echo "********************"

echo "** Logging in ***"
docker login -u phuongvo1992 -p $PASS
#docker login -u phuongvo1992 -p Phuongvo92
HOST_NAME=$(hostname)
#echo $HOST_NAME
get_tag_image(){
  APP_VER=$(docker image ls $@ | awk '{print $2}' | grep -v TAG)
  echo $APP_VER
}

remove_container_exist(){
  if [[ $(docker ps -a --filter ancestor=$1 |wc -l) != 0 ]]; then
    CONTAINER_ID=$(docker ps -a --filter ancestor=$1 | awk '{print $1}' | grep -v 'CONTAINER')
    echo "container ID: $CONTAINER_ID"
    docker rm --force $CONTAINER_ID
  fi
}
remove_img_exist(){
  if [[ "$(docker images -q $1 2> /dev/null)" != "" ]]; then
    docker image rm $1
  fi
}
#remove_container_exist phuongvo1992/nodejsapp:latest
#remove_img_exist phuongvo1992/nodejsapp:latest
#docker pull phuongvo1992/nodejsapp:latest
#get_tag_image phuongvo1992/nodejsapp:latest
#echo "application version: $APP_VER"
#docker run -p 3000:3000 -e APP_TYPE=Node -e HOSTNAME=$HOST_NAME -e APP_VERSION=$APP_VER -d phuongvo1992/nodejsapp:latest

prepare_image_for_app(){
  echo "*** Remove current container/image***"
  remove_container_exist $@
  remove_img_exist $@
  echo "*** Get app version***"
  get_tag_image $@
  echo "*** Pulling latest image ***"
  docker pull $@
}

case $@ in
  NodeJS)
    prepare_image_for_app phuongvo1992/nodejsapp:latest
    echo "*** Running Nodeapp ***"
    docker run -p 3000:3000 -e APP_TYPE=Nodejs -e HOSTNAME=$HOST_NAME -e APP_VERSION=$APP_VER -d phuongvo1992/nodejsapp:latest
    ;;
  Python)
    prepare_image_for_app phuongvo1992/pythonapp:latest
    echo "*** Running Nodeapp ***"
    docker run -p 5000:5000 -e APP_TYPE=Python -e HOSTNAME=$HOST_NAME -e APP_VERSION=$APP_VER -d phuongvo1992/pythonapp:latest
    ;;
  All)
    prepare_image_for_app phuongvo1992/nodejsapp:latest
    echo "*** Running Nodeapp ***"
    docker run -p 3000:3000 -e APP_TYPE=Nodejs -e HOSTNAME=$HOST_NAME -e APP_VERSION=$APP_VER -d phuongvo1992/nodejsapp:latest
    prepare_image_for_app phuongvo1992/pythonapp:latest
    echo "*** Running Nodeapp ***"
    docker run -p 5000:5000 -e APP_TYPE=Python -e HOSTNAME=$HOST_NAME -e APP_VERSION=$APP_VER -d phuongvo1992/pythonapp:latest
    ;;
  *)
    echo "Not push anything"  
esac

