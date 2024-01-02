# Jupyter Notebook integration

This integrates ComputeAI with Jupyter Notebook

## Install Docker on your machine

https://docs.docker.com/engine/install/

## Start the containers

First build the container, adjusting python requirements as necessary

```{bash}
docker compose build
```

Then run the ComputeAI
```{bash}
docker compose up -d
```

## Connect to ComputeAI Orchestrator

To connect to ComputeAI Orchestrator JDBC endpoint,

```{bash}
JDBC URL: jdbc:hive2://<Host URL>:10000/default
username: computeai
password: infinite-scale
```

## Connect to Jupyter notebook

To connect to Juputer notebook, 

```{bash}
Jupyter Notebook URL: <Host URL>:8888
password: infinite-scale
```

## Demo notebooks
* tpchDemo

Has all 22 TPCH queries for SF1 dataset in a public S3 bucket.

* tpchFileDataset

Has all 22 TPCH queries for SF1 dataset in a filesystem.


* tpcdsDemo

Has all 99 TPCDS queries for SF1 dataset in a public S3 bucket. 
