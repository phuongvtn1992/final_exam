#!/bin/bash

#cp -f pipeline6/java-app/target/*.jar pipeline6/jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"
echo "Value: $@"
if [ $@ = "NodeJS" ]
then
   cd $WORKSPACE/node-hello && docker image rm nodejsapp:latest && docker build -t nodejsapp:latest .
elif [ $@ = "Python" ]
then
   cd $WORKSPACE/b9-python-app && docker image rm pythonapp:latest && docker build -t pythonapp:latest .
elif [ $@ = "All" ]
then
   cd $WORKSPACE/node-hello && docker image rm nodejsapp:latest && docker build -t nodejsapp:latest .
   cd $WORKSPACE/b9-python-app && docker image rm pythonapp:latest && docker build -t pythonapp:latest .
else
   echo "Not buid anything"
fi	
