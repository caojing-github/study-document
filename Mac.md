剪切性粘贴
`OPTION+CMD+V`

录屏
`Shift+CMD+5`

强制刷新
`Shift+CMD+R`

翻页
`fn + 上下`

显示几个文件夹大小
`option+cmmand+i`

设置环境变量类似如下  
```shell script
sudo vi ~/.bash_profile
export MAVEN_HOME=/usr/local/apache-maven-3.5.0
export PATH=$PATH:$MAVEN_HOME/bin
```
使环境变量生效
```shell script
source ~/.bash_profile
```
[安装SSH](https://blog.csdn.net/yamaxifeng_132/article/details/54932873)

[安装mysql5.7](https://www.cnblogs.com/kimbo/p/8724595.html)  

复制文件路径  
`Option+Command+C`  

跳转目录  
`command+shift+G` 

[Homebrew从本地文件安装软件](https://blog.csdn.net/Piasy/article/details/44219237)  

#brew
列出已安装的软件
```shell script
brew list           
```
更新brew
```shell script
brew update     
```
用浏览器打开brew的官方网站
```shell script
brew home       
```
显示软件信息
```shell script
brew info         
```
显示包依赖
```shell script
brew deps        
```