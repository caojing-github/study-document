连接集群，-c代表集群  
```shell script
./redis-cli -h 192.168.203.141 -p 8001 -c
```
有密码连接
```shell script
redis-cli -h 172.16.85.111 -p 6379 -a ENvcxYwhGkWF8XrM
```
显示出各个节点的主从信息  
```shell script
cluster nodes
```
redis数据持久化方案
RDB 将内存中数据拷贝一份到硬盘
AOF 将redis的写操作命令保存到日志文件中

redis命令不区分大小写

查看redis安装目录
config get dir

Linux下以某一配置文件启动Redis
./redis-server redis.conf

windows底下远程连接redis（在redis目录下）
D:/redis-2.8.9>redis-cli -h 192.168.88.128 -p 6379

Linux下连接redis客户端
./redis-cli

ping一下,链接服务器

关闭redis-server
redis-cli shutdown
如果redis设置了密码，关闭redis-server
redis-cli -h host -p port -a passwd shutdown

退出客户端
QUIT

若不能远程访问
在redis.conf中将bind127.0.0.1注掉，将protected-mode设置为no

Redis中，一共有16个数据库，分别是0~15，一般情况下，进入数据库默认编号是0，如果我们要进入指定数据库，可以用select语句
切换到编号为3的数据库
select 3

返回当前数据库中所有key的数目
dbsize

删除当前数据库中的所有key
flushdb

清空所有数据库中的所有key
flushall

把当前数据库中的key即a转移到指定数据库8：move a 8
move a 8

删除key
del key

为给定key设置过期时间
expire key seconds

EXPIREAT的作用和EXPIRE类似，都用于为key设置过期时间。不同在于EXPIREAT命令接受的时间参数是UNIX时间戳(unix timestamp)
EXPIREAT key timestamp

PERSIST key 
移除 key 的过期时间，key将持久保持

KEYS pattern 
查找所有符合给定模式( pattern)的 key 。例如keys * 返回所有的key

PERSIST key 
移除key的过期时间，key将持久保持

PTTL key 
以毫秒为单位返回 key 的剩余的过期时间

TTL key 
以秒为单位，返回给定 key 的剩余生存时间(TTL, time to live)

RENAMENX key newkey 
仅当 newkey 不存在时，将 key 改名为 newkey 

RENAME key newkey 
修改 key 的名称

TYPE key
返回 key 所储存的值的类型

数据备份
save

数据恢复
只需将备份文件dump.rdb拷贝到redis的安装目录即可

关闭数据持久化
	修改配置文件，改完后重启  
		#save 900 1  
		#save 300 10  
		#save 60 10000
	或
	CONFIG SET save ""  无需重启即可生效

Redis支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及zset(sorted set：有序集合)
	String类型，一个键最大能存储512MB
	Hash类型，一个键值对集合，hash特别适合用于存储对象
		存值
		hset student1 name caojing
		hset student1 score 100
		取值
		hget student1 name
		hget student1 score
	hset&hget一次只能往哈希结构里面插入一个键值对，如果插入多个可以用hmset&hmget
		hmset student2 name caojing2 score 150
		hmget student2 name score
	LIST类型，列表最多可存储 232-1 元素 (4294967295, 每个列表可存储40多亿)
		往列表的前边插入
		lpush  list aa
		lpush  list bb
		lpush  list cc
		lrange后面的数字是范围（闭区间）
		lrange list 0 2
	Set是string类型的无序集合,集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是O(1)
		sadd color red
		sadd color yellow
		sadd color blue
		sadd color green
		sadd color black
		列举出集合中的元素
		smembers color
	zset有序集合,zset和set不同的地方在于zset关联一个double类型的分数，redis通过分数对集合中的元素排序
	zset的元素是唯一的，但是分数是可以重复的
		zadd ordered 1 small
		zadd ordered 5 middle
		zadd ordered 10 big
	查看元素
		ZRANGEBYSCORE ordered 0 1000
		
用于返回当前服务器时间
Time

用于获取 redis 服务的配置参数如daemonize
CONFIG GET dae*

用于设置 redis 服务的配置参数如daemonize
CONFIG SET daemonize yes
将上面所做的修改写入到redis.conf中
CONFIG REWRITE

Redis Debug Segfault 命令执行一个非法的内存访问从而让 Redis 崩溃，仅在开发时用于 BUG 调试
DEBUG SEGFAULT

返回关于 Redis 服务器的各种信息和统计数值
info
返回服务端信息
info server

用于实时打印出 Redis 服务器接收到的命令，调试用
MONITOR

Redis Incr 命令将 key 中储存的数字值增一。如果 key 不存在，那么 key 的值会先被初始化为 0 ，然后再执行 INCR 操作。
如果值包含错误的类型，或字符串类型的值不能表示为数字，那么返回一个错误。本操作的值限制在 64 位(bit)有符号数字表示之内。
INCR KEY_NAME

查看所有命令统计的快照，比如命令执行了多少次，执行命令所耗费的毫秒数(每个命令的总时间和平均时间)
INFO commandstats
重置，得到全新的统计结果
CONFIG RESETSTAT

---
[关于 Redis 的一些新特性、使用建议和最佳实践](https://mp.weixin.qq.com/s/Fwt_0QHfPhVVCVPJ3SfXjQ)
* 禁用keys  
通过rename-command来将一些类似的命令重命名，实现disable的效果  
* 选用lua script  
如果要保证多个操作的原子性，可以选择使用lua脚本  
* config set parameter value  
redis 2.0后提供了config set 命令来动态修改一些运行参数而不必重启redis，目前已经支持动态修改maxmemory，可以通过CONFIG GET * 查看支持动态修改的参数列表  
* 不滥用Lua Script 
由于Redis是单线程，在QPS很高的情况下，过多的lua脚本执行，特别是内部包含较多业务逻辑处理的情况下，会对Redis性能产生很大的影响。曾经参与过的直播业务的生产环境中，我们在Lua脚本中对送礼物触发的的积分和活动信息的有较多的逻辑处理（20行左右），导致Redis负载100%，所以在排查时Lua脚本有可能是负载较高的元凶之一。  
* y查看内存的分配和使用大小，碎片等情况  
info memory  
* 查看最近几条执行较慢的命令  
slowlog get N 
* 通过redis-cli --bigkeys 通过采样scan元素较多的key，不会一直阻塞redis执行  


		
		
		
	
		
		
	





