#!/bin/bash

# Exit on errors
set -e

# Init DBT repo and try to test connection to Orcestrator JDBC server
cd /usr/app \
    && echo "computeai" | dbt init \
    && chmod 777 -R computeai \
    && cp -r /usr/app/tpch /usr/app/computeai/models

# Undo exit on errors
set +e

# Wait until Orchestrator is up
sleepDuration = 30
timeout = 300
elapsedTime = 0

while [ $elapsedTime -lt $timeout ]; do
    echo "Sleeping for $sleep_duration seconds..."
    sleep $sleepDuration
    cd /usr/app/computeai
    dbt debug

    # Check the exit status of the command
    if [ $? -eq 0 ]; then
        break
    fi
done

tail -f /dev/null  # Wait indefinitely
