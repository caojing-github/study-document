设置提交时必须加注释  
1、在项目所在的hooks文件下修改`pre-commit.tmpl`为`pre-commit.tmpl.bak`  
`mv pre-commit.tmpl pre-commit.tmpl.bak`

2、然后新建pre-commit文件，粘贴如下内容
```
#!/bin/sh

REPOS="$1"
TXN="$2"

SVNLOOK=/usr/bin/svnlook
$SVNLOOK log -t "$TXN" "$REPOS" | \
   grep "[a-zA-Z0-9]" > /dev/null

GREP_STATUS=$?
if [ $GREP_STATUS -ne 0 ]
then
    echo "提交文件必须添加注释,养成良好的开发习惯!!" 1>&2
    echo "最好编译过再提交,我的程序员小哥哥" 1>&2
    echo "Your commit has been blocked because you didn't give any log message" 1>&2
    echo "Please write a log message describing the purpose of your changes and" 1>&2
    echo "then try committing again. -- Thank you" 1>&2
    exit 1
fi
exit 0
```
3、赋予pre-commit文件权限
`chmod 777 pre-commit`
