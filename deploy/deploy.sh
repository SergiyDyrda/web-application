#!/bin/bash

# Artifactory location
#server=http://192.168.10.10:8081/artifactory
server=$SERVER_URL
repo=libs-release-local

# Maven artifact location
name=demo
artifact=com/example/${name}
path=${server}/${repo}/${artifact}
version=`curl -s ${path}/maven-metadata.xml | grep '<latest>' | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
jar=${name}-${version}.jar
url=${path}/${version}/${jar}

export ARTIFACT_URL="${url}"
echo "Artifact url - ${ARTIFACT_URL}"

export ARTIFACT_JAR="${jar}"
echo "Artifact jar - ${ARTIFACT_JAR}"

export ARTIFACT_VERSION="${version}"
echo "Artifact version - ${ARTIFACT_VERSION}"

ansible-playbook -i deploy/hosts deploy/ansible.yml --extra-vars "artifact_url=$url artifact_name=$name artifact_version=$version"

