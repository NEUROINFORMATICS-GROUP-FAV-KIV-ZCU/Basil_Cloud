
#!/bin/bash  
if [[ $# -eq 3 ]] ; then
    path=$1
    url=$2
    operation=$3
    curl -i --negotiate -u : "http://${url}:50070/webhdfs/v1/user/digitalAssistanceSystem/${path}?op=${operation}"
    exit 0
else
 echo "Usage: file-oparation.sh path url operation"
 echo "path -- path to an affected file"
 echo "oparation -- either GETFILESTATUS, LISTSTATUS, GETCONTENTSUMMARY can be used"
fi



