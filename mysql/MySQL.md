### MySQL登录
```shell script
mysql -uroot -p123456 -P3308 -h192.168.1.7
SET PASSWORD FOR 'root'@'%' = PASSWORD('123456')
```
### 设置密码
```shell script
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');
flush privileges;
```
创建容器  
```shell script
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
docker run --name mysql5.6.42 -p 3306:3306 -e TZ='Asia/Shanghai' -e MYSQL_ROOT_PASSWORD=123456 caojing1/mysql:5.6.42
```
查看数据库  
```sql
show databases;
```

切换数据库  
```sql
use 数据库名;
```

`SQL_NO_CACHE`关键字来禁止缓存查询结果

LEFT JOIN 关键字会从左表 (table_name1) 那里返回所有的行，即使在右表 (table_name2) 中没有匹配的行
RIGHT JOIN 关键字会右表 (table_name2) 那里返回所有的行，即使在左表 (table_name1) 中没有匹配的行。

Navicat 设计表 `Ctrl + D`

[修改mysql默认字符集的方法](http://database.51cto.com/art/201010/229167.htm)

连接远程数据库  
`mysql -h 172.16.32.129 -P 3306 -u caidanmao -pcaidanmao`

-- 向表中插入某些字段  
`insert into 表 (字段1,字段2,字段3..) values  (值1,值2,值3..); `

--向表中插入所有字段,字段的顺序为创建表时的顺序
insert into 表 values (值1,值2,值3..);
	除了数值类型外，其它的字段类型的值必须使用引号引起。（建议单引号）
	如果要插入空值，可以不写字段，或者插入 null

--更新符号条件记录的指定字段
update 表名 set 字段名=值,字段名=值,... where 条件;
		除了数值类型外，其它的字段类型的值必须使用引号引起

delete from 表名 [where 条件];
或者
truncate table 表名;
	删除表中所有记录使用delete from 表名; 还是用truncate table 表名;
	删除方式：delete 一条一条删除，不清空auto_increment记录数。
	truncate 直接将表删除，重新建表，auto_increment将置为零，从新开始。

	
显示所有数据库	show databases;
显示所有表	show tables;

修改表的列
alter table t_book modify name varchar(22);

修改表的列名
alter table 表名 change 旧列名 新列名 类型(长度) 约束;

增加表的列
alter table table1 add id int unsigned not Null auto_increment primary key;

删除列
ALTER TABLE table_name DROP field_name;

修改表名
rename table 表名 to 新表名;

修改表的字符集
alter table 表名 character set 字符集;

查看MySQL内部设置的编码
show variables like 'character%'; 查看所有mysql的编码
设置MySql字符集方法
SET character_set_client = utf8mb4 ;  
SET character_set_connection = utf8mb4 ;  
SET character_set_database = utf8mb4 ;   
SET character_set_results = utf8mb4 ;    
SET character_set_server = utf8mb4 ;   

SET collation_connection = utf8mb4 ;  
SET collation_database = utf8mb4 ;   
SET collation_server = utf8mb4 ; 
编码快捷设置
set names utf8mb4;

模糊查询，Like语句中，%代表零个或多个任意字符，_代表一个字符

生成唯一值
SELECT UUID();

order by排序 
升序ASC【默认】 
降序DESC

删除记录
DELETE FROM table_name WHERE condition;

创建表之后，声明指定字段为主键
ALTER TABLE table_name ADD PRIMARY KEY (主键)
删除主键约束
ALTER TABLE table_name DROP PRIMARY KEY

增加唯一约束（允许多个字段）
alter table t_user_balance add UNIQUE KEY `user_balance` (`user_id`,`currency_id`);
删除唯一约束(如果添加唯一约束时，没有设置约束名称，默认是当前字段的字段名)
ALTER TABLE Persons DROP INDEX 约束名

聚合函数会忽略空值
DEFAULT 默认关键字

auto_increment（自动增长列）关键字，自动增长列类型必须是整形，自动增长列必须为键(一般是主键)
默认地，AUTO_INCREMENT 的开始值是 1，如果希望修改起始值，请使用下列 SQL 语法：	
ALTER TABLE Persons AUTO_INCREMENT=100

PRIMARY KEY 拥有自动定义的 UNIQUE 约束.每个表可以有多个 UNIQUE 约束，但是每个表只能有一个
PRIMARY KEY 约束

唯一约束与主键约束的区别：
主键：唯一、不能为空、一个表只能有一个主键，非业务数据
唯一：唯一、可以有空值，但只能有一个空值。一个表可以有多个唯一约束。

SELECT 字段1,字段2… FROM 表名GROUP BY分组字段 HAVING 分组条件;
分组操作中的having子语句，是用于在分组后对数据进行过滤的

having与where的区别:
	having是在分组后对数据进行过滤.
where是在分组前对数据进行过滤
	having后面可以使用分组函数(统计函数)
where后面不可以使用分组函数。

查看当前的事务隔离级别
SELECT @@TX_ISOLATION;

SELECT 字段1，字段2... FROM 表明 LIMIT M,N
M: 整数，表示从第几条索引开始，计算方式 （当前页-1）*每页显示条数
N: 整数，表示查询多少条数据

insert增加判定条件
insert into  tablename(属性1，属性2) select '值1','值2' from dual where exists (select 1 from tablename where 子句); 

示例语句 如果没该邮箱对应的用户ID就不向限制提现表插入数据
INSERT INTO withdraw_restrict(user_id,start_time,end_time,create_time)
SELECT  (SELECT user_id from t_user WHERE user_mail = #{userMail}),
		  #{startTime},
		  #{endTime},
		  now()
FROM DUAL where EXISTS (SELECT 1 from t_user WHERE user_mail = #{userMail})

数据库表中已有重复记录，添加唯一索引（tableA为表名、idx_col1_u为索引名，col1为索引列）
```sql
set old_alter_table = 1;
ALTER IGNORE TABLE tableA ADD UNIQUE INDEX idx_col1_u (col1)
```

显示哪些线程正在运行
```sql
SHOW PROCESSLIST
```
binlog 二进制日志
relaylog 中继日志

刚安装完后 mysql 的配置文件在/usr/share/mysql/my-default.cnf 拷贝到 /etc/my.cnf

查询表的DDL  
```sql
show create table equity_user;
```

删除索引 
```sql
alter table `equity_user` drop index `idx_id_number`;
``` 

按日期分组
```sql
SELECT DATE_FORMAT( gmt_create, '%Y-%m-%d' ) AS time,
    COUNT(id) AS total
FROM pusher_client_info
GROUP BY DATE_FORMAT( gmt_create, '%Y-%m-%d' )
```

[多数据源配置](https://blog.csdn.net/qq_37502106/article/details/91044952)








---
[日均 5 亿查询量的京东订单中心，为什么舍 MySQL 用 ES ?](https://mp.weixin.qq.com/s/Iyl8vYUpU8sFhYM_vsFTGQ)  
《阿里巴巴Java开发手册》提出单表行数超过500万行或者单表容量超过2GB，才推荐分库分表。

