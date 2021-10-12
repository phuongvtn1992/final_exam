#!/bin/bash

echo "********************************"
echo "***** Cloning source code ******"
echo "********************************"

#WORKSPACE=/home/centos/mypipeline/jenkins-resources/jenkins/pipeline/jenkins_home/workspace/pipeline-maven-docker
#WORKSPACE=/home/centos/mypipeline/jenkins-resources/jenkins/pipeline/jenkins_home/workspace/pipeline-git
echo $WORKSPACE
REPO_URL = "git@github.com:phuongvtn1992/final_exam.git" 

if cd $WORKSPACE/final_exam; then 
    git pull origin
else 
    git clone $REPO_URL
fi
