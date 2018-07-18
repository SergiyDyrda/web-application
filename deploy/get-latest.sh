#!/usr/bin/env bash
# Artifactory location
server=http://192.168.10.10:8081/artifactory
user=admin
password=zxcv1234
repo=snapshot

# Maven artifact location
name=artifact
artifact=com/company/${name}
path=${server}/${repo}/${artifact}
version=`curl -s ${path}/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
build=`curl -s ${path}/${version}/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/"`
jar=${name}-${build}.jar
url=${path}/${version}/${jar}

# Download
echo ${url}
wget -q -N ${url}