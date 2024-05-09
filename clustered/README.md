
# Private cloud / On-prem Cluster Deployment

## Overview

This guide will walk you through setting up and running a ComputeAI cluster. You'll need to allocate X nodes for Jitsu Servers and one node for the Orchestrator.

**Note:** This deployment is intended exclusively for private cloud or on-premises environments and should not be used in AWS, GCP, or Azure. For clustered deployments on AWS, GCP, or Azure, please reach out to the ComputeAI team to explore suitable product options.

## Prerequisites

- Docker and Docker Compose installed on each node.
- Sufficient permissions to run Docker containers and modify environment variables.

## Setup Steps

1. **Clone or Transfer Setup Files:**

   Ensure that each node has access to the setup files (`jitsuServer`, `orchestrator`, and `.env`). The directory structure should look like this on each node:
   
   ```
   /path/to/dir
   |__ .env
   ├── config
   │   └── jitsuServerConfig.json
   ├── jitsuServer
   │   └── docker-compose.yml
   └── orchestrator
       └── docker-compose.yml
   ```

2. **Edit `.env` Configuration:**

   Customize the `.env` file to match your specific cluster requirements. Some important parameters include:
   - `STATIC_IP_LIST`: A comma-separated list of IP addresses of the Jitsu Server nodes.
   - `JEC_CLUSTER_NAME`: The cluster name.
   - `JEC_WAREHOUSE_LOCATION` and `JEC_METASTORE_LOCATION`: Paths where warehouse and metastore data will be stored.

3. **Launch Jitsu Server Nodes:**

   On each Jitsu Server node, perform the following steps:
   - Navigate to the `jitsuServer` directory.
   - Start the Jitsu Server using Docker Compose with the `.env` file:
     ```bash
     cd /path/to/cluster/jitsuServer
     docker-compose --env-file ../.env up -d
     ```
   - Confirm that the Jitsu Server is up and running on each node.

4. **Configure `STATIC_IP_LIST`:**

   After all Jitsu Server nodes are up, obtain the IP addresses of the nodes and update the `STATIC_IP_LIST` variable in the `.env` file on the Orchestrator node. This will ensure that the Orchestrator knows which nodes to connect to.

   Example:
   ```env
   STATIC_IP_LIST=192.168.1.101,192.168.1.102,192.168.1.103
   ```

5. **Start the Orchestrator:**

   Once the `STATIC_IP_LIST` is updated, start the Orchestrator node:
   - Navigate to the `orchestrator` directory.
   - Start the Orchestrator service using Docker Compose with the `.env` file:
     ```bash
     cd /path/to/cluster/orchestrator
     docker-compose --env-file ../.env up -d
     ```
   - Verify that the Orchestrator service is up and managing the Jitsu Server nodes.

## Final Considerations

- **Logs and Monitoring:** Monitor the logs of each service by accessing the `logs` directory, or by viewing container logs via Docker.
- **Security:** Ensure appropriate security measures are in place, especially for sensitive environment variables and network communications.
- **Scaling:** Adjust the number of Jitsu Server nodes and resource allocation to match the expected workload.

