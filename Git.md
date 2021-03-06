查看远程分支
git remote show origin

查看stash列表
git stash list

将本地dev分支与远程dev分之关联，之后就可以使用git pull直接更新dev分支（前提在dev分支）
git branch --set-upstream-to=origin/dev dev
git push --set-upstream origin caojing_20191120_mall

Git还提供了一个stash功能，可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作：
git stash

恢复的同时把stash内容也删了
git stash pop  等价于 git stash apply 恢复 ，git stash drop 删除 两条命令

查看状态
git status

在Git中，用HEAD表示当前版本,上一个版本就是HEAD^

创建版本库
git init

添加到暂存区
git add .

强制将App.class添加到git
git add -f App.class

检查出哪个规则忽略了App.class文件
```shell script
git check-ignore -v App.class
```

提交加注释"fixed some bugs"
```shell script
git commit -m “fixed some bugs”
```

查看远程仓库的名称
```shell script
git remote
```
显示远程仓库更详细的信息
```shell script
git remote -v
```

删除已关联的远程仓库
```shell script
git remote rm origin 等价于  git remote remove origin
```

本地仓库关联远程仓库
```shell script
git remote add origin https://code.alphalawyer.cn/rd/icourt-case-parse.git
```

将所有远程主机的更新，全部取回本地
```shell script
git fetch
```

将dev远程分支的更新取回本地
```shell script
git fetch dev
```

更新远程分支列表
```shell script
git remote update origin --prune
```

克隆远程分支
```shell script
git clone git@git.hualala.com:CaiDanMao/caidanmao-api-portal.git
```

查看远程分支
```shell script
git branch -a
```

查看本地分支
```shell script
git branch
```

该分支与dev分支的差别
git diff dev	退出比较模式: q

显示出远程分支master和platform所有有差异的文件列表
git diff origin/master origin/platform --stat

显示出远程分支master和platform所有有差异的文件的详细差异
Git diff origin/master origin/platform

比较本地分支dev和远程分支master的差别
git diff dev origin/master

作用是checkout远程的dev分支，在本地起名为dev分支，并切换到本地的dev分支	
	git checkout -b dev origin/dev
创建dev分支，然后切换到dev分支
	git checkout -b dev		
以当前分支创建本地分支dev
	git branch dev

切换到master分支	
git checkout master

切换回dev分支
git checkout dev

删除远程分支dev
git push origin :dev   等价于   git push --delete origin dev

删除dev分支tag release-0.5.0	
git push origin :dev

删除本地分支dev 
git branch -D dev

将本地分支devel改为develop	
git branch -m devel develop

远程以master分支新建dev分支
	本地新建dev分支	git branch dev	前提：本地现在master分支
	本地dev分支推送到远程仓库 git push origin dev
	
如果当前分支只有一个追踪分支，连远程主机名都可以省略。
git pull
	
git pull 获取并合并其他的厂库，或者本地的其他分支
git pull <远程主机> <远程分支>:<本地分支>
	git pull origin dev:dev
如果省略本地分支，则将自动合并到当前所在分支上。如下：	
	git pull origin master
	
git push 使用本地的对应分支来更新对应的远程分支
	git push <远程主机名> <本地分支名>:<远程分支名>
如果省略远程分支名，则表示将本地分支推送与之存在”追踪关系”的远程分支(通常两者同名)，如果该远程分支不存在，则会被新建。
	git push origin dev
上面命令表示，将本地的dev分支推送到origin主机的dev分支。如果后者不存在，则会被新建。 
如果省略本地分支名，则表示删除指定的远程分支，因为这等同于推送一个空的本地分支到远程分支，这条命令是删除远程dev分支。
	git push origin :dev	等同于git push origin --delete dev
如果当前分支与远程分支之间存在追踪关系（即分支名相同），则本地分支和远程分支都可以省略。
	git push origin
上面命令表示，将当前分支推送到origin主机的对应分支。
如果当前分支只有一个追踪分支，那么主机名都可以省略。
	git push
如果远程主机的版本比本地版本更新，推送时Git会报错，要求先在本地做git pull合并差异，然后再推送到远程主机。这时，如果你一定要推送，可以使用–force选项。
	git push --force origin	

第一次将本地的master分支内容推送到远程新的master分支（远程库是空的）
git push -u origin master
	
在当前分支的基础上创建一个开发分支，并切换到该分支上，你将在该分支上coding
git branch develop; git checkout develop

查看标签
git tag

查看标签v0.9详情
git show v0.9

用于新建一个标签，默认为HEAD
git tag v0.9

打tag release-0.5.0和注释"正式版release-0.5.0"  用-a指定标签名，-m指定说明文字：
git tag -a release-0.5.0 -m “正式版release-0.5.0″

给commit id是6224937的commit打标签v0.9
git tag v0.9 6224937

删除本地标签
git tag -d release-0.5.0

提交所有tag至服务器端
git push origin --tags

push远程分支dev,注：该操作不会推送标签到服务器端
git push origin dev

推送某个标签v1.0到远程
git push origin v1.0

删除远端服务器的标签release-0.5.0
git push origin :refs/tags/release-0.5.0

删除不存在对应远程分支的本地分支
	查看远程分支状态
	git remote show origin若分支状态为stale则表示不存在对应远程分支,使用git remote prune origin
	可以将其从本地版本库中移除，更简单的方法git fetch -p

重命名远程分支dev重命名为develop分支
	删除远程分支git push --delete origin dev
	重命名本地分支git branch -m dev develop
	推送本地分支git push origin develop

显示最后一次提交日志
```shell script
git log -1
```
	
显示日志
```shell script
git log
```

显示精简版日志
```shell script
git log --pretty=oneline
```

显示每次命令的日志
git reflog

打印历史提交的commit id
git log --pretty=oneline --abbrev-commit

回退到当前版本
```shell script
git reset --hard HEAD
```
回退到上一个版本
git reset --hard HEAD^
回退到某个版本3628164（3628164是版本号，版本号没必要写全，前几位就可以了，Git会自动去找。
当然也不能只写前一两位，因为Git可能会找到多个版本号，就无法确定是哪一个了。
git reset --hard 3628164

把dev分支合并到master分支上
git merge dev

禁用Fast forward,把dev分支合并到master分支上
（用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。）
git merge --no-ff -m "merge with no-ff" dev

查看分支历史
git log --graph --pretty=oneline --abbrev-commit

长期存储密码(这样以后pull、push或其他操作不需要再输入密码)
git config --global credential.helper store

列出所有 Git 当时能找到的配置
git config --list

git rebase
	pick ：不做任何修改；
	reword：只修改提交注释信息；
	edit：修改提交的文件，做增补提交；
	squash：将该条提交合并到上一条提交，提交注释也一并合并；
	fixup：将该条提交合并到上一条提交，废弃该条提交的注释；


HEAD~2 表示合并最近两次的提交, 如果想合并最近三次的提交修改为: git rebase -i HEAD~3
git rebase -i HEAD~2
将最后的 pick改为 f，然后git push -f推到远程仓库


















