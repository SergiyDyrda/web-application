#!/bin/bash
# Artifactory location
server=$SERVER_URL
repo=libs-release-local

# Maven artifact location
name=demo
artifact=com/example/${name}
path=${server}/${repo}/${artifact}
version=`curl -s ${path}/maven-metadata.xml | grep '<latest>' | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
jar=${name}-${version}.jar
url=${path}/${version}/${jar}


ansible-playbook -i deploy/hosts deploy/ansible.yml --extra-vars "artifact_url=$url artifact_name=$name artifact_version=$version"

