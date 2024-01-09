# DBT integration

This integrates ComputeAI with DBT

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

## Running DBT jobs

- To run DBT jobs, connect to Jupyter notebook,

```{bash}
Jupyter Notebook URL: <Host URL>:8888
password: infinite-scale
```

- Open a Terminal in Jupyter and run below commands to test connection to ComputeAI orchestrator.

```{bash}
(base) jovyan@f7b2ea601341:~$ cd /usr/app/computeai/
(base) jovyan@f7b2ea601341:/usr/app/computeai$ pwd
/usr/app/computeai

(base) jovyan@f7b2ea601341:/usr/app/computeai$ dbt debug
19:46:56  Running with dbt=1.7.4
19:46:56  dbt version: 1.7.4
19:46:56  python version: 3.11.6
19:46:56  python path: /opt/conda/bin/python3.11
19:46:56  os info: Linux-5.10.177-158.645.amzn2.x86_64-x86_64-with-glibc2.35
19:46:56  Using profiles dir at /usr/app/.dbt/
19:46:56  Using profiles.yml file at /usr/app/.dbt/profiles.yml
19:46:56  Using dbt_project.yml file at /usr/app/computeai/dbt_project.yml
19:46:56  adapter type: spark
19:46:56  adapter version: 1.7.1
19:46:56  Configuration:
19:46:56    profiles.yml file [OK found and valid]
19:46:56    dbt_project.yml file [OK found and valid]
19:46:56  Required dependencies:
19:46:56   - git [OK found]

19:46:56  Connection:
19:46:56    host: jitsuOrchestrator
19:46:56    port: 10000
19:46:56    cluster: None
19:46:56    endpoint: None
19:46:56    schema: default
19:46:56    organization: 0
19:46:56  Registered adapter: spark=1.7.1
19:46:56    Connection test: [OK connection ok]

19:46:56  All checks passed!
```

- Run below comands to run TPCH queries.

```{bash}
(base) jovyan@574b0dc5063d:/usr/app/computeai$ dbt run -s tpch
19:54:54  Running with dbt=1.7.4
19:54:54  Registered adapter: spark=1.7.1
19:54:54  Found 25 models, 4 tests, 0 sources, 0 exposures, 0 metrics, 439 macros, 0 groups, 0 semantic models
19:54:54  
19:54:55  Concurrency: 4 threads (target='dev')
19:54:55  
19:54:55  1 of 23 START sql view model default.q1 ........................................ [RUN]
19:54:55  2 of 23 START sql view model default.q10 ....................................... [RUN]
19:54:55  3 of 23 START sql view model default.q11 ....................................... [RUN]
19:54:55  4 of 23 START sql view model default.q12 ....................................... [RUN]
19:54:58  1 of 23 OK created sql view model default.q1 ................................... [OK in 2.73s]
19:54:58  5 of 23 START sql view model default.q13 ....................................... [RUN]
19:54:58  4 of 23 OK created sql view model default.q12 .................................. [OK in 3.18s]
19:54:58  6 of 23 START sql view model default.q14 ....................................... [RUN]
19:54:59  5 of 23 OK created sql view model default.q13 .................................. [OK in 1.43s]
19:54:59  7 of 23 START sql view model default.q15 ....................................... [RUN]
19:54:59  3 of 23 OK created sql view model default.q11 .................................. [OK in 4.28s]
19:54:59  8 of 23 START sql view model default.q16 ....................................... [RUN]
19:55:00  2 of 23 OK created sql view model default.q10 .................................. [OK in 4.38s]
19:55:00  9 of 23 START sql view model default.q17 ....................................... [RUN]
19:55:00  6 of 23 OK created sql view model default.q14 .................................. [OK in 1.54s]
19:55:00  10 of 23 START sql view model default.q18 ...................................... [RUN]
19:55:01  7 of 23 OK created sql view model default.q15 .................................. [OK in 1.37s]
19:55:01  11 of 23 START sql view model default.q19 ...................................... [RUN]
19:55:01  10 of 23 OK created sql view model default.q18 ................................. [OK in 0.85s]
19:55:01  12 of 23 START sql view model default.q2 ....................................... [RUN]
19:55:01  9 of 23 OK created sql view model default.q17 .................................. [OK in 1.80s]
19:55:01  13 of 23 START sql view model default.q20 ...................................... [RUN]
19:55:02  8 of 23 OK created sql view model default.q16 .................................. [OK in 2.12s]
19:55:02  14 of 23 START sql view model default.q21 ...................................... [RUN]
19:55:02  11 of 23 OK created sql view model default.q19 ................................. [OK in 1.38s]
19:55:02  15 of 23 START sql view model default.q22 ...................................... [RUN]
19:55:03  13 of 23 OK created sql view model default.q20 ................................. [OK in 1.79s]
19:55:03  16 of 23 START sql view model default.q3 ....................................... [RUN]
19:55:03  12 of 23 OK created sql view model default.q2 .................................. [OK in 2.69s]
19:55:03  17 of 23 START sql view model default.q4 ....................................... [RUN]
19:55:04  15 of 23 OK created sql view model default.q22 ................................. [OK in 1.43s]
19:55:04  18 of 23 START sql view model default.q5 ....................................... [RUN]
19:55:04  14 of 23 OK created sql view model default.q21 ................................. [OK in 2.55s]
19:55:04  19 of 23 START sql view model default.q6 ....................................... [RUN]
19:55:05  17 of 23 OK created sql view model default.q4 .................................. [OK in 1.06s]
19:55:05  20 of 23 START sql view model default.q7 ....................................... [RUN]
19:55:05  19 of 23 OK created sql view model default.q6 .................................. [OK in 0.81s]
19:55:05  21 of 23 START sql view model default.q8 ....................................... [RUN]
19:55:05  16 of 23 OK created sql view model default.q3 .................................. [OK in 1.85s]
19:55:05  22 of 23 START sql view model default.q9 ....................................... [RUN]
19:55:06  20 of 23 OK created sql view model default.q7 .................................. [OK in 1.99s]
19:55:06  23 of 23 START sql view model default.queries .................................. [RUN]
19:55:07  18 of 23 OK created sql view model default.q5 .................................. [OK in 3.04s]
19:55:07  22 of 23 OK created sql view model default.q9 .................................. [OK in 1.78s]
19:55:07  21 of 23 OK created sql view model default.q8 .................................. [OK in 1.91s]
19:55:07  23 of 23 OK created sql view model default.queries ............................. [OK in 0.41s]
19:55:07  
19:55:07  Finished running 23 view models in 0 hours 0 minutes and 12.96 seconds (12.96s).
19:55:07  
19:55:07  Completed successfully
19:55:07  
19:55:07  Done. PASS=23 WARN=0 ERROR=0 SKIP=0 TOTAL=23
(base) jovyan@574b0dc5063d:/usr/app/computeai$
```
