#!/bin/bash  
if [[ $# -eq 2 ]] ; then
    jobId=$1
    url=$2
    curl -X GET  http://"$url":8680/api/workflow/jobs/"$jobId"
    exit 0
else
 echo "Usage: get-job-status.sh jobId url"
 echo "jobId -- Id of a job which status is required"
 echo "url -- url of the server operating the workflow designer server"
fi

