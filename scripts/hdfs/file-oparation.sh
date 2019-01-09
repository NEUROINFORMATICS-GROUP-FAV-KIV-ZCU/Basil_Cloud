
#!/bin/bash  
if [[ $# -eq 3 ]] ; then
    path=$1
    host=$2
    operation=$3
    curl -i --negotiate -u : "http://${host}:50070/webhdfs/v1/user/digitalAssistanceSystem/${path}?op=${operation}"
    exit 0
else
 echo "Usage: file-oparation.sh path host operation"
 echo "path -- path to an affected file"
 echo "host -- host ip or domain name of the server operating the workflow designer server"
 echo "oparation -- either GETFILESTATUS, LISTSTATUS, GETCONTENTSUMMARY can be used"
fi



