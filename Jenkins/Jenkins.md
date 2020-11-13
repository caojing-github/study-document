# docker安装
```shell script
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 -e TZ='Asia/Shanghai' -u root jenkins/jenkins:lts
```

Jenkins新建视图出错，解决方法在/var/lib/jenkins下修改jenkins.model.JenkinsLocationConfiguration.xml文件，将
jenkinsUrl那行注掉即可

# 不推荐docker安装，问题可能比较多，也没有需求  
[官网安装链接](https://pkg.jenkins.io/redhat-stable/)  

启动jenkins  
```shell script
sudo service jenkins start  
```
重启jenkins 
```shell script
sudo service jenkins restart 
```
# 解决jenkins下载插件比较慢
[相关链接](https://blog.csdn.net/qq_39653459/article/details/103585084?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task)  
更换下面
```shell script
/var/lib/jenkins/updates
```
的
```shell script
default.json
```

[Jenkins环境变量](http://172.16.71.3:8080/env-vars.html/) 

[jenkins+docker实现自动编译、打包、构建镜像、容器部署](https://blog.csdn.net/xiaoxiangzi520/article/details/88842200)      

示例  
```shell script
sudo docker build -t 172.16.71.2:5000/judgment-parse:$BUILD_NUMBER --build-arg JAR_FILE=target/judgment-parse-1.0-SNAPSHOT.jar .;
sudo docker push 172.16.71.2:5000/judgment-parse:$BUILD_NUMBER;
echo "docker run -it --rm -v /etc/hosts:/etc/hosts -v /data:/data -p 9090:8080 -e SPRING_PROFILES_ACTIVE=pro -e HANLP_ROOT=/data/hanlp ds2:5000/judgment-parse:$BUILD_NUMBER";
```

```shell script
# 杀死案例解析docker服务（案例解析docker服务占用的是9090端口）
docker ps | grep 9090 | awk '{print $1}' | xargs docker stop;
# 启动案例解析服务
docker run -it --rm -v /etc/hosts:/etc/hosts -v /data:/data -p 9090:8080 -e SPRING_PROFILES_ACTIVE=pro -e HANLP_ROOT=/data/hanlp ds2:5000/judgment-parse:$BUILD_NUMBER;
```

# 启动war包  
```shell script
nohup java -jar jenkins.war --httpPort=8081 > jenkins.log 2>&1 &
```

# 常见问题解决 
[sudo: no tty present and no askpass program specified](https://blog.csdn.net/qq_36792209/article/details/82695539?depth_1-utm_source=distribute.pc_relevant.none-task&utm_source=distribute.pc_relevant.none-task)  
[Http: server gave HTTP response to HTTPS client ](https://blog.csdn.net/liyin6847/article/details/90599612)  





