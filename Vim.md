命令模式下，进入命令模式 ESC

强制保存  
```shell script
:wq!
```
下一页
```shell script
ctrl + f
```
上一页
```shell script
ctrl + b 
```
删除光标所在行
```shell script
dd
```
单行复制
```shell script
yy
```

撤销	u
重做	ctrl+r
向后搜索字符串pattern /pattern
向前搜索字符串pattern ?pattern
n 下一个匹配(如果是/搜索，则是向下的下一个，?搜索则是向上的下一个)
N 上一个匹配(同上)

搜索整个文件，将所有的old替换为new
:%s/old/new/g
搜索整个文件，将所有的old替换为new，每次都要你确认是否替
:%s/old/new/gc
查找光标所在处的单词，向下查找7
*
查找光标所在处的单词，向上查找
# 

强制退出，放弃修改
:q!
自动排版
gg=G
跳至文首
gg
调至文尾
G 或者 shift + g
调至第5行
5G

设置行号
:set nu　　　　

命令模式进入末行模式:":"
