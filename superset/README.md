# Superset integration

This integrates ComputeAI with Superset

<div align="left">
      <a href="https://www.youtube.com/watch?v=6XZMiQaHa24">
         <img src="https://img.youtube.com/vi/6XZMiQaHa24/0.jpg" style="width:50%;">
      </a>
</div>

## Install Docker on your machine

https://docs.docker.com/engine/install/

## Start the containers

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
