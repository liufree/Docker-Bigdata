## 通过docker快速搭建大数据系统

## 进入到namenode节点
ssh namenode

## 
cd /opt/hadoop

## 清楚logs，namenode格式化
rm -r logs

bin/hdfs namenode -format


sbin/start-all.sh

# hive
bin/hadoop fs -mkdir       /tmp   
bin/hadoop fs -mkdir  -p  /user/hive/warehouse  
bin/hadoop fs -chmod g+w   /tmp   
bin/hadoop fs -chmod g+w   /user/hive/warehouse

# 开启metastore服务
cd /opt/hive
bin/hive --service metastore &

# 初始化
bin/schematool -dbType mysql -initSchema 

bin/hiveserver2 &   ## 后台启动 

bin/beeline -u jdbc:hive2://

# presto连接hive
presto

show schemas from hive;