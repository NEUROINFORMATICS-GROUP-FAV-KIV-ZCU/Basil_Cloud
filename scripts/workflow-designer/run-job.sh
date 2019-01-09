#!/bin/bash  
if [[ $# -eq 4 ]] ; then
    no_spaces=$(tr -d '\n' < $1)
    params="workflow=$no_spaces"
    email="email: $2"
    token="token: $3"
    host=$4
    curl -H "$email" -H "$token" -X POST -F "$params"  http://"$host":8680/api/workflow/schedule
    exit 0
else
 echo "Usage: run-job.sh file email token host"
 echo "file -- a path to json file with the workflow"
 echo "email -- the user who runs the job"
 echo "token -- the unique token assignet to user once registered to the workflow designer server"
 echo "host -- host ip or domain name of the server operating the workflow designer server"

fi

