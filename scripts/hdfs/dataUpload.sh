#!/bin/bash  
if [[ $# -eq 2 ]] ; then
 dir=$1
 url=$2
 find $dir -type f -name '*.*' -print0 | while IFS= read -r -d '' file; do
 onlyFile="/${dir}"
 if [[ -d $dir ]]; then
  onlyFile=${file#"$dir"}
 fi
 LOCATION=$(curl -i --negotiate -u : -X PUT "http://${url}:50070/webhdfs/v1/user/digitalAssistanceSystem${onlyFile}?op=CREATE&overwrite=true" | perl -n -e '/^Location: (.*)$/ && print "$1\n"')
 URL=${LOCATION%$'\r'}
 curl -i --negotiate -u : -X PUT -T ${file} "${URL}"
 done
 exit 0
else
 echo "Usage: dataUpload.sh dir/file url"
 echo "dir/file -- a path to a directory or a file for upload"
 echo "url -- url of the server operating the workflow designer server"
fi


