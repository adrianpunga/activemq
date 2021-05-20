#!/bin/bash
export PATH="/usr/lib/jvm/jre-14-openjdk/lib:$PATH"
cd /tmp
unzip ActiveMQ.zip
cd ActiveMQ
sudo wget https://repo1.maven.org/maven2/org/apache/activemq/activemq-all/5.16.1/activemq-all-5.16.1.jar
sudo chmod 777 -R /tmp/ActiveMQ
jar cvfm ~/ActiveMQ.jar META-INF/MANIFEST.MF ./*
cd ~
sudo chmod 777 ActiveMQ.jar