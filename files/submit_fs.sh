#!/bin/bash
source "../.env"

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "local-file-source",
  "config": {
    "connector.class": "FileStreamSource",
    "topic":"${FS_TOPIC_NAME}",
    "file":"${FS_FILE}",
    "confluent.topic.replication.factor": 3,
    "confluent.topic.bootstrap.servers" : "${CLOUD_URL}",
    "confluent.topic.security.protocol" : "SASL_SSL",
    "confluent.topic.sasl.jaas.config"  : "org.apache.kafka.common.security.plain.PlainLoginModule required username='${CLOUD_TOKEN}' password='${CLOUD_SECRET}';",
    "confluent.topic.sasl.mechanism"    : "PLAIN",
    "tasks.max": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors