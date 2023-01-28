#!/bin/bash
## Create by PcLiu at 2022/01/25


HADOOP_VERSION="3.2.4"
HADOOP_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
HIVE_VERSION="3.2.4"
HIVE_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

########################################################################################
#####################          Install  Bigdata Docker  Env        #####################
########################################################################################

## Prepare System Env
if [ ! -f  "/opt/hadoop-$HADOOP_VERSION" ] ;then
  ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  echo "Asia/Shanghai" > /etc/timezone
  #rm -r ~/.ssh
  #ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa -q
  #cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  #chmod 600 ~/.ssh/authorized_keys
  echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

  # for ssh localhost
  #ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
  #ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
  #ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''
  
  # For root login
  #sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
  #sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  
  # 进去bash之后输入 /usr/sbin/sshd -D &

  ## Format
  # /opt/hadoop/bin/hdfs namenode -format
fi


echo "export JAVA_HOME=/usr/lib/jvm/java" >> /etc/profile
echo "export HDFS_NAMENODE_USER=root" >> /etc/profile
echo "export HDFS_DATANODE_USER=root" >> /etc/profile
echo "export HDFS_SECONDARYNAMENODE_USER=root" >> /etc/profile
echo "export YARN_RESOURCEMANAGER_USER=root" >> /etc/profile
echo "export YARN_NODEMANAGER_USER=root" >> /etc/profile
source /etc/profile

if [ ! -d "/opt/hadoop" ] ;then
    VERSION="$HADOOP_VERSION"
    curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz 
    tar -xvf /tmp/hadoop.tar.gz -C /opt/
    ln -s "/opt/hadoop-$VERSION"  /opt/hadoop
    rm /tmp/hadoop.tar.gz

    ln -s /opt/hadoop/etc/hadoop/ /etc/

    mkdir /opt/hadoop/logs
    mkdir /hadoop-data

    ## Set Hadoop System ENV
    echo "" >> /etc/profile
    echo "export HADOOP_HOME=/opt/hadoop" >> /etc/profile
    echo "export HADOOP_CONF_DIR=/etc/hadoop" >> /etc/profile
    echo "export PATH=\"\$PATH:/opt/hadoop/bin\"" >> /etc/profile
    echo "export PATH=\"\$PATH:/opt/hadoop/sbin\"" >> /etc/profile
    echo "" >> /etc/profile

    source /etc/profile
fi

## Format
/opt/hadoop/bin/hdfs namenode -format

# ssh localhost才能免密码访问
