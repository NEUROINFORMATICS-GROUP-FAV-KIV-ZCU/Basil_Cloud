# Overview
This repository contains all needed documentation and scripts for the Cloud Infrastructure for the Basil project.

It is alo a sign post to all the project inmplemented in the complete cloud infrastructure.

There are actually two groups of projects in the cloud infrastructure

## Hadoop and Spark

1. [Client GUI](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_ClientGUI) which is a portable Desktop Java application allowing the user to browse/manage the data on remote Hadoop Distributed File System as well as to run methods implemented in Data Analysis Package.

2. [Data Analysis Package](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_DataAnalysisPackage)  which is a Java application made using Apache Spark, Apache Hadoop and Deep Learning for Java (dl4j) frameworks whose purpose input sources, data processing, feature extraction and classification methods. 

3. [Remote Server](https://github.com/NEUROINFORMATICS-GROUP-FAV-KIV-ZCU/EEG_RemoteServer) is a Spring Boot server and the main communication point for the Client GUI with the Data Analysis Package on the Hadoop server. It provides a REST API for managing requests such as job submittals, fetching the results of a job, listing of trained classifiers and etc. Codes are available: 

## Workflow Designer

# Online tools

# REST-API

