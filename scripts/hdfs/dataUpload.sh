#!/bin/bash  
if [[ $# -eq 2 ]] ; then
 dir=$1
 host=$2
 find $dir -type f -name '*.*' -print0 | while IFS= read -r -d '' file; do
  onlyFile=""
 if [[ -d $dir ]]; then
  onlyFile=${file#"$dir"}
 else 
   onlyFile=$(basename $dir)
 fi
 LOCATION=$(curl -i --negotiate -u : -X PUT "http://${host}:50070/webhdfs/v1/user/digitalAssistanceSystem/${onlyFile}?op=CREATE&overwrite=true" | perl -n -e '/^Location: (.*)$/ && print "$1\n"')
 URL=${LOCATION%$'\r'}
 curl -i --negotiate -u : -X PUT -T ${file} "${URL}"
 done
 exit 0
else
 echo "Usage: dataUpload.sh dir/file host"
 echo "dir/file -- a path to a directory or a file for upload"
 echo "host -- host ip or domain name of the server operating Hadoop"
fi


