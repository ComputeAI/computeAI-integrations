#!/bin/bash

set +ex
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfsadmin -safemode leave
