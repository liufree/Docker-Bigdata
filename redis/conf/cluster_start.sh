# 建立集群

redis-cli --cluster create redis:6379  redis:6371  redis:6372 redis:6373 redis:6374  redis:6375  --cluster-replicas 3

# 查看集群当前状态
#随意进入一个容器内输入命令：

# redis-cli -a redispass --cluster info redis:6379