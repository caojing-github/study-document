Windows平台Maven默认编码为GBK,通过mvn -v可以看到。修改为UTF-8如下
	1 右键我的电脑，选择属性
	2 选择 高级系统设置
	3 在 高级 tab页下，点击环境变量按钮
	4 创建一个“用户变量”，变量名是MAVEN_OPTS 值为 -Xms256m -Xmx512m -Dfile.encoding=UTF-8

将文件夹打成war包，进入被打包文件夹,执行
jar -cvf dididu.war *
则文件夹被打包成Appr.war,位于该目录下

清理、编译、安装、打包
mvn clean compile install package -Dmaven.test.skip=true

清理、编译并跳过测试，-U强制去远程更新snapshot的插件或依赖，默认每天只更新一次
mvn clean compile -U -Dmaven.test.skip=true

发布
mvn deploy -U -Dmaven.test.skip=true

打包
```shell script
mvn clean package -Dmaven.test.skip=true
mvn clean package -U -Dmaven.test.skip=true
mvn clean package -Dmaven.test.skip=true
mvn clean package -Pproduction 以profile=product打包
```


-DskipTests，不执行测试用例，但编译测试用例类生成相应的class文件至target/test-classes下。
-Dmaven.test.skip=true，不执行测试用例，也不编译测试用例类。

查看当前项目的已解析依赖：
mvn dependency:list

查看当前项目的依赖树
mvn dependency:tree
打印当前项目的依赖树
mvn dependency:tree -Doutput=*.txt
查看某jar包引用
mvn dependency:tree -Dincludes=jar包名
查看jar包冲突、重复情况
mvn -Dverbose dependency:tree
查看某jar包冲突、重复情况
mvn dependency:tree -Dverbose -Dincludes=jar包名

用maven以debug模式跳过单元测试启动springboot应用
mvn spring-boot:run -Dmaven.test.skip=true -Ddebug

查看war插件命令详细参数情况
mvn war:help -Ddetail=true -Dgoal=exploded

查看插件详细信息
mvn help:describe -Dplugin=org.apache.tomcat.maven:tomcat7-maven-plugin -Ddetail=true

用tomcat7插件以指定配置文件启动项目
mvn tomcat7:run -Dspring.profiles.active=dev

多环境配置,tomcat catalina.sh中
JAVA_OPTS="-Dspring.profiles.active="dev"

clean package -Ptest -Dmaven.test.skip=true findbugs:findbugs

tomcat或java运行传入jvm参数
-Dspring.profiles.active=test

执行好使，可以传入参数
java -D"spring.profiles.active=test" -jar C:\Users\admin\Desktop\dididu-order-system\target\dididu-order-system.jar
打war包好使
mvn clean compile war:war -Dmaven.test.skip=true
打出可执行的jar包
mvn clean package -Dmaven.test.skip=true

mvn tomcat7:run -D"spring.profiles.active=test"

解决时间相差8小时
$JAVA_OPTS -Dfile.encoding=UTF8  -Duser.timezone=GMT+08

向私服上传jar包
```shell script
mvn deploy:deploy-file \
-DgroupId=com.icourt.cloud \
-DartifactId=fiscal-tax-api \
-Dversion=0.0.1-SNAPSHOT \
-Dpackaging=jar \
-Dfile=/Users/icourt/Desktop/fiscal-tax-api.jar \
-Durl=https://nexus3.alphalawyer.cn/repository/icourt-snapshots/ \
-DrepositoryId=icourt-snapshot
```




