Mac下自带apache   
查看版本 
```shell script
apachectl -v
```
* c 并发数
* -n 请求次数

```shell script
ab -c 10 -n 100  https://www.baidu.com/
```
![返回结果](file:///Users/icourt/IdeaProjects/study-document/img/ab_1.png)  
[返回结果具体释义](https://blog.csdn.net/wx19900503/article/details/56847264)  

```shell script
ab -c 500 -n 10000  -p /Users/icourt/IdeaProjects/study-document/压测/postJson.json -T application/json http://localhost:9186/pusher/api/v1/crm/saveFollow?id=aeb83a11f0b211e98ab27cd30aeb1494
```

```shell script
ab -p -c 10 -n 1 -H "token:eyJhbGciOiJIUzI1NiJ9.eyJvZmZpY2VfaWQiOiIxYTcxOGU4Y2ViZmExMWU5OGFiMjdjZDMwYWViMTQ5NCIsImRldmljZVR5cGUiOiJ4Y3giLCJvZmZpY2VfbmFtZSI6IuaOqOWuoiIsInVzZXJfaWQiOiIxYTZiN2Y1NmViZmExMWU5OGFiMjdjZDMwYWViMTQ5NSIsImxvZ2luVHlwZSI6IjEiLCJ1c2VyX25hbWUiOiLotLrnpLw1NTUiLCJpc3MiOiJmaXNjYWwtdGF4IiwiZXhwIjoxNTkwMzQ5NDYxNzg3LCJpYXQiOjE1NzIzNDk0NjE3ODcsIm9mZmljZVR5cGUiOm51bGx9.N-Ngpo1zUixNEwESSJVh2oL561Z4PXp1OUoAVwIwcpU" http://localhost:9186/pusher/api/v1/crm/getXcxClueList/false?pageIndex=1&pageSize=10
```