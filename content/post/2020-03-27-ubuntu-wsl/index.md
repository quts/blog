---
title: Install Jenkins on WSL-Ubuntu
date: 2020-03-27
categories:
  - "DevOps"
tags:
  - "Jenkins"
  - "WSL"
  - "Ubuntu"
lead: "Install Jenkins on Windows Subsystem Linux (Ubuntu)"
---
If you are working on the build flow maintenance with Jenkins, how do you verify your pipeline script? I mean a local compiler/interpreter like MSBuild/GCC/python or something else. I don't know, so I would like to have a Jenkins server in my local machine, so before I deploy the script to the staging environment, I can test it locally. Docker image may the right choice, but in Windows OS you can not install docker and other virtual machine solution at the same time, so I want to try if WSL helps on this.
# Launch WSL
To enable the WSL feature in your Windows 10 is pretty straightforward. All you need to do it go to the Windows App Store and search for a distribution you want. For example, “Ubuntu”, and then install it just like install an App on your mobile phone. After everything finished, search the App you just installed, a Ubuntu WSL will present to you!
# Install Jenkins
Here is the note about installing Jenkins on WSL that I collect from site list in reference,
Make an apt update, or JRE may download incomplete,
```sh
sudo apt update
```
Install Java Runtime Environment (JRE)
```sh
sudo apt install default-jdk default-jre
```
Right here, I will test if java installed by this
```sh
javac
```
Setup GPG keys of the Jenkins repository
```sh
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
```
Add Jenkins repository
```sh
sudo sh -c "echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"
```
Make an apt update before installing, since you just add a new repository,
```sh
sudo apt update
```
Install Jenkins via apt
```sh
sudo apt install jenkins
```
Start Jenkins services by
```sh
sudo /etc/init.d/jenkins start
```
# Launch Jenkins
Launch your browser and navigate to
```plaintext
http://{your_ip}:8080
```
Here you are, your personal Jenkins in WSL!!! At the first time you launch your Jenkins, you will need an initial admin password, just “more” this,
```sh
sudo more /var/lib/jenkins/secrets/initialAdminPassword
```
# Reference
- <https://linuxize.com/post/how-to-install-jenkins-on-ubuntu-18-04/>
- <https://ubuntu.com/wsl>
- <https://t.codebug.vip/questions-1313859.htm>