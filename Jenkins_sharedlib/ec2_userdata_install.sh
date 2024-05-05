#!/bin/bash

# jenkins installation 
sudo apt update -y

sudo apt install openjdk-17-jre -y
java -version


curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y 
sudo apt-get install jenkins -y
sudo service jenkins status 

#Docker installation 
sudo apt-get update 
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock

# running sonarqube as a docker container 
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

# maven installtion 
sudo apt update -y
sudo apt install maven -y
mvn -version

# trivy installation
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy
