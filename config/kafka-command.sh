# 查看 topic 分区信息
../bin/kafka-topics.sh --describe --topic cdnlogs --zookeeper 10.214.162.73:2181,10.214.162.74:2181,10.214.162.75:2181

Topic:cdnlogs   PartitionCount:24       ReplicationFactor:2     Configs:
        Topic: cdnlogs  Partition: 0    Leader: 2       Replicas: 2,1   Isr: 1,2
        Topic: cdnlogs  Partition: 1    Leader: 0       Replicas: 0,2   Isr: 0,2
		... ...
		
		
# 查看 队列消费情况
bin/kafka-consumer-groups.sh  --bootstrap-server 10.214.162.73:9092,10.214.162.74:9092,10.214.162.75:9092 --group cdnlogs --describe

TOPIC                          PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG        CONSUMER-ID                                       HOST                           CLIENT-ID
cdnlogs                        0          13008567        13008567        0          logstash-0-8d542064-875f-400b-9a62-5ccd1a6d754c   /10.214.162.78                 logstash-0
cdnlogs                        1          13010892        13010892        0          logstash-0-8d542064-875f-400b-9a62-5ccd1a6d754c   /10.214.162.78                 logstash-0
... ...

# 创建新 topic
bin/kafka-create-topic.sh --zookeeper 10.214.162.73:2181,10.214.162.74:2181,10.214.162.75:2181 --replica 2 --partition 12 --topic cgtopic

