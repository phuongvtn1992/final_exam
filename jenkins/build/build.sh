#!/bin/bash

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"
echo "Value: $@"
  
if [ $@ = "NodeJS" ]
then
   cd $WORKSPACE/node-hello && docker build -t nodejsapp:$BUILD_TAG .
elif [ $@ = "Python" ]
then
   cd $WORKSPACE/b9-python-app && docker build -t pythonapp:$BUILD_TAG .
elif [ $@ = "All" ]
then
   cd $WORKSPACE/node-hello && docker build -t nodejsapp:$BUILD_TAG .
   cd $WORKSPACE/b9-python-app && docker build -t pythonapp:$BUILD_TAG .
else
   echo "Not buid anything"
fi	
