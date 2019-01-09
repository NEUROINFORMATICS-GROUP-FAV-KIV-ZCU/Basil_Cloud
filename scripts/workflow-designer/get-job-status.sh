#!/bin/bash  
if [[ $# -eq 2 ]] ; then
    jobId=$1
    host=$2
    curl -X GET  http://"$host":8680/api/workflow/jobs/"$jobId"
    exit 0
else
 echo "Usage: get-job-status.sh jobId host"
 echo "jobId -- Id of a job which status is required"
echo "host -- host ip or domain name of the server operating the workflow designer server"
fi

