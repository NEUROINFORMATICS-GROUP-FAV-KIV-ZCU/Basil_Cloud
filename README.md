# Overview
This repository contains all needed documentation and scripts for the Cloud Infrastructure for the Basil project.

It is alo a sign post to all the project inmplemented in the complete cloud infrastructure.

There are actually two groups of projects in the cloud infrastructure:

## Hadoop and Spark

Hadoop and spark are group of projecst serving as a place where all experimental data are supposed to be stored and processed.

1. [Client GUI](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_ClientGUI) which is a portable Desktop Java application allowing the user to browse/manage the data on remote Hadoop Distributed File System as well as to run methods implemented in Data Analysis Package.

2. [Data Analysis Package](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_DataAnalysisPackage)  which is a Java application made using Apache Spark, Apache Hadoop and Deep Learning for Java (dl4j) frameworks whose purpose input sources, data processing, feature extraction and classification methods. The community is welcome to extend this library.

3. [Remote Server](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_RemoteServer) is a Spring Boot server and the main communication point for the Client GUI with the Data Analysis Package on the Hadoop server. It provides a REST API for managing requests such as job submittals, fetching the results of a job, listing of trained classifiers and etc. Codes are available: 

## Workflow Designer

Workflow Designer is a group of projects containing a comfortable graphical tool for creating machine learning worfklows, a framework for creating a workflow blocks from any piece of java code and a library of examples and basic blocks.

1. [Workflow Designer](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/workflow_designer) is an annotational tool allowing by annotating a custom java code build workflow blocks that can be easily connected to a complete workfow and executed

2. [workflow Designer Server](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/workflow_designer_server)
is a graphical user interface for creating and executing workflows from building blocks implemented in the workflow designer

3. [Worfklow Designer Samples](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/workflow_designer_samples)
Is a library with basic building worflow blocks. The community is welcome to extend this library.

# Online tools

A demo tools of the [Hadoop infrastructure](http://147.228.63.46:8888) and the [Worflow Designer](http://147.228.63.46:8680) are available. The user can manage data either via the web interface (Hue) or via the Client GUI after cloning and building the repository above. The client GUI enables user to run available methods implemented in the Data Analysis Package.

# REST-API
Because we suppose these cloud solutions to be accessible from micro devices (e. g. Raspberry PI) both tools can be also controlle from 3rd party tools by a REST API.

The directory scripts contains some examples on how to use the REST API. All the scripts print the help of usage once called without parameters.

## Apache Hadoop
There is an existing REST API [Webhdfs](https://hadoop.apache.org/docs/r1.0.4/webhdfs.html) for accessing HDFS. There are prepared scripts in scripts/hdfs directory configured for the online tools described above. They do not provide complete functionality provided by Webhdfs but provide helping hand for working with hdfs. They can be easily modified for other purposes.

## Workflow Designer
The user can comfortably design a workflow by the worfklow designer online tool described above. Such a workflow can be exported in JSON format and reused later. This JSON is then used as a parametr of the run-job.sh script in the scripts/workflow-designer directory. The script prints a job id that can be used once asked for a job status by calling the script get-job-status.sh in the same directory.

# Script usage examples

The scripts for the workflow designer anf for Hadoop called from scripts/workflow-designer folder and scripts/hdfs, respectively.


```
./run-job.sh ../../test-data/sum.json jezekp@kiv.zcu.cz <token> 147.228.63.46 
```
returns a jobId
```
./get-job-status.sh <id returned by previous script> 147.228.63.46
  ```
  returns a json containing:
  ```json
  {
    ...
     "output": {
      "type": "STRING",
      "value": "30"
     },

    ...
    "status": "COMPLETED"
  }
```
Following scripts suppose the user is already authenticated by Kerberos (kinit has been used already)

```
./dataUpload.sh ../../test-data/test-file.txt 147.228.63.46
```
Uploads a test data file to hdfs

```
./get-content.sh test-file.txt 147.228.63.46
```
Allows getting the file and see its content. Hello World! in this case


```
./file-oparation.sh test-file.txt 147.228.63.46 GETFILESTATUS

```
Shows JSON describing the file:
  ```json
{
    "FileStatus": {
        "accessTime": 1547109036066,
        "blockSize": 134217728,
        "childrenNum": 0,
        "fileId": 101788,
        "group": "digitalAssistanceSystem",
        "length": 13,
        "modificationTime": 1547109036265,
        "owner": "hdfs",
        "pathSuffix": "",
        "permission": "755",
        "replication": 1,
        "storagePolicy": 0,
        "type": "FILE"
    }
}

```



# Possible Issues

## Workflow designer says Unauthorized 

There must be created a user account in the workfow designer. The REST API is authorized not via the password byt via the authenticating token generated for each user and sent on request.

## Solution

### Register in the workflow designer server
* Go to the link above. 
* Register and check your email for temporal password. 
* Change the password after first login
* Ask for the token


## HDFS says  401 Authentication required 

Hadoop is secured by Kerberos. A kerberos client must be installed and configured. A testing credentials are provided on request.

## Solution
### Configure Kerberos
add following code to /etc/krb5.konf
```
[libdefaults]
default_realm = CLOUDERA
dns_lookup_kdc = false
dns_lookup_realm = false
ticket_lifetime = 8640000
renew_lifetime = 8640000
forwardable = true
default_tgs_enctypes = rc4-hmac
default_tkt_enctypes = rc4-hmac
permitted_enctypes = rc4-hmac
udp_preference_limit = 1
kdc_timeout = 3000
[realms]
CLOUDERA = {
kdc = quickstart.cloudera
admin_server = quickstart.cloudera
}
```
add 
```
147.228.63.46   quickstart.cloudera
```
to /etc/hosts

Install krb5-client by
```
apt-get install krb5-user 
```
Then type
```
kinit <user-name>
```

then type the password once prompted.



## curl is not recognized as an internal or external command 

curl is used by scripts. It must be installed

## Solution

### install curl 

```
apt install curl
```
