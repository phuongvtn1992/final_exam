#!/bin/bash

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"
echo "Value: $@"
check_img_exist(){
  if [[ "$(docker images -q $1 2> /dev/null)" != "" ]]; then
    docker image rm $1
  fi
}
  
if [ $@ = "NodeJS" ]
then
   cd $WORKSPACE/node-hello && check_img_exist nodejsapp:latest && docker build -t nodejsapp:latest .
elif [ $@ = "Python" ]
then
   cd $WORKSPACE/b9-python-app && check_img_exist pythonapp:latest && docker build -t pythonapp:latest .
elif [ $@ = "All" ]
then
   cd $WORKSPACE/node-hello && check_img_exist nodejsapp:latest && docker build -t nodejsapp:latest .
   cd $WORKSPACE/b9-python-app && check_img_exist pythonapp:latest && docker build -t pythonapp:latest .
else
   echo "Not buid anything"
fi	
