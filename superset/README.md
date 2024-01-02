# Superset integration

This integrates ComputeAI with Superset

## Install Docker on your machine

https://docs.docker.com/engine/install/

## Start the containers

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

## Connect to Superset

```
Superset URL: http://<Host URL>:8088
Login: computeai
Password: infinite-scale
```

## To add ComputeAI database connection

Here pick Apache Spark SQL for "SUPPORTED DATABASES" and hit "connect". Refer to https://superset.apache.org/docs/databases/spark-sql for documentation.

Under BASIC tab,

```
SQLALCHEMY URI: hive://computeai:infinite-scale@<Host URL>:10000/default
```

Under ADVANCED tab -> "Security" -> "SECURE EXTRA", add below json string,
```
{
    "connect_args": {"auth": "LDAP"}
}
```
