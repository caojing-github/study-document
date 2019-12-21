前提已设置环境变量  
启动 
```shell script
zkServer.sh start
````  
查看服务状态 
```shell script
zkServer.sh status
``` 
停止服务 
```shell script
zkServer.sh stop
``` 
连接服务端示例 
```shell script
zkCli.sh -server localhost:2181
``` 