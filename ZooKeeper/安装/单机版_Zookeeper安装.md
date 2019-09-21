1. 上传 zookeeper

2. 移动到/usr/local  
`mv zookeeper-3.4.6.tar.gz  /usr/local/`

3. 解压  
`tar -zxvf zookeeper-3.4.6.tar.gz`

4. 进入解压目录，创建data  
`cd zookeeper-3.4.6`  
`mkdir data`

5. 进入conf目录，把zoo_sample.cfg复制一份叫zoo.cfg  
`cd conf/`  
`cp zoo_sample.cfg zoo.cfg`

6. 修改zoo.cfg  
`vim zoo.cfg`  
修改属性：  
`dataDir=/usr/local/zookeeper-3.4.6/data` （新建的data目录所在的位置）

7. 进入bin目录启动zookeeper  
`pwd`  
`/usr/local/zookeeper-3.4.6/bin`  
`./zkServer.sh start`

查看状态  
`./zkServer.sh status`  
注意：zookeeper使用**2181**端口号，为了能正常使用zookeeper，我们需要打开**2181**端口号
或者关闭防火墙 `service iptables stop`

附：设置环境变量
```
export ZOOKEEPER_HOME=/Users/icourt/Downloads/zookeeper-3.4.6
export PATH=$PATH:$ZOOKEEPER_HOME/bin
```
