后台启动,先切换到kafka目录  
```shell script
kafka-server-start.sh -daemon config/server.properties
```

（不推荐）前台启动,先切换到kafka目录  
```shell script
bin/kafka-server-start.sh config/server.properties
```
 
停止服务  
```shell script
bin/kafka-server-stop.sh
```

创建主题
>创建一个分区数为4，副本因子为3的主题topic-demo 
 >* --zookeeper指定连接的zookeeper服务地址  
 >* --topic指定了所要创建的主题的名称  
 >* --replication-factor 指定了副本因子
 >* --partitions 指定了分区个数
 >* --create 创建主题的动作指令 
> 
>方式一： 
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --create --topic topic-demo --replication-factor 4 --partitions 2
``` 
>方式二： 
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --create --topic topic-demo --replica-assignment 2:0,0:1,1:2,2:1
 ``` 
>分区与分区之间用逗号","隔开，分区内多个副本用冒号":"隔开  
>注意：同一个分区内的副本不能有重复  

展示主题的更多具体信息
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --describe --topic topic-demo
```
订阅主题  
* bootstrap-server 连接的kafka集群地址  
```shell script
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic-demo
```
发送消息，回车后键入要发送的消息，订阅主题的终端便可收到消息  
* broker-list 连接的kafka集群地址 
```shell script
kafka-console-producer.sh --broker-list localhost:9092 --topic topic-demo
```

Kafka maven依赖
```xml
<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-clients</artifactId>
    <version>2.0.0</version>
</dependency>
```
Protostuff maven依赖（类似于Json的通用序列化工具） 
```xml
<dependency>
    <groupId>io.protostuff</groupId>
    <artifactId>protostuff-core</artifactId>
    <version>1.5.4</version>
</dependency>
```
```xml
<dependency>
    <groupId>io.protostuff</groupId>
    <artifactId>protostuff-runtime</artifactId>
    <version>1.5.4</version>
</dependency>
```

连接zookeeper  
```shell script
zkCli.sh -server localhost:2181/kafka
```
查看主题的分区副本分配方案，topic-demo是主题名称   
```shell script
get /brokers/topics/topic-demo
````

使用 TopicCommand 需要添加如下依赖  
```xml
<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka_2.11</artifactId>
    <version>2.0.0</version>
</dependency>
```
 