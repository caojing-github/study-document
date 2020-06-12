java –version
查看本机上所有已经安装成功的软件,只查看和java相关的
```shell script
rpm -qa | grep java
```
 
卸载open-jdk
```shell script
rpm -e --nodeps java-1.6.0-openjdk-1.6.0.35-1.13.7.1.el6_6.i686
rpm -e --nodeps java-1.7.0-openjdk-1.7.0.79-2.5.5.4.el6.i686
```

通过rpm安装jdk
```shell script
rpm -ivh jdk-14.0.1_linux-x64_bin.rpm
```
查看rpm安装的jdk位置
```shell script
rpm -ql jdk-14.0.1-14.0.1-ga.x86_64
```

将jdk压缩包进行解压
tar  -zxvf   jdk-7u71-linux-i586.tar.gz
 
yum install glibc.i686
(需要联网)
 
配置环境变量：
vim /etc/profile
 
在末尾行添加
#set java environment
JAVA_HOME=/usr/local/jdk1.8
CLASSPATH=.:$JAVA_HOME/lib.tools.jar
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME CLASSPATH PATH
保存退出
source /etc/profile  使更改的配置立即生效
java -version  查看JDK版本信息，如果显示出1.8.0证明成功