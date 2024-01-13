#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

echo "remove lost+found from $namedir"
rm -r $namedir/lost+found

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME
fi

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode &

# Wait until Cluster is ready
sleepDuration=5
timeout=600
elapsedTime=0

while let "elapsedTime < timeout"; do
    echo "Sleeping for $sleepDuration seconds..."
    sleep $sleepDuration
    (( elapsedTime += sleepDuration ))
    hdfs dfsadmin -report  # Wait for HDFS to be ready
    # Check the exit status of the command
    if [[ $? -eq 0 ]]; then
        break
    fi
done

echo "Copy down TPCH and TPCDS datasets to HDFS..."
hdfs dfs -copyFromLocal /dataset /

tail -f /dev/null  # Wait indefinitely
