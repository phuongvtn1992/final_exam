#!/bin/bash

#cp -f pipeline6/java-app/target/*.jar pipeline6/jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

if "$@" == "NodeJS"
then
   cd node-hello && docker build -t nodejsapp:latest .
elif "$@" == "Python"
then
   cd b9-python-app && docker build -t pythonapp:latest .
else
   #cd node-hello && docker build -t nodejsapp:latest . && cd .. && cd b9-python-app && docker build -t pythonapp:latest .
   echo "Not buid anything"
fi	
