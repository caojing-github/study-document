# 配置远程debug
```properties
JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=18082,server=y,suspend=n"
```
dididu-order-system[利用Sping profile分环境配置]
> eclipse 中启动tomcat。项目右键 run as –> run configuration–>Arguments–> VM arguments中添加
-Dspring.profiles.active="dev"

# 获取java应用堆栈信息  
```shell script
kill -3 PID
```
>(1)如果项目通过Tomcat进行发布（普通的web项目），则对应的堆栈信息会打印在catalina.out文件中。  
>(2)如果项目是基于SpringBoot并且使用nohup java -jar xxx.jar & 命令运行，则java堆栈信息会在jar包所在的nohup.out文件中。  
```shell script
jstack -l 进程pid > /Users/icourt/Desktop/dump
```
堆转储文件
```shell script
jmap -dump:format=b,file=filename 进程pid
jmap -dump:format=b,file=cart.hprof 9441
```

查看java进程信息
```shell script
jps -l
```
查看该进程的所有线程信息
```shell script
top -H -p pid
```

[设置多个JDK环境变量](https://www.cnblogs.com/lukefan/archive/2019/02/19/10400427.html)

解压dididu war包
```shell script
jar -xvf dididu.war
```

## [线上故障排查](https://mp.weixin.qq.com/s/9fqrFiUJi0zzgJk0ziVIMA)  
### CPU 飚高  
1. 通过 top 命令找到 CPU 消耗最高的进程，并记住进程 ID。 
```shell script
top
``` 
2. 再次通过 top -Hp [进程 ID] 找到 CPU 消耗最高的线程 ID，并记住线程 ID.  
```shell script
top -Hp [进程 ID]
``` 
3. 通过 JDK 提供的 jstack 工具 dump 线程堆栈信息到指定文件中。具体命令：jstack -l [进程 ID] >jstack.log。  
```shell script
jstack -l [进程 ID] >jstack.log
``` 
4. 由于刚刚的线程 ID 是十进制的，而堆栈信息中的线程 ID 是16进制的，因此我们需要将10进制的转换成16进制的，并用这个线程 ID 在堆栈中查找。使用 printf "%x\n" [十进制数字] ，可以将10进制转换成16进制。  
```shell script
printf "%x\n" [十进制数字]
```
5. 通过刚刚转换的16进制数字从堆栈信息里找到对应的线程堆栈。就可以从该堆栈中看出端倪。 

### 内存问题排查 
```
outOfMemoryError 年老代内存不足。
outOfMemoryError:PermGen Space 永久代内存不足。
outOfMemoryError:GC overhead limit exceed 垃圾回收时间占用系统运行时间的98%或以上。
```
####  内存溢出
运行前添加好jvm参数，发生内存溢出时生成dump文件
-XX:+HeapDumpOnOutOfMemoryError 该参数作用是：在程序内存溢出时输出dump文件。
-XX:HeapDumpPath 该参数作用是：指定程序内存溢出输出dump文件路径
```shell script
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=D:\heapdump
```
运行时导出dump文件
```shell script
jmap -dump:format=b,file=filename 进程pid
jmap -dump:format=b,file=cart.hprof 9441
jmap -dump:format=b,file=/data/case-parse.hprof 1
jmap -dump:live,format=b,file=live.hprof 1
./root/mat/ParseHeapDump.sh live.hprof  org.eclipse.mat.api:suspects org.eclipse.mat.api:overview org.eclipse.mat.api:top_components

```
>其中dump:live表示活动的对象

分析dump文件
[](https://www.cnblogs.com/liangzs/p/8489321.html)

jmap出现问题Caused by: sun.jvm.hotspot.debugger.DebuggerException: cannot open binary file
[](https://xuwanjin.me/2018/03/30/java_command_jmap/)

然后使用dump 分析工具进行分析，比如常用的`MAT，Jprofile，jvisualvm` 等工具
####  内存没有溢出，但 GC 不健康
...

### hprof
#### 分析程序中哪块代码出现延时故障
```shell script
-agentlib:hprof=cpu=times,interval=10
```

### pidstat
#### 性能排查
-u:代表对cpu使用率的监控
参数1 3代表每秒采样一次，一共三次
-t:将监控级别细化到线程
```shell script
pidstat -p 17468 1 3 -u -t
```
结果中TID是线程ID（十进制），%usr表示用户线程使用率
```shell script
jstack -l 843 > /data/jstack.out
```
上面jstack.out中NID是TID的16进制表示
10进制855转换为16进制
```shell script
printf "%x\n" 855
```

# JVM启动必填参数
```shell script
# -XX:+HeapDumpOnOutOfMemoryError 该参数作用是：在程序内存溢出时输出dump文件。
# -XX:HeapDumpPath 该参数作用是：指定程序内存溢出输出dump文件路径
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/heapdump

# 远程调试
-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005

# 提高应用启动速度 https://hongjiang.info/jvm-random-and-entropy-source/
-Djava.security.egd=file:/dev/./urandom
```
