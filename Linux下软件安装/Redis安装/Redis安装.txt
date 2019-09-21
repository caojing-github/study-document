redis安装在Linux上，redis是c语言开发的，需要gcc-c++环境
查看是否安装gcc-c++
[root@caojing ~]# rpm -qa | grep gcc-c++
gcc-c++-4.4.7-17.el6.i686
 
如果没有安装，可以使用yum命令进行网络安装
[root@caojing ~]# yum install gcc-c++
[root@caojing ~]# tar -zxvf redis-3.0.2.tar.gz
 
进入解压的文件夹，进行编译
[root@caojing ~]# cd redis-3.0.2
[root@caojing redis-3.0.2]# make
执行安装，指定安装路径. PREFIX需要大写
[root@caojing redis-3.0.2]# make install PREFIX=/usr/local/redis

查看安装目录
[root@caojing redis-3.0.2]# cd /usr/local/redis/bin/

前端启动
启动命令
[root@caojing bin]# ./redis-server

后端启动
从安装包中复制redis.conf文件到/usr/local/redis/bin中
[root@caojing bin]# cp /root/redis-3.0.2/redis.conf ./

修改redis.conf配置文件，daemonize修改为yes
[root@caojing bin]# vim redis.conf

启动命令
[root@caojing bin]# ./redis-server redis.conf

查看启动效果：
[root@caojing bin]# ps -ef | grep redis

后台启动服务端的另一种方式
nohup redis-server &