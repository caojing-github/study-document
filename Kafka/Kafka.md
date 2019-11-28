后台启动,先切换到kafka目录  
```shell script
bin/kafka-server-start.sh -daemon config/server.properties
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

删除主题
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --delete --topic topic-demo
```
>可以通过`if-exists`参数来忽略异常


增加主题分区数
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --alter --topic topic-demo --partitions 3
``` 
>如果所要修改的主题不存在，可以通过`--if-exists`参数来忽略异常

使用`kafka-topics.sh`脚本的`--alter`指令和`--config`参数来变更主题的配置
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --alter --topic topic-demo --config max.message.bytes=20000
```
使用`kafka-topics.sh`脚本的`--alter`指令和`--delete-config`参数来删除主题的配置
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --alter --topic topic-demo --delete-config max.message.bytes=20000 --delete-config cleanup.policy
```
配置管理
`kafka-topics.sh`、`alter`、`describle`  
`kafka-topics.sh`使用entity-type参数来指定操作配置的类型，使用entity-name参数来指定操作配置的名称  
* 查看主题topic-demo的配置`kafka-topics.sh --zookeeper localhost:2181/kafka --describle --entity-type topics --entity-name topic-demo`
* 增加主题topic-demo的配置`kafka-topics.sh --zookeeper localhost:2181/kafka --alter --entity-type topics --entity-name topic-demo --add-config cleanup.policy=compact,max.message.bytes=10000`
* 删除主题topic-demo的配置`kafka-topics.sh --zookeeper localhost:2181/kafka --alter --entity-type topics --entity-name topic-demo --delete-config cleanup.policy,max.message.bytes`


展示主题的更多具体信息
* 如果不使用 --topic 指定主题，则会展示出所有主题的详细信息
* --topic还支持指定多个主题，如：--topic topic-create, topic-demo
* 使用--describe指令时还可以额外指定 
>`--topics-with-overrides`：找出所有包含覆盖配置的主题  
>`--under-replicated-partitions`：找出所有包含失效副本的分区。包含失效副本的分区可能正在进行同步操作，也可能同步发生异常，此时分区的ISR集合小于AR集合  
>`--unavailable-partitions`：可以查看主题中没有leader副本的分区，这些分区已经处于离线状态，对于外界的生产者和消费者来说处于不可用的状态
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
查看当前所有可用的主题
```shell script
kafka-topics.sh --zookeeper localhost:2181/kafka --list
``` 

对分区leader副本进行重新平衡的功能
```shell script
kafka-preferred-replica-election.sh --zookeeper localhost:2181/kafka
```
>使用`--path-to-json-file`指定json文件小批量对部分分区执行优先副本的选举操作
文件名假定为election.json，json文件格式类似如下：
```json
{
	"partitions":[
		{
			"partition":0,
			"topic":"topic-demo"
		},
		{
			"partition":1,
			"topic":"topic-demo"
		},
		{
			"partition":2,
			"topic":"topic-demo"
		}
	]
}
```
只对主题topic-demo执行优先
```shell script
kafka-preferred-replica-election.sh --zookeeper localhost:2181/kafka --path-to-json-file election.json
```

分区重分配
>第一步：创建要进行分区重分配的主题清单的 json 文件（假定文件名称为`reassign.json`）
```json
{
	"topics":[
		{
			"topic":"topic-reassign"
		}
	],
	"version":1
}
```
>第二步：根据这个json文件和指定所要分配的broker节点列表来生成一份候选的重分配方案
```shell script
kafka-reassign-partitions.sh --zookeeper localhost:2181/kafka --generate --topics-to-move-json-file reassign.json --broker-list 0,2
```
>`generate` 是 `kafka-reassign-partitions.sh` 脚本中指令类型的参数，它用来生成一个重分配的候选方案  
>`topics-to-move-json-file`用来指定分区重分配对应的主题清单文件的路径  
>该清单文件的格式可以归纳为
```json
{
	"topics":[
		{
			"topic":"foo"
		},
		{
			"topic":"foo1"
		}
	],
	"version":1
}
```
>结果中`Current partition replica assignment`所对应的json内容为当前的分区副本分配情况，在执行分区重分配的时候最好将这个内容保存起来，以备后续的回滚操作  
>结果中`Proposed partition reassignment configuration`所对应的json内容为重分配的候选方案,假定这个文件的名称为`project.json`

>第三步：执行具体的重分配动作  
```shell script
kafka-reassign-partitions.sh --zookeeper localhost:2181/kafka --execute --reassignment-json-file project.json
```
>`execute` 指定执行重分配的动作  
>`reassignment-json-file` 指定分区重分配方案的文件路径  
>
>分区重分配后可以使用`kafka-preferred-replica-election.sh` 进行一次`优先副本`的选举动作  

[17 个方面，综合对比 Kafka、RabbitMQ、RocketMQ、ActiveMQ](https://mp.weixin.qq.com/s/yLbj1sKwGv1pOxv8RtcBhw)  



