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

# Define variables with consistent naming
sleep_duration=60
timeout=600
elapsed_time=0

while (( elapsed_time < timeout )); do
  echo "Sleeping for $sleep_duration seconds..."
  sleep $sleep_duration

  # Change directory within the loop to ensure correct context
  cd /usr/app/computeai

  # Execute dbt debug command
  dbt debug

  # Check exit status and break loop if successful
  if [[ $? -eq 0 ]]; then
    break
  fi

  # Increment elapsed time using concise syntax
  (( elapsed_time += sleep_duration ))
done

tail -f /dev/null  # Wait indefinitely
