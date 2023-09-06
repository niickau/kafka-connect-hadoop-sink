#!/usr/bin/env bash

curl -i -X PUT -H "Content-Type:application/json" \
  http://localhost:8083/connectors/hdfs_sink_ts_partitioner/config \
  -d '{
    "name": "hdfs-sink-ts-partitioner",
    "config": {
        "connector.class"                    : "io.confluent.connect.hdfs3.Hdfs3SinkConnector",
        "confluent.topic.bootstrap.servers"  : "localhost:9092",
        "topics"                             : "test.test",
        "format.class"                       : "io.confluent.connect.hdfs3.parquet.ParquetFormat",
        "store.url"                          : "hdfs://namenode_hostname:9000",
        "topics.dir"                         : "/raw_storage/kafka_connect/topics",
        "logs.dir"                           : "/logs/kafka_connect",
        "hadoop.conf.dir"                    : "/etc/hadoop/",
        "tasks.max"                          : "1",
        "flush.size"                         : "100000",
        "partitioner.class"                  : "io.confluent.connect.storage.partitioner.TimeBasedPartitioner",
        "locale"                             : "en-US",
        "timezone"                           : "UTC-4",
        "path.format"                        : "'\'op_year\''=YYYY/'\'op_month\''=MM/'\'op_day\''=dd/",
        "partition.duration.ms"              : "600000" 
  }
}'