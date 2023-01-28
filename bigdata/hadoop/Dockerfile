FROM liufree/fedora:latest

LABEL Wenxiang Liu <liufreeo@gmail.com>

ADD install.sh /opt
RUN ["sh", "/opt/install.sh"]

COPY configs/core-site.xml /etc/hadoop/core-site.xml
COPY configs/hadoop-env.sh /etc/hadoop/hadoop-env.sh
COPY configs/hdfs-site.xml /etc/hadoop/hdfs-site.xml
COPY configs/mapred-site.xml /etc/hadoop/mapred-site.xml
COPY configs/yarn-site.xml /etc/hadoop/yarn-site.xml
COPY configs/workers /etc/hadoop/workers
