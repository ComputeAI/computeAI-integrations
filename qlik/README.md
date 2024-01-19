# Qlik integration

This integrates ComputeAI with Qlik

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

- To connect to ComputeAI Orchestrator JDBC endpoint,

```{bash}
JDBC URL: jdbc:hive2://<Host URL>:10000/default
username: computeai
password: infinite-scale
```

- To connect to ComputeAI Orchestrator dashboard,

```{bash}
ComputeAI Orchestrator dashboard URI: http://<Host URL>:8080
```

## Connect to Qlik

- Use "Data connection" to discover "Apache Spark" in "Data sources".
- Fill in the following fields.

```{bash}
Host name: <Host URL>
Port: 10000
Database: default
Username: computeai
Password: infinite-scale
```

## Connect to Jupyter notebook

To connect to Juputer notebook, 

```{bash}
Jupyter Notebook URL: <Host URL>:8888
password: infinite-scale
```

## Demo notebooks

- tpchDemo

Has all 22 TPCH queries for SF1 dataset in a public S3 bucket.

- tpchFileDatasetDemo

Has all 22 TPCH queries for SF1 dataset in a filesystem.

- tpcdsDemo

Has all 99 TPCDS queries for SF1 dataset in a public S3 bucket. 

- tpcdsFileDatasetDemo

Has all 99 TPCDS queries for SF1 dataset in a filesystem.
