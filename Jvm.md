配置远程debug
```properties
JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=18082,server=y,suspend=n"
```
dididu-order-system[利用Sping profile分环境配置]
> eclipse 中启动tomcat。项目右键 run as –> run configuration–>Arguments–> VM arguments中添加
-Dspring.profiles.active="dev"

dump线程信息
```shell script
jstack 进程pid > /Users/icourt/Desktop/dump
```

查看java进程信息
```shell script
jps -l
```
[设置多个JDK环境变量](https://www.cnblogs.com/lukefan/archive/2019/02/19/10400427.html)

解压dididu war包
```shell script
jar -xvf dididu.war
```