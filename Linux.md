﻿查看操作系统信息  
```shell script
uname -a
```
显示当前目录下的所有文件及文件夹包括隐藏的.和..等的详细信息
```shell script
ls -al
```
设置环境变量
```shell script
sudo vi /etc/profile
export MAVEN_HOME=/usr/local/apache-maven-3.5.0
export PATH=$PATH:$MAVEN_HOME/bin
```
打印环境变量
```shell script
echo $JAVA_HOME
```
Linux不重启,使配置文件生效
```shell script
source /etc/profile 或 . /etc/profile
```
重启 
```shell script
reboot
```
关机
 ```shell script
halt
 ``` 
#权限
给目录或目录添加所有权限
```shell script
chmod 777 文件名或目录
```
创建centos7容器
docker run -itd --name centos7 -e TZ='Asia/Shanghai' centos:7 /bin/bash

Linux查看版本  cat /proc/version 或 cat /etc/issue 或 lsb_release-a
Centos查看系统版本 cat  /etc/redhat-release

查看健康检查 curl http://localhost:8092/health

启动jar包 java  -jar  *.jar   --spring.profiles.active=dev
更改tomcat端口号启动 java -jar *.jar --server.port=8080
查看当前项目中已启用和未启用的自动配置的报告 java -jar *.jar --debug

which 命令  用来查看当前要执行的命令所在的路径，如which grep
whichis 命令或文件  用来查看一个命令或者文件所在的路径

命令提示符列出目录	dir

压缩文件
tar -zcvf 文件名.tar 目录名
解压文件
tar -zxvf 文件名.tar

创建指定名称文件 touch 文件名

http://build2.hualala.com/view/%E5%BD%A9%E8%9B%8B%E7%8C%AB/
用户名:build 密码:build123!

在根目录下查找文件httpd.conf，表示在整个硬盘查找
find / -name httpd.conf

两种不同风格查看进程的方法
ps -ef  grep -i 进程名
ps aux | grep -i 进程名

jps	 查看java进程id

看整个服务器的实际物理内存
dmidecode -t memory | grep Size

在“一般模式”下，输入“:wq”，退出编辑
:q! 放弃修改
df -h 查看磁盘信息

ln -s 源文件/目录名  符号链接名，例如：
ln -s /usr/bin/python3.3 /usr/bin/python
进入软链接所对应的目录cd python

创建文件	vi 文件名	进入插入模式后，保存

删除文件	rm -rf 文件名
删除当前目录下的文件	rm -rf *

查找文件  find / -name mongodb
或
find . -type f -size +50M

查找某个路径下文件
find .jenkins/jobs/ -name "*1.0.0-SNAPSHOT.war"
find . -name mongodb
删除某一目录下的文件
find .jenkins/jobs/ -name "*1.0.0-SNAPSHOT.war"|xargs rm -rf
过滤文件后查找
find / -name jenkins | xargs grep "/usr/java/jdk1.8.0_181-amd64/bin" -n

查找并替换
find -name 'dididu_order_local.sh' | xargs perl -pi -e 's| /data|/home/server|g'

//查看当前目录下各个文件及目录占用空间大小
du -sh *

查看磁盘信息 df -h

搜索 /u01/app/oracle/oradata/prod/ 下，超过500M大小的文件
find /u01/app/oracle/oradata/prod/  -type f -size +500M

nohup java -jar caidanmao-service-advertisement-server-1.0.0-SNAPSHOT.jar --spring.profiles.active=dev&
nohup java -jar caidanmao-admin-api-1.0.0-SNAPSHOT.jar --spring.profiles.active=test&

在日志目录下查看日志 tail -f console.log或者tail -f *

显示日志文件的行数nohup.out
cat nohup.out |wc -l

删除前1000000行日志
sed -i '1,1000000d' nohup.out （d命令的意思是删除

cat /usr/local/tomcat_8001/logs/catalina.out |wc -l
sed -i '1,1000000d' /usr/local/tomcat_8001/logs/catalina.out

过滤access.log日志中包含关键字error的行
grep "flushLineServlet" -n /usr/local/tomcat6/logs/catalina.out
grep "不一致" -n /usr/local/tomcat_8001/logs/catalina.out
grep "2018-09-25 17:23:45,434" -n -B 20 /usr/local/tomcat_8001/logs/catalina.out
grep "Exception" -n /usr/local/tomcat-dididu-order-system/logs/catalina.out

过滤catalina.out日志文件1826行到1900行内容
sed -n 1826,1900p /usr/local/tomcat6/logs/catalina.out

查找并替换
find -name '要查找的文件名' | xargs perl -pi -e 's|被替换的字符串|替换后的字符串|g'

通过终端以root身份连接linux服务器192.168.1.123
ssh root@192.168.1.123

将本机公钥加入192.168.1.50主机,让192.168.1.50无秘钥访问本机
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.50

过滤命令
history | grep nginx

按递归方式保留原目录结构复制文件
cp -r /源文件或目录/目的文件或目录

查看所有端口占用情况
netstat -antu
查看端口占用PID
netstat -tunlp | grep 30004
查看PID占用进程
ps -aux | grep -v grep | grep 77859

修改host文件后重启网络服务
service network restart

将本机/opt拷贝到192.168.1.54 /目录
scp /opt 192.168.1.54:/

过滤查看某服务是否在开机启动服务里
systemctl list-unit-files | grep 服务名
systemctl list-unit-files | grep mysql

修改启动服务后，重新加载配置文件
systemctl daemon-reload

查看所有端口占用情况
netstat -ntlp

Centos7服务目录/usr/lib/systemd/system

启动一个服务：systemctl start firewalld.service
关闭一个服务：systemctl stop firewalld.service
重启一个服务：systemctl restart firewalld.service
显示一个服务的状态：systemctl status firewalld.service
在开机时启用一个服务：systemctl enable firewalld.service
在开机时禁用一个服务：systemctl disable firewalld.service
查看服务是否开机启动：systemctl is-enabled firewalld.service;echo $?
查看已启动的服务列表：systemctl list-unit-files|grep enabled

systemctl daemon-reload
systemctl start redis-server.service
systemctl enable redis-server.service

查看当前cpu的情况
top
查询某个PID进程内线程情况
top -H -p <pid>

打包 
```shell script
tar cvf FileName.tar DirName
```
解包
```shell script
tar xvf FileName.tar
```
Xshell下载文件sz 文件名
Xshell上传文件rz

ls（list）功能：列出目录内容
ls -l 列出文件详细信息,提供简化版命令 ll
ls -al 列出所有文件
 格式：ls [参数] [文件或目录]
 -a或--all   下所有文件和目录。注意隐藏文件、特殊目录、. 和 ..
 -l   使用详细格式列表。
 -t   用文件和目录的更改时间排序。
 -r 反向排序

mkdir（make directoriy）功能： 创建目录
	-p 父目录不存在情况下先生成父目录 （parents）
	-v	显示命令执行过程中的详细信息
 
cat（catenate）功能：显示文本文件内容

more功能：分页显示文件内容，还支持直接跳转行等功能。
	语法：more file 
	操作
	Enter    向下n行，需要定义。默认为1行
	空格键  向下滚动一屏 或 Ctrl+F
	B  返回上一屏 或 Ctrl+B
	q       退出more

less功能：分页显示文件内容，操作更详细。
	语法：less [参数] 文件
	-m  显示类似more命令的百分比
	-N  显示每行的行号
vim	操作
	空格键：前进一页 或 page down
	b：后退一页 或 page up
	d：前进半页
	u：后退半页
	回车键：前进一行 或 方向键向下
	y：后退一行	或 方向键向上
	/字符串：向下搜索
	?字符串：向上搜索
	v：进入vim编辑器
	左右方向键：相当于水平滚动条
	q：退出

tail功能： 用于显示指定文件末尾内容
	格式：tail[必要参数][选择参数][文件]
	-n<行数> 显示行数
	-f 循环读取

mv(move) 功能：移动或更名现有的文件或目录。
	语法：mv  [源文件或目录]	[目标文件或目录]
	-f或--force 　若目标文件或目录与现有的文件或目录重复，则直接覆盖现有的文件或目录。

rpm [参数] [软件]
	-v 　显示指令执行过程。
	-h或--hash 　套件安装时列出标记。
	-q 　使用询问模式，当遇到任何问题时，rpm指令会先询问用户。 
	-a 　查询所有套件。
	-i<套件档>或--install<套件档> 　安装指定的套件档。
	-U<套件档>或--upgrade<套件档>   升级指定的套件档。 
	-e<套件档>或--erase<套件档> 　删除指定的套件。
	--nodeps 　不验证套件档的相互关联性
	常用
		安装：rpm -ivh rpm文件【安装】 
		升级：rpm -Uvh rpm文件【更新】
		删除：rpm -e --nodeps 软件名
		查看：rpm -qa

使用 -p 参数。如果 mkdir 找不到父目录，那么这个参数会首先帮助创建父目录
如创建名为 letter 的目录，在它的目录下包含有子目录 important。那么语法会像这样子
mkdir -p letter/important  

在当前目录下查找大于100M的文件
```shell script
find ./ -size +100M
```

查看端口号8089占用进程
```shell script
lsof -i:8089
```
#启动程序
[linux后台启动程序脚本实例](https://www.cnblogs.com/donfaquir/p/10540816.html)  

让标准输出重定向到/dev/null中（丢弃标准输出），然后错误输出由于重用了标准输出的描述符，所以错误输出也被定向到了/dev/null中，错误输出同样也被丢弃了。执行了这条命令之后，该条shell命令将不会输出任何信息到控制台，也不会有任何信息输出到文件中[参考](https://www.cnblogs.com/ultranms/p/9353157.html) 
```shell script
>/dev/null 2>&1
```
nohup command &命令形式来启动一些后台程序，示例
```shell script
nohup java -jar xxxx.jar &
``` 
不让一些执行信息输出到控制台
```shell script
nohup java -jar xxxx.jar >/dev/null 2>&1 &
```







