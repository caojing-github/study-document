#快捷键  
[选择文本](https://support.apple.com/zh-cn/guide/voiceover/mchlp2741/8/mac/10.13)  
选择从键盘光标到行开头或行结尾之间的文本
`Shift-Command-右箭头键：按下 或 Shift-Command-左箭头键`  

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
[MAC 添加环境变量](https://juejin.im/post/5da9da9d6fb9a04e0762e2a1)
若环境变量不生效，安装了zsh在 ~/.zshrc 中添加
```shell script
source ~/.bash_profile
```
然后在外面执行
```shell script
source ~/.bash_profile 或 source ~/.zshrc
```

[安装SSH](https://blog.csdn.net/yamaxifeng_132/article/details/54932873)

[安装mysql5.7](https://www.cnblogs.com/kimbo/p/8724595.html)  

[复制文件路径](https://www.zhihu.com/question/22883229)
```
选中该文件夹并右键（会弹出菜单），此时按下键盘上的“Option”按键同时点击菜单中的“拷贝XXXXX”
``` 
```
Option+Command+C
```

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
---
#Mac 制作 Ubuntu 18.04 启动盘
[安装文档](https://www.jianshu.com/p/0abdd301e0d6)  
// hdiutil convert -format UDRW -o (.img文件输出全路径) (.iso文件的全路径)
```shell script
hdiutil convert -format UDRW -o /Users/caojing/Downloads/ubuntu-18-04.img /Users/caojing/Downloads/ubuntu-18.04.3-desktop-amd64.iso
```
```shell script
diskutil list
```
```shell script
diskutil unmountDisk /dev/disk2
```
```shell script
sudo dd if=/Users/caojing/Downloads/ubuntu-18-04.img.dmg of=/dev/rdisk2 bs=1m
```
---
[磁盘管理工具 diskutil 介绍](https://www.jianshu.com/p/6a1f365617ad)   
eraseDisk 选项用于擦除整个磁盘并重新格式化  
```shell script
diskutil eraseDisk ExFAT 15110164590 disk2  
```


