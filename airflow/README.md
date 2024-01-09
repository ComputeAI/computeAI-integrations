# Airflow integration

This integrates ComputeAI with Airflow

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

## Connect to Airflow

- Airflow credentials

```{bash}
Airflow URL: http://<Host URL>:8088
Login: computeai
Password: infinite-scale
```

- To schedule Airflow jobs, switch to DAGs tab and turn on dbt_dag.
