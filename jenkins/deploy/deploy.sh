#!/bin/bash

echo "********************"
echo "** Deploying image ***"
echo "********************"

echo "** Logging in ***"
docker login -u phuongvo1992 -p $PASS

check_img_exist(){
  if [[ "$(docker images -q $1 2> /dev/null)" != "" ]]; then
    docker image rm $1
  fi
}
case $@ in
  NodeJS)
    echo "*** Tagging image ***"
    docker tag nodejsapp:latest phuongvo1992/nodejsapp:latest
    echo "*** Pushing image ***"
    docker push phuongvo1992/nodejsapp:latest
    ;;
  Python)
    echo "*** Tagging image ***"
    docker tag pythonapp:latest phuongvo1992/pythonapp:latest
    echo "*** Pushing image ***"
    docker push phuongvo1992/pythonapp:latest
    ;;
  All)
    echo "*** Tagging image ***"
    docker tag nodejsapp:latest phuongvo1992/nodejsapp:latest
    docker tag pythonapp:latest phuongvo1992/pythonapp:latest
    echo "*** Pushing image ***"
    docker push phuongvo1992/nodejsapp:latest
    docker push phuongvo1992/pythonapp:latest
    ;;
  *)
    echo "Not push anything"  
esac

