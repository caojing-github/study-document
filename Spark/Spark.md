启动 Spark `/Users/icourt/Downloads/spark-2.4.4-bin-hadoop2.7/sbin/start-all.sh`

Mac启动会报`localhost: ssh: connect to host localhost port 22: Connection refused` 这个错误，  
[解决方法：打开 SSH](https://blog.csdn.net/yamaxifeng_132/article/details/54932873)

[查看Master运行情况](http://localhost:8080/)
 
连接集群（具体以[查看Master运行情况](http://localhost:8080/)中连接为准）  
`bin/spark-shell --master spark://bogon:7077` 
>注：`bin/spark-shell --master spark://localhost:7077` Spark最新版本会报错  
>`Caused by: java.io.IOException: Failed to connect to localhost/127.0.0.1:7077` 

退出Spark终端
`:quit` 

>java.lang.IllegalArgumentException: Unsupported class file major version 56
>[JDK原因，version 56表示JDK12](https://blog.csdn.net/sinat_26811377/article/details/99716838)

Spark对应的依赖
```
<dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-core_2.11</artifactId>
    <version>2.3.1</version>
</dependency>
```
Spark Streaming 对应的依赖 
```
<dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-streaming_2.11</artifactId>
    <version>2.3.1</version>
</dependency>
```

演示Spark自带的程序  
`bin/run-example streaming.NetworkWordCount localhost 9999`  
另一个Shell中输入  
`nc -lk 9999`  

```
<dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-streaming-kafka-0-10_2.11</artifactId>
    <version>2.11</version>
</dependency>

<dependency>
    <groupId>org.apache.kafka</groupId>
    <artifactId>kafka-clients</artifactId>
    <version>2.0.0</version>
</dependency>
```
