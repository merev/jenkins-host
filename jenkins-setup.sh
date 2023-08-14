#!/bin/bash

echo "* Install Java version 11 ..."
apt-get update
apt-get install -y fontconfig openjdk-17-jre curl git

echo "* Download the key ..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "* Create record for the repository ..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "* Update package information and install Jenkins ..."
apt-get update
apt-get install -y jenkins
