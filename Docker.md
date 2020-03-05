安装
```shell script
yum install docker
```
查看版本号
```shell script
docker -v
```
开机启动
```shell script
systemctl enable docker.service
```
启动
```shell script
systemctl start docker.service
```
停止
```shell script
systemctl stop docker.service
```
重启
```shell script
systemctl restart docker.service
```
查看docker状态
systemctl status docker.service
查看docker概要信息
docker info
查看docker帮助文档
docker --help
列出镜像
docker images
	REPOSITORY：镜像所在的仓库名称
	TAG：镜像标签
	IMAGE ID：镜像ID
	CREATED：镜像的创建日期（不是获取该镜像的日期）
	SIZE：镜像大小
从镜像Ubuntu:12.04启动一个容器，而这个镜像的操作系统就是Ubuntu:12.04	
docker run --name custom_container_name –i –t docker.io/ubunto:12.04 /bin/bash

docker search ${name} 查找docker hub上的镜像
	NAME：仓库名称
	DESCRIPTION：镜像描述
	STARS：用户评价，反应一个镜像的受欢迎程度
	OFFICIAL：是否官方
	AUTOMATED：自动构建，表示该镜像由Docker Hub自动构建流程创建的

搜索centos镜像
docker search centos
搜索centos7镜像
docker search centos7
拉去centos7镜像
docker pull centos:7

添加USDC镜像仓库
	https://lug.ustc.edu.cn/wiki/mirrors/help/docker
	1、vi /etc/docker/daemon.json
	2、在i文件中添加
	{
		"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
	}
	3、重启docker服务，如果重启docker后无法加速，可以重新启动Linux
	systemctl restart docker.service
DaoCloud镜像仓库（需注册、每月限制10G）
	https://www.daocloud.io/mirror#accelerator-doc
	1、执行curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://{your_id}.m.daocloud.io
	上述命令注意替换your_id，另外命令实质是修改/usr/lib/systemd/system/docker.service加了个--registry-mirror参数
	2、重启加载配置
	systemctl daemon-reload
	systemctl restart docker
阿里云镜像加速器（比daocloud更麻烦）
	1、在该/usr/lib/systemd/system/docker.service中添加--registry-mirror=https://{your_id}.mirror.aliyuncs.com\
	2、重启加载配置
	systemctl daemon-reload
	systemctl restart docker
网易蜂巢镜像
	https://c.163.com/hub#/m/home/
	
删除指定镜像	
docker rmi $IMAGE_ID
删除所有镜像
docker rmi `docker images -q`
创建容器
	使用命令docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
	创建容器命令：docker run
	-i：表示以“交互模式”运行容器
	-t：表示容器启动后会进入其命令行。加入这两个参数后，容器创建就能登录进去。即分配一个伪终端。
	--name :为创建的容器命名。
	-v：表示目录映射关系（前者是宿主机目录，后者是映射到宿主机上的目录），可以使用多个－v做多个目录或文件映射。注意：最好做目录映射，在宿主机上做修改，然后共享到容器上。
	-d：在run后面加上-d参数,则会创建一个守护式容器在后台运行（这样创建容器后不会自动登录容器，如果只加-i -t两个参数，创建后就会自动进去容器）。
	-p：表示端口映射，前者是宿主机端口，后者是容器内的映射端口。可以使用多个－p做多个端口映射
	
	--rm: 那么当容器运行停止时会自动删除容器以及容器所挂载的volume

创建容器，（前端启动，退出就会关闭容器）用版本为7（如果centos:7是centos表示最新的）centos的镜像centos创建了名为caojing的容器
```shell script
docker run -it --name caojing centos:7 /bin/bash
```
创建容器，后端启动（不登录进容器,-e TZ='Asia/Shanghai'表示时区）
```shell script
docker run -itd --name centos7 -e TZ='Asia/Shanghai' centos:7 /bin/bash
```
查看正在运行的容器
```shell script
docker ps
```
查看所有容器
```shell script
docker ps -a
```
查看最后一个运行的容器
docker ps -l
登录容器(exit后不会关闭容器)
docker exec -it container_name 或者 container_id  /bin/bash
获取docker容器的root权限
docker exec -ti -u root container_id bash
docker exec -ti -u jenkins container_id bash

登录容器(exit后会关闭容器)
docker attach container_name 或者 container_id
退出容器
exit
容器重命名
docker rename 原名称 新名称
启动容器
docker start $CONTAINER_NAME或$CONTAINER_ID
关闭容器
docker stop $CONTAINER_NAME或$CONTAINER_ID
删除容器
docker rm $CONTAINER_NAME或$CONTAINER_ID
删除所有容器
docker rm `docker ps -a -q`
查看容器参数
docker inspect $CONTAINER_NAME或$CONTAINER_ID
查看容器具体参数
docker inspect -f='{{.NetworkSettings.IPAddress}}' $CONTAINER_NAME或$CONTAINER_ID
从宿主机复制jdk到容器中
docker cp jdk-7u75-linux-x64.tar.gz mycentos:/
配置环境变量（在文件末尾追加）
export JAVA_HOME=/usr/local/jdk7
export PATH=$PATH:$JAVA_HOME/bin
注意:要source
将容器打包成镜像(IMAGE_ID为小写)
docker commit $CONTAINER_NAME或$CONTAINER_ID $IMAGE_ID
docker commit -m=$MESSAGE -a=$AUTHOR $CONTAINER_ID $REPOSITORY:$TAG
	-m:提交的描述信息
	-a:指定镜像作者
	$CONTAINER_ID：容器ID
	$REPOSITORY:$TAG:仓库名:标签
示例 docker commit -m="has update" -a="runoob" e218edb10161 runoob/ubuntu:v2
	 runoob@runoob:~$ docker images
	 REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	 runoob/ubuntu       v2                  70bf1840fd7c        15 seconds ago      158.5 MB

docker commit -m="Sonar database has been included" -a="caojing" cf7be525cf8b caojing1/mysql:5.6.42	 
	 
将镜像打包
docker save mytomcat7 > /root/名称.tar.gz
示例:
	 docker commit mycentos mytomcat7
	 docker save mytomcat7 > /root/tomcat7.tar.gz
加载镜像
docker load < /root/名称.tar.gz
示例:
	docker load < /root/tomcat7.tar.gz
将host的8888端口映射到容器的8080端口，使用-p参数做映射
示例：docker run -dit --name tomcat2 -p 8888:8080 mytomcat7 /bin/bash

启动全部容器
docker start `docker ps -a -q`

注册Docker Hub后，linux登录Docker Hub
docker login
打tag
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]，示例：
docker tag mytomcat7 2078068092/mytomcat7
push镜像
docker push 2078068092/mytomcat7/:latest

windows docker仓库配置文件，示例 C:\Users\CaoJing\.docker\daemon.json
用docker启动官方镜像
docker run -itd --name centos7 -p 22:22 -e TZ='Asia/Shanghai' centos:7 /bin/bash
docker run --name redis -v /data:/data -p 6379:6379 -e TZ='Asia/Shanghai' -e TZ='Asia/Shanghai' -d redis
注：https://hub.docker.com/_/redis/
docker run --name mysql5.6.42 -v /var/lib/mysql:/var/lib/mysql -p 3306:3306 -e TZ='Asia/Shanghai' -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6.42
注:	https://hub.docker.com/_/mysql/

docker run --name sonarqube --link mysql5.6.42 -v /opt/sonarqube/data:/opt/sonarqube/data -e TZ='Asia/Shanghai' -e SONARQUBE_JDBC_USERNAME=root -e SONARQUBE_JDBC_PASSWORD=123456 -e SONARQUBE_JDBC_URL="jdbc:mysql://mysql5.6.42:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false" -p 9000:9000 -d sonarqube
docker run --name zookeeper -v /dockerMapping/zookeeper/data:/data -v /dockerMapping/zookeeper/datalog:/datalog -v /dockerMapping/zookeeper/logs:/logs -e TZ='Asia/Shanghai' --restart always -d zookeeper

**注意**：以后做docker目录映射时统一为
-v dockerMapping/$CONTAINER_NAME/要映射的目录:要映射的目录

实时查看docker容器日志
docker logs -f -t --since="2017-05-31" --tail=10 容器名
示例 docker logs -f -t --tail 20 sonarqube

--since : 此参数指定了输出日志开始日期，即只输出指定日期之后的日志。
-f : 查看实时日志
-t : 查看日志产生的日期
-tail=10 : 查看最后的10条日志。

docker run -it --rm -p 8080:8080 tomcat:8.5





	
=========================================================================================================
Private Registry（私有仓库）是开发者或者企业自建的镜像存储库，通常用来保存企业内部的 Docker 镜像，用于内部开发流程和产品的发布、版本控制。
Mirror是一种代理中转服务，我们(比如daocloud)提供的Mirror服务，直接对接Docker Hub的官方Registry。Docker Hub 上有数以十万计的各类 Docker 镜像
在使用Private Registry时，需要在Docker Pull 或Dockerfile中直接键入Private Registry 的地址，通常这样会导致与 Private Registry 的绑定，缺乏灵活性。
使用 Mirror 服务，只需要在 Docker 守护进程（Daemon）的配置文件中加入 Mirror 参数，即可在全局范围内透明的访问官方的 Docker Hub，避免了对 Dockerfile 镜像引用来源的修改。
简单来说，Mirror类似CDN，本质是官方的cache；Private Registry类似私服，跟官方没什么关系。对用户来说，由于用户是要拖docker hub上的image，对应的是Mirror。yum/apt-get的Mirror又有点不一样，它其实是把官方的库文件整个拖到自己的服务器上做镜像，并定时与官方做同步；而Docker Mirror只会缓存曾经使用过的image。


# 常见问题解决  



