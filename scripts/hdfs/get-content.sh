#!/bin/bash  
if [[ $# -eq 2 ]] ; then
 path=$1
 host=$2

 LOCATION=$(curl -i --negotiate -u : -X GET "http://${host}:50070/webhdfs/v1/user/digitalAssistanceSystem/${path}?op=OPEN" | perl -n -e '/^Location: (.*)$/ && print "$1\n"')
 URL=${LOCATION%$'\r'}
 echo $URL
 curl -i --negotiate -u : -X GET "${URL}"
 exit 0
else
 echo "Usage: get-content.sh dir/file host"
 echo "dir/file -- a path to a directory or a file to be downloaded"
 echo "host -- host ip or domain name of the server operating the workflow designer server"
fi


