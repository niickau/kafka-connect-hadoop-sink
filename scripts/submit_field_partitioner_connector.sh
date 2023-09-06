#!/usr/bin/env bash

curl -i -X PUT -H "Content-Type:application/json" \
  http://localhost:8083/connectors/hdfs_sink_field_partitioner/config \
  -d '{
    "name": "hdfs-sink-field-partitioner",
    "config": {
        "connector.class"                      : "io.confluent.connect.hdfs3.Hdfs3SinkConnector",
        "confluent.topic.bootstrap.servers"    : "localhost:9092",
        "topics"                               : "test.test",
        "format.class"                         : "io.confluent.connect.hdfs3.parquet.ParquetFormat",
        "store.url"                            : "hdfs://namenode_hostname:9000",
        "topics.dir"                           : "/raw_storage/kafka_connect/topics",
        "logs.dir"                             : "/logs/kafka_connect",
        "hadoop.conf.dir"                      : "/etc/hadoop/",
        "tasks.max"                            : "1",
        "flush.size"                           : "100000",
        "partitioner.class"                    : "io.confluent.connect.storage.partitioner.FieldPartitioner",
        "value.converter"                      : "io.confluent.connect.avro.AvroConverter",
        "value.converter.schema.registry.url"  : "http://localhost:8081",
        "partition.field.name"                 : "date_str"
  }
}'