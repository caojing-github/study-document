kafka可视化管理工具
[安装包](https://github.com/yahoo/kafka-manager/releases) 
[安装教程](https://www.cnblogs.com/frankdeng/p/9584870.html)  
* mac安装sbt(因为kafka-manager需要sbt编译) 
```shell script
brew install sbt
```
####注意
>sbt安装比较慢可以[官网下载sbt安装包](https://www.scala-sbt.org/download.html)  
>执行brew --cache获取brew缓存路径，将下载的文件放入缓存目录
>重新执行安装命令，brew会发现缓存中有了文件，就不去下载了  

kafka服务必需要开启JMX，否则在下一步启动kafka-manager时会出现：
java.lang.IllegalArgumentException: requirement failed: No jmx port but jmx polling enabled!
启动kafka服务时指定JMX_PORT值:
```shell script
JMX_PORT=9999 bin/kafka-server-start.sh -daemon config/server.properties
```

