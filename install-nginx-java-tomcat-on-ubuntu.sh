#!/bin/bash

#nginx
apt-get -y install nginx

#java
cd /usr/local
mkdir downloads
cd downloads
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
tar -xvf jdk-8u101-linux-x64.tar.gz
mv jdk1.8.0_101 /usr/local
cd /usr/local
ln -s jdk1.8.0_101 java
ls -al

#tomcat
cd /usr/local/downloads
wget http://apache.tt.co.kr/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz
tar -xvf apache-tomcat-8.5.4.tar.gz 
mv apache-tomcat-8.5.4 /usr/local
cd /usr/local
ln -s apache-tomcat-8.5.4 tomcat

#edit path 
echo "JAVA_HOME=/usr/local/java
CATALINA_HOME=/usr/local/tomcat
CLASSPATH=.:""$""JAVA_HOME/lib/tools.jar:""$""CATALINA_HOME/lib-jsp-api.jar:""$""CATALINA_HOME/lib/servlet-api.jar
PATH=""$""PATH:""$""JAVA_HOME/bin:""$""CATALINA_HOME/bin
export JAVA_HOME CLASSPATH PATH CATALINA_HOME" >> /etc/profile

source /etc/profile
