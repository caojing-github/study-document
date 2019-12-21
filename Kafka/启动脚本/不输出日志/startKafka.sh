#!/bin/bash
# start zookeeper and kafka service
echo "========== Zookeeper Starting  ========="
    #cd /opt/ops/zookeeper/zookeeper-3.4.12/bin
    nohup /Users/icourt/Downloads/zookeeper-3.4.6/bin/zkServer.sh start >/dev/null 2>&1 &
sleep 3
echo "========== Kafka Starting  ============="
    #cd /opt/ops/kafka/kafka_2.12-2.0.0/bin
    nohup /Users/icourt/Downloads/kafka_2.11-2.0.0/bin/kafka-server-start.sh /Users/icourt/Downloads/kafka_2.11-2.0.0/config/server.properties >/dev/null 2>&1 &
sleep 5
echo "========== start success  ====="