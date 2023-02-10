dnf install -y nc

wait_for() {
  echo "Waiting $3" started, waiting for "$1" to listen on "$2"...
  while ! nc -z "$1" "$2"; do echo waiting...; sleep 2; done
}
# 开启sshd服务
/usr/sbin/sshd -D &
sleep 2

source /etc/profile
## 进入到namenode节点,su -不改变环境变量
su -
# ## 使用su环境变量会失效
source /etc/profile

sleep 2
# ssh namenode 
# sleep 2

## 
cd /opt/hadoop

## 清楚logs，namenode格式化
rm -r logs

bin/hdfs namenode -format
sleep 2

sbin/start-all.sh

wait_for namenode 9870 "hadoop-hdfs"

# hive
bin/hadoop fs -mkdir  -p   /user/hive/tmp   
bin/hadoop fs -mkdir  -p   /user/hive/warehouse  
bin/hadoop fs -mkdir  -p   /user/hive/log
bin/hadoop fs -chmod 777   /user/hive/tmp   
bin/hadoop fs -chmod 777   /user/hive/warehouse
bin/hadoop fs -chmod 777   /user/hive/log

cd /opt/hive
# 初始化
bin/schematool -dbType mysql -initSchema 
sleep 5

# 开启metastore服务
bin/hive --service metastore &
wait_for namenode 9083 "hive-metastore"

bin/hiveserver2 &   ## 后台启动 
wait_for namenode 10000 "hive-server2"

# 确保后台一直存在
sleep infinity
# bin/beeline -u jdbc:hive2://