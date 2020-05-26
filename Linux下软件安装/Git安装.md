yum install git
查看git版本
git --version
卸载git
yum remove git

配置git全局用户名和email
git config –-global user.name “CaoJing”
git config –-global user.email “caojing@hualala.com”

注:如果你传递了 --global 选项，因为Git将总是会使用该信息来处理你在系统中所做的一切操作。如果你希望在一个特定的项目中使用不同的名称或e-mail地址，你可以在该项目中运行该命令而不要--global选项。

git创建SSH Key
```shell script
ssh-keygen -t rsa -C "caojing0229@foxmail.com"
```
系统会提示key的保存位置（默认是/root/.ssh目录）
//把显示的内容复制到GitHub(或GitLab)等的SSHkey配置即可
cat /root/.ssh/id_rsa.pub
如果不想以后pull、push、clone等操作输入密码，生成SSH Key的时候一路回车就好

==========================================================================================

Debian或Ubuntu Linux下安装
sudo apt-get install git

==========================================================================================
