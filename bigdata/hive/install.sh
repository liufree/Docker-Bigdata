#!/bin/bash
## Create by PcLiu at 2022/01/25

HIVE_VERSION="3.1.3"
HIVE_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

########################################################################################
#####################          Install  Bigdata Docker  Env        #####################
########################################################################################

# ssh localhost才能免密码访问

# hive

if [ ! -d "/opt/hive" ] ;then
    VERSION="$HIVE_VERSION"
    curl -fSL "$HIVE_URL" -o /tmp/hive.tar.gz 
    tar -xvf /tmp/hive.tar.gz -C /opt/
    ln -s "/opt/apache-hive-$HIVE_VERSION-bin"  /opt/hive
    rm /tmp/hive.tar.gz

    ln -s /opt/hive/conf /etc/hive

    # 替换guava文件
    curl -fSL "https://maven.aliyun.com/repository/central/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar" -o /tmp/guava-27.0-jre.jar
    rm /opt/hive/lib/guava-*.jar
    cp /tmp/guava-27.0-jre.jar /opt/hive/lib/

    curl -fSL "https://maven.aliyun.com/repository/central/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar" -o /tmp/mysql-connector-java-8.0.28.jar
    cp /tmp/mysql-connector-java-8.0.28.jar /opt/hive/lib/ 

    ## Set Hadoop System ENV
    echo "export HIVE_HOME=/opt/hive" >> /etc/profile
    echo "export PATH=$PATH:$HIVE_HOME/bin" >> /etc/profile
    echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:/opt/hive/lib" >> /etc/profile
    source /etc/profile

fi